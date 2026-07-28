import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import crypto from "crypto";
import { coreApi, snap } from "../util/midtrans";
// FIX: Hapus kata 'type' agar Enum bisa digunakan sebagai JavaScript Object/Value
import { PaymentStatus } from "../../generated/prisma/client";

const app = new Hono();

// --- 1. ENDPOINT: BUAT PEMBAYARAN / SNAP TOKEN ---
app.post("/payments/charge", async (c) => {
  try {
    const { invoiceId } = await c.req.json();

    if (!invoiceId) {
      return c.json({ message: "invoiceId wajib diisi" }, 400);
    }

    // Ambil data Invoice beserta Customer & Paket
    const invoice = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: { customer: true },
    });

    if (!invoice) {
      return c.json({ message: "Invoice tidak ditemukan" }, 404);
    }

    if (invoice.status === "PAID") {
      return c.json({ message: "Invoice ini sudah lunas" }, 400);
    }

    // Format unique order_id untuk Midtrans (misal: INV123-168000000)
    const orderId = `${invoice.id}-${Date.now()}`;

    // Parameter transaksi Midtrans
    const parameter = {
      transaction_details: {
        order_id: orderId,
        gross_amount: Number(invoice.total), // Jumlah tagihan
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

    // Saat simpan data Payment
    const payment = await prisma.payment.create({
      data: {
        gatewayTransactionId: orderId,
        amount: invoice.total,
        method: "VIRTUAL_ACCOUNT",
        gateway: "MIDTRANS",
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
      500
    );
  }
});

// --- 2. ENDPOINT: WEBHOOK NOTIFIKASI DARI MIDTRANS ---
app.post("/payments/notification", async (c) => {
  try {
    const notificationJson = await c.req.json();
    const statusResponse = await coreApi.transaction.notification(
      notificationJson
    );

    const orderId = statusResponse.order_id;
    const transactionStatus = statusResponse.transaction_status;
    const fraudStatus = statusResponse.fraud_status;

    // Ekstrak invoiceId jika orderId kamu menggunakan format "INVOICE_ID-TIMESTAMP"
    const invoiceId = orderId.split("-")[0];

    // Pemetaan status Midtrans ke Enum PaymentStatus Prisma
    let paymentStatus: PaymentStatus = PaymentStatus.PENDING;
    let isPaid = false;

    if (transactionStatus === "capture") {
      if (fraudStatus === "accept") {
        paymentStatus = PaymentStatus.SUCCESS;
        isPaid = true;
      } else {
        paymentStatus = PaymentStatus.PENDING;
      }
    } else if (transactionStatus === "settlement") {
      paymentStatus = PaymentStatus.SUCCESS;
      isPaid = true;
    } else if (transactionStatus === "cancel" || transactionStatus === "deny") {
      paymentStatus = PaymentStatus.FAILED;
    } else if (transactionStatus === "expire") {
      paymentStatus = PaymentStatus.EXPIRED;
    } else if (transactionStatus === "pending") {
      paymentStatus = PaymentStatus.PENDING;
    }

    // Jalankan pembaruan data secara atomic
    await prisma.$transaction(async (tx) => {
      // 1. Update Payment berdasarkan gatewayTransactionId
      await tx.payment.updateMany({
        where: {
          gatewayTransactionId: orderId,
        },
        data: {
          status: paymentStatus,
          paidAt: isPaid ? new Date() : null,
        },
      });

      // 2. Jika LUNAS, perbarui Invoice dan Customer
      if (isPaid) {
        const invoice = await tx.invoice.update({
          where: { id: invoiceId },
          data: {
            status: "PAID",
            paidAt: new Date(),
          },
        });

        // Aktifkan kembali customer
        await tx.customer.update({
          where: { id: invoice.customerId },
          data: { status: "ACTIVE" },
        });
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
        404
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
      500
    );
  }
});

export default app;
