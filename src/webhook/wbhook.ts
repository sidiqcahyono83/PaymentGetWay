import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import crypto from "crypto";
import { coreApi, snap } from "../util/midtrans";
import {
  PaymentStatus,
  InvoiceStatus,
  PaymentGateway,
} from "../../generated/prisma/client";

const app = new Hono();

// --- 1. ENDPOINT: BUAT PEMBAYARAN / SNAP TOKEN ---
app.post("/payments/charge", async (c) => {
  try {
    const { invoiceId } = await c.req.json();

    if (!invoiceId) {
      return c.json({ message: "invoiceId wajib diisi" }, 400);
    }

    // Ambil data Invoice beserta Customer
    const invoice = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: { customer: true },
    });

    if (!invoice) {
      return c.json({ message: "Invoice tidak ditemukan" }, 404);
    }

    if (invoice.status === InvoiceStatus.PAID) {
      return c.json({ message: "Invoice ini sudah lunas" }, 400);
    }

    // Format unique order_id untuk Midtrans
    const orderId = `${invoice.id}-${Date.now()}`;

    // Parameter transaksi Midtrans (Gunakan 'order_id' snake_case)
    const parameter = {
      transaction_details: {
        order_id: orderId, // FIX: Wajib order_id (snake_case)
        gross_amount: Number(invoice.total),
      },
      customer_details: {
        first_name: invoice.customer.fullname,
        email: invoice.customer.email || undefined,
        phone: invoice.customer.phoneNumber || undefined,
      },
      item_details: [
        {
          id: invoice.id,
          price: Number(invoice.total),
          quantity: 1,
          name: `Pembayaran Internet - ${invoice.customer.fullname}`,
        },
      ],
    };

    // Minta Snap Token dari Midtrans
    const transaction = await snap.createTransaction(parameter);

    // Simpan data Payment ke Prisma (Gunakan field 'gatewayTransactionId')
    const payment = await prisma.payment.create({
      data: {
        orderId: orderId, // FIX: Menyesuaikan schema Prisma
        amount: invoice.total,
        method: "VIRTUAL_ACCOUNT",
        gateway: PaymentGateway.MIDTRANS,
        status: PaymentStatus.PENDING,
        snapToken: transaction.token,
        paymentUrl: transaction.redirect_url,
        invoiceId: invoice.id,
        customerId: invoice.customerId,
      },
    });

    return c.json({
      message: "Snap token berhasil dibuat",
      token: transaction.token,
      redirect_url: transaction.redirect_url,
      payment,
    });
  } catch (error) {
    console.error("Error charging payment:", error);
    return c.json(
      { message: "Gagal membuat transaksi pembayaran", error: String(error) },
      500,
    );
  }
});

// --- 2. ENDPOINT: WEBHOOK NOTIFIKASI DARI MIDTRANS ---
app.post("/payments/notification", async (c) => {
  try {
    const notificationJson = await c.req.json();

    // Payload asli dari Midtrans menggunakan 'order_id'
    const orderId = notificationJson.order_id;
    const transactionStatus = notificationJson.transaction_status;
    const fraudStatus = notificationJson.fraud_status;

    if (!orderId) {
      return c.json({ message: "Invalid payload: missing order_id" }, 400);
    }

    // Pemetaan status Midtrans ke Enum PaymentStatus Prisma
    let targetPaymentStatus: PaymentStatus = PaymentStatus.PENDING;
    let isPaid = false;

    if (transactionStatus === "capture") {
      if (fraudStatus === "accept") {
        targetPaymentStatus = PaymentStatus.SUCCESS;
        isPaid = true;
      } else {
        targetPaymentStatus = PaymentStatus.PENDING;
      }
    } else if (transactionStatus === "settlement") {
      targetPaymentStatus = PaymentStatus.SUCCESS;
      isPaid = true;
    } else if (transactionStatus === "cancel" || transactionStatus === "deny") {
      targetPaymentStatus = PaymentStatus.FAILED;
    } else if (transactionStatus === "expire") {
      targetPaymentStatus = PaymentStatus.EXPIRED;
    } else if (transactionStatus === "pending") {
      targetPaymentStatus = PaymentStatus.PENDING;
    }

    // Jalankan pembaruan data secara atomic
    await prisma.$transaction(async (tx) => {
      // 1. Cari data Payment berdasarkan gatewayTransactionId
      const existingPayment = await tx.payment.findFirst({
        where: { orderId: orderId }, // FIX: Menyesuaikan schema Prisma
        include: {
          invoice: {
            include: { customer: true },
          },
        },
      });

      if (!existingPayment) {
        console.warn(
          `Payment dengan gatewayTransactionId: ${orderId} tidak ditemukan.`,
        );
        return;
      }

      // Hindari pemrosesan ulang jika sudah SUCCESS
      if (existingPayment.status === PaymentStatus.SUCCESS) {
        return;
      }

      const transactionDate = new Date();

      // 2. Update status Payment
      const updatedPayment = await tx.payment.update({
        where: { id: existingPayment.id },
        data: {
          status: targetPaymentStatus,
          paidAt: isPaid ? transactionDate : null,
        },
      });

      // 3. Jika LUNAS (SUCCESS)
      if (isPaid && updatedPayment) {
        // A. Update Invoice -> PAID
        const invoice = await tx.invoice.update({
          where: { id: updatedPayment.invoiceId },
          data: {
            status: InvoiceStatus.PAID,
            paidAt: transactionDate,
          },
        });

        // B. Aktifkan kembali Customer
        await tx.customer.update({
          where: { id: invoice.customerId },
          data: { status: "ACTIVE" },
        });

        // C. Cari User Admin default jika createdById kosong (Auto Gateway)
        let systemUserId = existingPayment.createdById;
        if (!systemUserId) {
          const defaultAdmin = await tx.user.findFirst();
          systemUserId = defaultAdmin?.id ?? null;
        }

        // D. Buat Catatan Pendapatan jika ada User terasosiasi
        if (systemUserId) {
          const newPendapatan = await tx.pendapatan.create({
            data: {
              paymentId: updatedPayment.id,
              userId: systemUserId,
              total: updatedPayment.amount,
              deskripsi: `Pembayaran Gateway (${updatedPayment.gateway}) Invoice #${existingPayment.invoice.invoiceNumber} - ${existingPayment.invoice.customer.fullname}`,
            },
          });

          // E. Update / Buat Buku Kas Hari Ini
          const todayStart = new Date(transactionDate);
          todayStart.setHours(0, 0, 0, 0);

          const todayEnd = new Date(transactionDate);
          todayEnd.setHours(23, 59, 59, 999);

          let bukuKas = await tx.bukuKas.findFirst({
            where: {
              userId: systemUserId,
              tanggal: { gte: todayStart, lte: todayEnd },
            },
          });

          if (bukuKas) {
            await tx.bukuKas.update({
              where: { id: bukuKas.id },
              data: {
                totalMasuk: { increment: updatedPayment.amount },
                saldoAkhir: { increment: updatedPayment.amount },
                pendapatan: { connect: { id: newPendapatan.id } },
              },
            });
          } else {
            const lastKas = await tx.bukuKas.findFirst({
              where: { userId: systemUserId },
              orderBy: { createdAt: "desc" },
            });
            const saldoAwal = lastKas?.saldoAkhir ?? 0;

            await tx.bukuKas.create({
              data: {
                userId: systemUserId,
                tanggal: transactionDate,
                totalMasuk: updatedPayment.amount,
                totalKeluar: 0,
                saldoAkhir: saldoAwal + updatedPayment.amount,
                deskripsi: "Pencatatan Pemasukan Otomatis Midtrans",
                keterangan: "Midtrans Auto-Settlement",
                pendapatan: { connect: { id: newPendapatan.id } },
              },
            });
          }
        }
      }
    });

    return c.json({ message: "Notification processed successfully" }, 200);
  } catch (error) {
    console.error("Error processing Midtrans notification:", error);
    return c.json({ message: "Failed to process notification" }, 500);
  }
});

// NOTE: checkUserToken() dilepas karena webhook dipanggil oleh Payment Gateway dari luar
app.post("/webhook", async (c) => {
  try {
    const body = await c.req.json();

    // Payload standar dari gateway
    const { paymentId, transactionStatus } = body;

    if (!paymentId) {
      return c.json({ success: false, message: "Invalid payload." }, 400);
    }

    // 1. Ambil Payment beserta relasinya
    const payment = await prisma.payment.findUnique({
      where: { id: paymentId },
      include: {
        invoice: {
          include: { customer: true },
        },
      },
    });

    if (!payment) {
      return c.json(
        { success: false, message: "Payment tidak ditemukan." },
        404,
      );
    }

    // Hindari pemrosesan ulang jika transaksi sudah lunas/sukses
    if (payment.status === PaymentStatus.SUCCESS) {
      return c.json({
        success: true,
        message: "Payment sudah diproses sebelumnya.",
      });
    }

    // 2. Jika Pembayaran Berhasil (SUCCESS / SETTLEMENT)
    if (transactionStatus === "SUCCESS" || transactionStatus === "SETTLEMENT") {
      const transactionDate = new Date();

      const targetUserId = payment.createdById ?? "clx_admin_system_default";

      await prisma.$transaction(async (tx) => {
        // A. Update Status Payment -> SUCCESS
        await tx.payment.update({
          where: { id: payment.id },
          data: {
            status: PaymentStatus.SUCCESS,
            paidAt: transactionDate,
          },
        });

        // B. Update Status Invoice -> PAID
        await tx.invoice.update({
          where: { id: payment.invoiceId },
          data: {
            status: "PAID",
            paidAt: transactionDate,
          },
        });

        // C. Buat Record Pendapatan
        const newPendapatan = await tx.pendapatan.create({
          data: {
            paymentId: payment.id,
            userId: targetUserId,
            total: payment.amount,
            deskripsi: `Pembayaran Gateway (${payment.gateway}) Invoice #${payment.invoice.invoiceNumber} - ${payment.invoice.customer.fullname}`,
          },
        });

        // D. Hitung Rentang Tanggal Harian
        const todayStart = new Date(transactionDate);
        todayStart.setHours(0, 0, 0, 0);

        const todayEnd = new Date(transactionDate);
        todayEnd.setHours(23, 59, 59, 999);

        // Cari Buku Kas hari ini untuk targetUserId
        let bukuKas = await tx.bukuKas.findFirst({
          where: {
            userId: targetUserId,
            tanggal: { gte: todayStart, lte: todayEnd },
          },
        });

        if (bukuKas) {
          // Update Buku Kas yang sudah ada
          await tx.bukuKas.update({
            where: { id: bukuKas.id },
            data: {
              totalMasuk: { increment: payment.amount },
              saldoAkhir: { increment: payment.amount },
              pendapatan: { connect: { id: newPendapatan.id } },
            },
          });
        } else {
          // Jika belum ada, cari saldo kas hari sebelumnya
          const lastKas = await tx.bukuKas.findFirst({
            where: { userId: targetUserId },
            orderBy: { createdAt: "desc" },
          });
          const saldoAwal = lastKas?.saldoAkhir ?? 0;

          // Buat entri Buku Kas baru
          await tx.bukuKas.create({
            data: {
              userId: targetUserId,
              tanggal: transactionDate,
              totalMasuk: payment.amount,
              totalKeluar: 0,
              saldoAkhir: saldoAwal + payment.amount,
              deskripsi: "Pencatatan Pemasukan Otomatis Gateway",
              keterangan: "Payment Gateway Auto-Settlement",
              pendapatan: { connect: { id: newPendapatan.id } },
            },
          });
        }

        // E. Aktifkan Customer jika statusnya belum ACTIVE
        if (payment.invoice.customer.status !== "ACTIVE") {
          await tx.customer.update({
            where: { id: payment.invoice.customerId },
            data: { status: "ACTIVE" },
          });
        }
      });

      return c.json({
        success: true,
        message: "Webhook berhasil diproses, pembayaran lunas.",
      });
    }

    // 3. Jika Pembayaran Kadaluarsa / Gagal
    if (transactionStatus === "EXPIRED" || transactionStatus === "FAILED") {
      await prisma.payment.update({
        where: { id: payment.id },
        data: { status: PaymentStatus.FAILED },
      });

      return c.json({
        success: true,
        message: "Status payment diperbarui menjadi FAILED.",
      });
    }

    return c.json({ success: true, message: "Webhook diterima." });
  } catch (err: any) {
    console.error("Webhook Error:", err);
    return c.json(
      { success: false, message: err.message || "Error webhook." },
      500,
    );
  }
});

export default app;
