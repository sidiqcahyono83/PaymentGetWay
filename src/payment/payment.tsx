// ============================================================
// routes/payment.ts — KOREKSI LENGKAP
//
// Yang DITAMBAHKAN / DIPERBAIKI dari versi sebelumnya:
//   1. ⭐ GET  /payment/:id   — detail payment (dipakai halaman edit)
//   2. ⭐ PATCH /payment/:id  — update payment (dipakai halaman edit)
//      - Ubah status/amount/method/paidAt/transferAt
//      - Jika status → SUCCESS : invoice otomatis PAID +
//        pendapatan + Buku Kas (kalau belum dicatat)
//      - Jika keluar dari SUCCESS : invoice kembali UNPAID +
//        pendapatan terkait dihapus
//   3. Perbaiki route order: /all SEBELUM /:id (biar /all tidak
//      tertangkap sebagai id)
//   4. GET /all: catch sekarang mengembalikan 500 (sebelumnya
//      diam — bikin frontend menggantung)
//   5. Konsisten ukuran file: 3MB (kode & pesan sama; sebelumnya
//      kode 3MB tapi pesan 5MB)
// ============================================================

import { Hono } from "hono";
import { existsSync, mkdirSync, unlinkSync } from "node:fs";
import {
  CustomerStatus,
  InvoiceStatus,
  PaymentMethod,
  PaymentStatus,
  VerificationStatus,
} from "../../generated/prisma/client";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";

const app = new Hono();

// ============================================================
// POST /payment — pembayaran manual CASH (langsung lunas)
//   atau non-cash (status PENDING, menunggu upload bukti)
// ============================================================
app.post("/", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const { invoiceId, method } = await c.req.json();

    if (!invoiceId || !method) {
      return c.json(
        { success: false, message: "invoiceId dan method wajib diisi." },
        400
      );
    }

    if (!Object.values(PaymentMethod).includes(method)) {
      return c.json(
        { success: false, message: "Metode pembayaran tidak valid." },
        400
      );
    }

    const invoice = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: { customer: true },
    });

    if (!invoice) {
      return c.json(
        { success: false, message: "Invoice tidak ditemukan." },
        404
      );
    }

    if (invoice.status !== "UNPAID") {
      return c.json(
        { success: false, message: "Invoice sudah dibayar." },
        400
      );
    }

    const pending = await prisma.payment.findFirst({
      where: {
        invoiceId,
        status: { in: ["PENDING", "WAITING_VERIFICATION"] },
      },
    });

    if (pending) {
      return c.json(
        { success: false, message: "Masih ada pembayaran yang diproses." },
        400
      );
    }

    const isCash = method === PaymentMethod.CASH;
    const now = new Date();

    const payment = await prisma.$transaction(async (tx) => {
      // 1. Buat Payment
      const newPayment = await tx.payment.create({
        data: {
          invoiceId,
          customerId: invoice.customerId,
          amount: invoice.total,
          method,
          gateway: "MANUAL",
          status: isCash ? PaymentStatus.SUCCESS : PaymentStatus.PENDING,
          paidAt: isCash ? now : null,
          createdById: user.id,
        },
      });

      // 2. Jika pembayaran CASH (langsung Lunas)
      if (isCash) {
        await tx.invoice.update({
          where: { id: invoice.id },
          data: { status: InvoiceStatus.PAID, paidAt: now },
        });

        const newPendapatan = await tx.pendapatan.create({
          data: {
            paymentId: newPayment.id,
            userId: user.id,
            total: invoice.total,
            deskripsi: `Pembayaran Cash Invoice #${invoice.invoiceNumber} - ${invoice.customer.fullname}`,
          },
        });

        const todayStart = new Date(now.setHours(0, 0, 0, 0));
        const todayEnd = new Date(now.setHours(23, 59, 59, 999));

        let bukuKas = await tx.bukuKas.findFirst({
          where: { tanggal: { gte: todayStart, lte: todayEnd } },
        });

        if (bukuKas) {
          await tx.bukuKas.update({
            where: { id: bukuKas.id },
            data: {
              totalMasuk: { increment: invoice.total },
              saldoAkhir: { increment: invoice.total },
              pendapatan: { connect: { id: newPendapatan.id } },
            },
          });
        } else {
          const lastBukuKas = await tx.bukuKas.findFirst({
            orderBy: { tanggal: "desc" },
          });
          const previousSaldo = lastBukuKas ? lastBukuKas.saldoAkhir : 0;

          await tx.bukuKas.create({
            data: {
              tanggal: new Date(),
              totalMasuk: invoice.total,
              totalKeluar: 0,
              saldoAkhir: previousSaldo + invoice.total,
              deskripsi: "Buku Kas Harian",
              keterangan: "Pencatatan Pemasukan Otomatis",
              userId: user.id,
              pendapatan: { connect: { id: newPendapatan.id } },
            },
          });
        }

        if (invoice.customer.status !== CustomerStatus.ACTIVE) {
          await tx.customer.update({
            where: { id: invoice.customerId },
            data: { status: CustomerStatus.ACTIVE },
          });
        }
      }

      return newPayment;
    });

    return c.json(
      {
        success: true,
        message: isCash
          ? "Pembayaran cash berhasil & tercatat di Buku Kas."
          : "Pembayaran berhasil dibuat (menunggu pembayaran).",
        data: payment,
      },
      201
    );
  } catch (err) {
    console.error(err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ============================================================
// POST /payment/:id/attachment — upload bukti transfer
// ============================================================
app.post("/:id/attachment", checkUserToken(), async (c) => {
  let savedPath: string | null = null;

  try {
    const paymentId = c.req.param("id");
    const body = await c.req.parseBody();
    const file = body.file;

    if (!(file instanceof File)) {
      return c.json(
        { success: false, message: "File wajib diupload." },
        400
      );
    }

    const allowedMimeTypes = [
      "image/jpeg",
      "image/jpg",
      "image/png",
      "application/pdf",
    ];

    if (!allowedMimeTypes.includes(file.type)) {
      return c.json(
        { success: false, message: "Format file harus berupa JPG, PNG, atau PDF." },
        400
      );
    }

    const MAX_SIZE = 3 * 1024 * 1024; // 3 MB
    if (file.size > MAX_SIZE) {
      return c.json({ success: false, message: "Ukuran file maksimal 3MB." }, 400);
    }

    const payment = await prisma.payment.findUnique({
      where: { id: paymentId },
    });

    if (!payment) {
      return c.json(
        { success: false, message: "Payment tidak ditemukan." },
        404
      );
    }

    if (payment.status !== "PENDING") {
      return c.json(
        { success: false, message: "Payment tidak dalam status PENDING." },
        400
      );
    }

    const uploadDir = "uploads/payment";
    if (!existsSync(uploadDir)) {
      mkdirSync(uploadDir, { recursive: true });
    }

    const fileExtension = file.name.split(".").pop() ?? "";
    const fileName = `${crypto.randomUUID()}-${Date.now()}.${fileExtension}`;
    savedPath = `${uploadDir}/${fileName}`;

    await Bun.write(savedPath, file);

    await prisma.$transaction(async (tx) => {
      await tx.paymentAttachment.create({
        data: {
          paymentId,
          originalName: file.name,
          fileName,
          mimeType: file.type,
          extension: fileExtension,
          size: file.size,
          path: savedPath!,
          url: `/uploads/payment/${fileName}`,
        },
      });

      await tx.payment.update({
        where: { id: paymentId },
        data: { status: "WAITING_VERIFICATION", transferAt: new Date() },
      });
    });

    return c.json({
      success: true,
      message: "Bukti transfer berhasil diupload.",
    });
  } catch (err) {
    if (savedPath && existsSync(savedPath)) {
      try {
        unlinkSync(savedPath);
      } catch (cleanupErr) {
        console.error("Gagal menghapus file orphan:", cleanupErr);
      }
    }

    console.error(err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server saat mengunggah berkas." },
      500
    );
  }
});

// ============================================================
// PATCH /payment/:id/verify — verifikasi transfer (APPROVED/REJECTED)
// ============================================================
app.patch("/:id/verify", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const paymentId = c.req.param("id");

    const { status, note } = await c.req.json();

    if (
      status !== VerificationStatus.APPROVED &&
      status !== VerificationStatus.REJECTED
    ) {
      return c.json(
        { success: false, message: "Status verifikasi tidak valid." },
        400
      );
    }

    const payment = await prisma.payment.findUnique({
      where: { id: paymentId },
      include: { invoice: true, customer: true },
    });

    if (!payment) {
      return c.json(
        { success: false, message: "Payment tidak ditemukan." },
        404
      );
    }

    if (payment.status !== PaymentStatus.WAITING_VERIFICATION) {
      return c.json(
        { success: false, message: "Payment tidak menunggu verifikasi." },
        400
      );
    }

    await prisma.$transaction(async (tx) => {
      await tx.paymentVerification.create({
        data: {
          paymentId: payment.id,
          verifiedById: user.id,
          status,
          note,
        },
      });

      if (status === VerificationStatus.APPROVED) {
        await tx.payment.update({
          where: { id: payment.id },
          data: { status: PaymentStatus.SUCCESS, paidAt: new Date() },
        });

        await tx.invoice.update({
          where: { id: payment.invoiceId },
          data: { status: InvoiceStatus.PAID, paidAt: new Date() },
        });

        const pendapatan = await tx.pendapatan.create({
          data: {
            paymentId: payment.id,
            total: payment.amount,
            userId: user.id,
          },
        });

        const lastBukuKas = await tx.bukuKas.findFirst({
          orderBy: { tanggal: "desc" },
        });

        const saldoSebelumnya = lastBukuKas?.saldoAkhir ?? 0;
        const saldoBaru = saldoSebelumnya + payment.amount;

        await tx.bukuKas.create({
          data: {
            tanggal: new Date(),
            totalMasuk: payment.amount,
            totalKeluar: 0,
            saldoAkhir: saldoBaru,
            deskripsi: `Pembayaran Invoice ${payment.invoice.invoiceNumber}`,
            keterangan: `Pembayaran dari ${payment.customer.fullname}`,
            userId: user.id,
            pendapatan: { connect: { id: pendapatan.id } },
          },
        });
      }

      if (status === VerificationStatus.REJECTED) {
        await tx.payment.update({
          where: { id: payment.id },
          data: { status: PaymentStatus.REJECTED },
        });
      }
    });

    return c.json({
      success: true,
      message:
        status === VerificationStatus.APPROVED
          ? "Pembayaran berhasil diverifikasi."
          : "Pembayaran berhasil ditolak.",
    });
  } catch (err) {
    console.error(err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ============================================================
// GET /payment/all — semua payment (TANPA pagination)
// ⭐ HARUS didaftarkan SEBELUM /:id
// ============================================================
app.get("/all", checkUserToken(), async (c) => {
  try {
    const payment = await prisma.payment.findMany({
      include: {
        customer: true,
        createdBy: true,
        pendapatan: true,
        verification: true,
        attachments: true,
        invoice: true,
      },
      orderBy: { createdAt: "desc" },
    });

    return c.json(payment);
  } catch (error) {
    console.error("Gagal mengambil semua payment:", error);
    return c.json(
      { success: false, message: "Gagal mengambil semua pembayaran." },
      500
    );
  }
});

// ============================================================
// GET /payment — list pagination + search
// ============================================================
app.get("/", checkUserToken(), async (c) => {
  try {
    const page = parseInt(c.req.query("page") || "1");
    const limit = parseInt(c.req.query("limit") || "10");
    const search = c.req.query("search") || "";

    const skip = (page - 1) * limit;

    const whereCondition = search
      ? {
        OR: [
          {
            customer: {
              fullname: { contains: search, mode: "insensitive" as const },
            },
          },
          {
            invoice: {
              invoiceNumber: { contains: search, mode: "insensitive" as const },
            },
          },
        ],
      }
      : {};

    const [payments, total] = await Promise.all([
      prisma.payment.findMany({
        where: whereCondition,
        include: {
          customer: true,
          createdBy: true,
          pendapatan: true,
          verification: true,
          attachments: true,
          invoice: true,
        },
        orderBy: { createdAt: "desc" },
        skip,
        take: limit,
      }),
      prisma.payment.count({ where: whereCondition }),
    ]);

    const totalPages = Math.ceil(total / limit);

    return c.json(
      {
        success: true,
        message: "Berhasil mengambil data pembayaran.",
        data: payments,
        pagination: { page, limit, total, totalPages },
      },
      200
    );
  } catch (error) {
    console.error("Gagal mengambil data pembayaran:", error);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ============================================================
// ⭐ GET /payment/:id — DETAIL payment (dipakai halaman edit)
// ============================================================
app.get("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");

    const payment = await prisma.payment.findUnique({
      where: { id },
      include: {
        customer: true,
        createdBy: true,
        pendapatan: true,
        verification: true,
        attachments: true,
        invoice: { include: { customer: true } },
      },
    });

    if (!payment) {
      return c.json(
        { success: false, message: "Payment tidak ditemukan." },
        404
      );
    }

    return c.json({ success: true, data: payment });
  } catch (err) {
    console.error("Gagal mengambil detail payment:", err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ============================================================
// ⭐ PATCH /payment/:id — UPDATE payment (dipakai halaman edit)
//
// Body (semua opsional):
//   { status?, amount?, method?, paidAt?, transferAt? }
//
// Efek samping otomatis:
//   - status → SUCCESS  : invoice jadi PAID + pendapatan & Buku Kas
//     (kalau payment ini belum punya pendapatan)
//   - keluar dari SUCCESS : invoice kembali UNPAID + pendapatan
//     terkait dihapus
// ============================================================
app.patch("/:id", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const id = c.req.param("id");
    const body = await c.req.json().catch(() => ({}));

    const { status, amount, method, paidAt, transferAt } = body;

    const payment = await prisma.payment.findUnique({
      where: { id },
      include: {
        invoice: { include: { customer: true } },
        pendapatan: true,
      },
    });

    if (!payment) {
      return c.json(
        { success: false, message: "Payment tidak ditemukan." },
        404
      );
    }

    // ---- Siapkan data update ----
    const updateData: any = {};

    if (status !== undefined) updateData.status = status;
    if (amount !== undefined) updateData.amount = Number(amount);
    if (method !== undefined) updateData.method = method;
    if (paidAt !== undefined)
      updateData.paidAt = paidAt ? new Date(paidAt) : null;
    if (transferAt !== undefined)
      updateData.transferAt = transferAt ? new Date(transferAt) : null;

    await prisma.$transaction(async (tx) => {
      const updated = await tx.payment.update({
        where: { id },
        data: updateData,
      });

      const newStatus = String(updated.status ?? "").toUpperCase();

      // ---- Menjadi SUCCESS → tandai lunas + pendapatan + Buku Kas ----
      if (newStatus === "SUCCESS" && payment.invoice?.status !== "PAID") {
        await tx.invoice.update({
          where: { id: payment.invoiceId },
          data: { status: InvoiceStatus.PAID, paidAt: updated.paidAt ?? new Date() },
        });

        if (!payment.pendapatan) {
          const pendapatan = await tx.pendapatan.create({
            data: {
              paymentId: payment.id,
              userId: user.id,
              total: updated.amount,
              deskripsi: `Pembayaran Invoice #${payment.invoice.invoiceNumber} - ${payment.invoice.customer.fullname}`,
            },
          });

          const now = new Date();
          const todayStart = new Date(now.setHours(0, 0, 0, 0));
          const todayEnd = new Date(now.setHours(23, 59, 59, 999));

          let bukuKas = await tx.bukuKas.findFirst({
            where: { tanggal: { gte: todayStart, lte: todayEnd } },
          });

          if (bukuKas) {
            await tx.bukuKas.update({
              where: { id: bukuKas.id },
              data: {
                totalMasuk: { increment: updated.amount },
                saldoAkhir: { increment: updated.amount },
                pendapatan: { connect: { id: pendapatan.id } },
              },
            });
          } else {
            const last = await tx.bukuKas.findFirst({
              orderBy: { tanggal: "desc" },
            });
            const prev = last?.saldoAkhir ?? 0;

            await tx.bukuKas.create({
              data: {
                tanggal: new Date(),
                totalMasuk: updated.amount,
                totalKeluar: 0,
                saldoAkhir: prev + updated.amount,
                deskripsi: "Buku Kas Harian",
                keterangan: "Pemasukan dari Edit Payment",
                userId: user.id,
                pendapatan: { connect: { id: pendapatan.id } },
              },
            });
          }
        }
      }

      // ---- Keluar dari SUCCESS → batalkan lunas ----
      if (newStatus !== "SUCCESS" && payment.status === "SUCCESS") {
        await tx.invoice.update({
          where: { id: payment.invoiceId },
          data: { status: InvoiceStatus.UNPAID, paidAt: null },
        });

        if (payment.pendapatan) {
          await tx.pendapatan.delete({
            where: { id: payment.pendapatan.id },
          });
        }
      }
    });

    // Ambil ulang data terbaru untuk response
    const fresh = await prisma.payment.findUnique({
      where: { id },
      include: { invoice: true, customer: true },
    });

    return c.json({
      success: true,
      message: "Payment berhasil diperbarui.",
      data: fresh,
    });
  } catch (err) {
    console.error("Gagal update payment:", err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ============================================================
// POST /payment/manual/attachment — cash/transfer + file
// ============================================================
app.post("/manual/attachment", checkUserToken(), async (c) => {
  let savedPath: string | null = null;

  try {
    const user = c.get("user");

    const body = await c.req.parseBody();
    const invoiceId = body.invoiceId as string;
    const method = body.method as string;
    const file = body.file;

    if (!invoiceId || !method) {
      return c.json(
        { success: false, message: "invoiceId dan method wajib diisi." },
        400
      );
    }

    if (!Object.values(PaymentMethod).includes(method as any)) {
      return c.json(
        { success: false, message: "Metode pembayaran tidak valid." },
        400
      );
    }

    const isCash = method === PaymentMethod.CASH;

    if (!isCash) {
      if (!(file instanceof File)) {
        return c.json(
          {
            success: false,
            message:
              "Metode pembayaran transfer wajib menyertakan file bukti transfer.",
          },
          400
        );
      }

      const allowedMimeTypes = [
        "image/jpeg",
        "image/jpg",
        "image/png",
        "application/pdf",
      ];

      if (!allowedMimeTypes.includes(file.type)) {
        return c.json(
          { success: false, message: "Format file harus berupa JPG, PNG, atau PDF." },
          400
        );
      }

      const MAX_SIZE = 3 * 1024 * 1024; // 3 MB
      if (file.size > MAX_SIZE) {
        return c.json(
          { success: false, message: "Ukuran file maksimal 3MB." },
          400
        );
      }
    }

    const invoice = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: { customer: true },
    });

    if (!invoice) {
      return c.json(
        { success: false, message: "Invoice tidak ditemukan." },
        404
      );
    }

    if (invoice.status !== "UNPAID") {
      return c.json(
        { success: false, message: "Invoice sudah dibayar." },
        400
      );
    }

    const pending = await prisma.payment.findFirst({
      where: {
        invoiceId,
        status: { in: ["PENDING", "WAITING_VERIFICATION"] },
      },
    });

    if (pending) {
      return c.json(
        { success: false, message: "Masih ada pembayaran yang diproses." },
        400
      );
    }

    const now = new Date();

    let fileName = "";
    let fileExtension = "";

    if (!isCash && file instanceof File) {
      const uploadDir = "uploads/payment";
      if (!existsSync(uploadDir)) {
        mkdirSync(uploadDir, { recursive: true });
      }

      fileExtension = file.name.split(".").pop() ?? "";
      fileName = `${crypto.randomUUID()}-${Date.now()}.${fileExtension}`;
      savedPath = `${uploadDir}/${fileName}`;

      await Bun.write(savedPath, file);
    }

    const payment = await prisma.$transaction(async (tx) => {
      const newPayment = await tx.payment.create({
        data: {
          invoiceId,
          customerId: invoice.customerId,
          amount: invoice.total,
          method: method as any,
          gateway: "MANUAL",
          status: isCash
            ? PaymentStatus.SUCCESS
            : PaymentStatus.WAITING_VERIFICATION,
          paidAt: isCash ? now : null,
          transferAt: !isCash ? now : null,
          createdById: user.id,
        },
      });

      if (!isCash && file instanceof File) {
        await tx.paymentAttachment.create({
          data: {
            paymentId: newPayment.id,
            originalName: file.name,
            fileName,
            mimeType: file.type,
            extension: fileExtension,
            size: file.size,
            path: savedPath!,
            url: `/uploads/payment/${fileName}`,
          },
        });
      }

      if (isCash) {
        await tx.invoice.update({
          where: { id: invoice.id },
          data: { status: InvoiceStatus.PAID, paidAt: now },
        });

        const newPendapatan = await tx.pendapatan.create({
          data: {
            paymentId: newPayment.id,
            userId: user.id,
            total: invoice.total,
            deskripsi: `Pembayaran Cash Invoice #${invoice.invoiceNumber} - ${invoice.customer.fullname}`,
          },
        });

        const todayStart = new Date(new Date(now).setHours(0, 0, 0, 0));
        const todayEnd = new Date(new Date(now).setHours(23, 59, 59, 999));

        let bukuKas = await tx.bukuKas.findFirst({
          where: { tanggal: { gte: todayStart, lte: todayEnd } },
        });

        if (bukuKas) {
          await tx.bukuKas.update({
            where: { id: bukuKas.id },
            data: {
              totalMasuk: { increment: invoice.total },
              saldoAkhir: { increment: invoice.total },
              pendapatan: { connect: { id: newPendapatan.id } },
            },
          });
        } else {
          const lastBukuKas = await tx.bukuKas.findFirst({
            orderBy: { tanggal: "desc" },
          });
          const previousSaldo = lastBukuKas ? lastBukuKas.saldoAkhir : 0;

          await tx.bukuKas.create({
            data: {
              tanggal: new Date(),
              totalMasuk: invoice.total,
              totalKeluar: 0,
              saldoAkhir: previousSaldo + invoice.total,
              deskripsi: "Buku Kas Harian",
              keterangan: "Pencatatan Pemasukan Otomatis",
              userId: user.id,
              pendapatan: { connect: { id: newPendapatan.id } },
            },
          });
        }

        if (invoice.customer.status !== CustomerStatus.ACTIVE) {
          await tx.customer.update({
            where: { id: invoice.customerId },
            data: { status: CustomerStatus.ACTIVE },
          });
        }
      }

      return newPayment;
    });

    return c.json(
      {
        success: true,
        message: isCash
          ? "Pembayaran cash berhasil & tercatat di Buku Kas."
          : "Pembayaran transfer berhasil dibuat & menunggu verifikasi.",
        data: payment,
      },
      201
    );
  } catch (err) {
    if (savedPath && existsSync(savedPath)) {
      try {
        unlinkSync(savedPath);
      } catch (cleanupErr) {
        console.error("Gagal menghapus file orphan:", cleanupErr);
      }
    }

    console.error(err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ============================================================
// POST /payment/gateway — inisiasi payment gateway (simulasi)
// ============================================================
app.post("/gateway", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const { invoiceId, method } = await c.req.json();

    if (!invoiceId || !method) {
      return c.json(
        { success: false, message: "invoiceId dan method wajib diisi." },
        400
      );
    }

    const invoice = await prisma.invoice.findUnique({
      where: { id: invoiceId },
      include: { customer: true },
    });

    if (!invoice) {
      return c.json(
        { success: false, message: "Invoice tidak ditemukan." },
        404
      );
    }

    if (invoice.status !== "UNPAID") {
      return c.json({ success: false, message: "Invoice sudah dibayar." }, 400);
    }

    const pending = await prisma.payment.findFirst({
      where: {
        invoiceId,
        status: { in: ["PENDING", "WAITING_VERIFICATION"] },
      },
    });

    if (pending) {
      return c.json(
        { success: false, message: "Masih ada pembayaran yang sedang diproses." },
        400
      );
    }

    const newPayment = await prisma.payment.create({
      data: {
        invoiceId: invoice.id,
        customerId: invoice.customerId,
        amount: invoice.total,
        method: method,
        gateway: "MIDTRANS",
        status: "PENDING",
        createdById: user.id,
      },
    });

    const externalOrderRef = `PAY-${newPayment.id}`;
    const paymentUrl = `https://app.sandbox.midtrans.com/snap/v2/vtweb/${externalOrderRef}`;

    return c.json(
      {
        success: true,
        message: "Payment Gateway berhasil diinisiasi.",
        data: {
          paymentId: newPayment.id,
          amount: newPayment.amount,
          paymentUrl,
        },
      },
      201
    );
  } catch (err: any) {
    console.error(err);
    return c.json(
      { success: false, message: err.message || "Terjadi kesalahan server." },
      500
    );
  }
});

export default app;
