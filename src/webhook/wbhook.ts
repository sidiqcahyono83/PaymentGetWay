import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import {
  PaymentMethod,
  InvoiceStatus,
  PaymentStatus,
  VerificationStatus,
  CustomerStatus,
} from "../../generated/prisma/client";

const app = new Hono();

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
    if (payment.status === "SUCCESS") {
      return c.json({
        success: true,
        message: "Payment sudah diproses sebelumnya.",
      });
    }

    // 2. Jika Pembayaran Berhasil (SUCCESS / SETTLEMENT)
    if (transactionStatus === "SUCCESS" || transactionStatus === "SETTLEMENT") {
      const transactionDate = new Date();

      // Penentuan userId penanggung jawab kas:
      // Ambil dari pencipta payment, atau pembuat invoice, atau fallback ke default admin ID
      // Solusi paling sederhana & aman
      const targetUserId = payment.createdById ?? "clx_admin_system_default";

      await prisma.$transaction(async (tx) => {
        // A. Update Status Payment -> SUCCESS
        await tx.payment.update({
          where: { id: payment.id },
          data: {
            status: "SUCCESS",
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

        // D. Hitung Rentang Tanggal Harian tanpa merusak objek transactionDate
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
        data: { status: "FAILED" },
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
