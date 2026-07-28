import { Hono } from "hono";
import { checkUserToken } from "../midleware/cekUserToken";
import { prisma } from "../../lib/prisma";
import { existsSync, mkdirSync, unlinkSync } from "node:fs";
import {
  PaymentMethod,
  InvoiceStatus,
  PaymentStatus,
  VerificationStatus,
  CustomerStatus,
} from "../../generated/prisma/client";

const app = new Hono();

// POST /payment/manual
/* body json
{
  "invoiceId": "clx_invoice_id_kamu_disini",
  "method": "CASH"
}
*/
app.post("/", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const { invoiceId, method } = await c.req.json();

    if (!invoiceId || !method) {
      return c.json(
        {
          success: false,
          message: "invoiceId dan method wajib diisi.",
        },
        400
      );
    }

    // Validasi method
    if (!Object.values(PaymentMethod).includes(method)) {
      return c.json(
        {
          success: false,
          message: "Metode pembayaran tidak valid.",
        },
        400
      );
    }

    const invoice = await prisma.invoice.findUnique({
      where: {
        id: invoiceId,
      },
      include: {
        customer: true,
      },
    });

    if (!invoice) {
      return c.json(
        {
          success: false,
          message: "Invoice tidak ditemukan.",
        },
        404
      );
    }

    if (invoice.status !== "UNPAID") {
      return c.json(
        {
          success: false,
          message: "Invoice sudah dibayar.",
        },
        400
      );
    }

    const pending = await prisma.payment.findFirst({
      where: {
        invoiceId,
        status: {
          in: ["PENDING", "WAITING_VERIFICATION"],
        },
      },
    });

    if (pending) {
      return c.json(
        {
          success: false,
          message: "Masih ada pembayaran yang diproses.",
        },
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
        // A. Update status Invoice -> PAID
        await tx.invoice.update({
          where: { id: invoice.id },
          data: {
            status: InvoiceStatus.PAID,
            paidAt: now,
          },
        });

        // B. Buat record Pendapatan
        const newPendapatan = await tx.pendapatan.create({
          data: {
            paymentId: newPayment.id,
            userId: user.id,
            total: invoice.total,
            deskripsi: `Pembayaran Cash Invoice #${invoice.invoiceNumber} - ${invoice.customer.fullname}`,
          },
        });

        // C. Cari BukuKas hari ini (atau buat baru jika belum ada)
        const todayStart = new Date(now.setHours(0, 0, 0, 0));
        const todayEnd = new Date(now.setHours(23, 59, 59, 999));

        let bukuKas = await tx.bukuKas.findFirst({
          where: {
            tanggal: {
              gte: todayStart,
              lte: todayEnd,
            },
          },
        });

        if (bukuKas) {
          // Update totalMasuk & saldoAkhir BukuKas yang sudah ada
          await tx.bukuKas.update({
            where: { id: bukuKas.id },
            data: {
              totalMasuk: { increment: invoice.total },
              saldoAkhir: { increment: invoice.total },
              pendapatan: {
                connect: { id: newPendapatan.id },
              },
            },
          });
        } else {
          // Ambil saldoAkhir dari hari sebelumnya (jika ada) untuk kontinuitas saldo
          const lastBukuKas = await tx.bukuKas.findFirst({
            orderBy: { tanggal: "desc" },
          });
          const previousSaldo = lastBukuKas ? lastBukuKas.saldoAkhir : 0;

          // Buat record BukuKas baru untuk hari ini
          await tx.bukuKas.create({
            data: {
              tanggal: new Date(),
              totalMasuk: invoice.total,
              totalKeluar: 0,
              saldoAkhir: previousSaldo + invoice.total,
              deskripsi: "Buku Kas Harian",
              keterangan: "Pencatatan Pemasukan Otomatis",
              userId: user.id,
              pendapatan: {
                connect: { id: newPendapatan.id },
              },
            },
          });
        }

        // D. Update status customer menjadi ACTIVE (jika sebelumnya SUSPENDED/PENDING)
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
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
      },
      500
    );
  }
});

//POST /payment/ :id /attachment
/*Multy-part-form
  Tab Body (form-data)
  Pilih tab Body -> centang form-data.

  Pada kolom Key, ketik file.

  Arahkan kursor ke ujung kanan input file, ganti tipe kolom dari Text menjadi File.

  Pada kolom Value, klik Select Files dan pilih berkas gambar/PDF bukti transfer dari komputer kamu.
 */
app.post("/:id/attachment", checkUserToken(), async (c) => {
  let savedPath: string | null = null;

  try {
    const paymentId = c.req.param("id");
    const body = await c.req.parseBody();
    const file = body.file;

    // 1. Validasi keberadaan file
    if (!(file instanceof File)) {
      return c.json(
        {
          success: false,
          message: "File wajib diupload.",
        },
        400
      );
    }

    // 2. Validasi Tipe & Ukuran File (Maksimal 5MB)
    const allowedMimeTypes = [
      "image/jpeg",
      "image/jpg",
      "image/png",
      "application/pdf",
    ];
    if (!allowedMimeTypes.includes(file.type)) {
      return c.json(
        {
          success: false,
          message: "Format file harus berupa JPG, PNG, atau PDF.",
        },
        400
      );
    }

    const MAX_SIZE = 3 * 1024 * 1024; // 5 MB
    if (file.size > MAX_SIZE) {
      return c.json(
        {
          success: false,
          message: "Ukuran file maksimal 5MB.",
        },
        400
      );
    }

    // 3. Cek keberadaan & status Payment
    const payment = await prisma.payment.findUnique({
      where: { id: paymentId },
    });

    if (!payment) {
      return c.json(
        {
          success: false,
          message: "Payment tidak ditemukan.",
        },
        404
      );
    }

    if (payment.status !== "PENDING") {
      return c.json(
        {
          success: false,
          message: "Payment tidak dalam status PENDING.",
        },
        400
      );
    }

    // 4. Pastikan folder tujuan ada
    const uploadDir = "uploads/payment";
    if (!existsSync(uploadDir)) {
      mkdirSync(uploadDir, { recursive: true });
    }

    const fileExtension = file.name.split(".").pop() ?? "";
    const fileName = `${crypto.randomUUID()}-${Date.now()}.${fileExtension}`;
    savedPath = `${uploadDir}/${fileName}`;

    // 5. Simpan file fisik ke disk
    await Bun.write(savedPath, file);

    // 6. Transaksi DB
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
          url: `/uploads/payment/${fileName}`, // URL publik
        },
      });

      await tx.payment.update({
        where: { id: paymentId },
        data: {
          status: "WAITING_VERIFICATION",
          transferAt: new Date(),
        },
      });
    });

    return c.json({
      success: true,
      message: "Bukti transfer berhasil diupload.",
    });
  } catch (err) {
    // Hapus file yang sempat tersimpan jika terjadi error DB
    if (savedPath && existsSync(savedPath)) {
      try {
        unlinkSync(savedPath);
      } catch (cleanupErr) {
        console.error("Gagal menghapus file orphan:", cleanupErr);
      }
    }

    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan pada server saat mengunggah berkas.",
      },
      500
    );
  }
});

//PATCH /payment/:id/verify
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
        {
          success: false,
          message: "Status verifikasi tidak valid.",
        },
        400
      );
    }

    const payment = await prisma.payment.findUnique({
      where: {
        id: paymentId,
      },
      include: {
        invoice: true,
        customer: true,
      },
    });

    if (!payment) {
      return c.json(
        {
          success: false,
          message: "Payment tidak ditemukan.",
        },
        404
      );
    }

    if (payment.status !== PaymentStatus.WAITING_VERIFICATION) {
      return c.json(
        {
          success: false,
          message: "Payment tidak menunggu verifikasi.",
        },
        400
      );
    }

    await prisma.$transaction(async (tx) => {
      // Simpan histori verifikasi
      await tx.paymentVerification.create({
        data: {
          paymentId: payment.id,
          verifiedById: user.id,
          status,
          note,
        },
      });

      if (status === VerificationStatus.APPROVED) {
        // Update Payment
        await tx.payment.update({
          where: {
            id: payment.id,
          },
          data: {
            status: PaymentStatus.SUCCESS,
            paidAt: new Date(),
          },
        });

        // Update Invoice
        await tx.invoice.update({
          where: {
            id: payment.invoiceId,
          },
          data: {
            status: InvoiceStatus.PAID,
            paidAt: new Date(),
          },
        });

        // Buat Pendapatan
        const pendapatan = await tx.pendapatan.create({
          data: {
            paymentId: payment.id,
            total: payment.amount,
            userId: user.id,
          },
        });

        // Ambil saldo terakhir
        const lastBukuKas = await tx.bukuKas.findFirst({
          orderBy: {
            tanggal: "desc",
          },
        });

        const saldoSebelumnya = lastBukuKas?.saldoAkhir ?? 0;
        const saldoBaru = saldoSebelumnya + payment.amount;

        // Simpan Buku Kas
        await tx.bukuKas.create({
          data: {
            tanggal: new Date(),

            totalMasuk: payment.amount,
            totalKeluar: 0,
            saldoAkhir: saldoBaru,

            deskripsi: `Pembayaran Invoice ${payment.invoice.invoiceNumber}`,
            keterangan: `Pembayaran dari ${payment.customer.fullname}`,

            userId: user.id,

            pendapatan: {
              connect: {
                id: pendapatan.id,
              },
            },
          },
        });
      }

      if (status === VerificationStatus.REJECTED) {
        await tx.payment.update({
          where: {
            id: payment.id,
          },
          data: {
            status: PaymentStatus.REJECTED,
          },
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
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
      },
      500
    );
  }
});

app.get("/", checkUserToken(), async (c) => {
  try {
    const payment = await prisma.payment.findMany({
      include: {
        customer: true,
        createdBy: true,
      },
    });
    return c.json(payment);
  } catch (error) {
    console.error(error);
  }
});

/*POST /payments/gateway*/
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

    // 1. Cek Invoice
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

    // 2. Cek apakah ada payment PENDING
    const pending = await prisma.payment.findFirst({
      where: {
        invoiceId,
        status: { in: ["PENDING", "WAITING_VERIFICATION"] },
      },
    });

    if (pending) {
      return c.json(
        {
          success: false,
          message: "Masih ada pembayaran yang sedang diproses.",
        },
        400
      );
    }

    // 3. Buat Record Payment di DB (Status PENDING)
    const newPayment = await prisma.payment.create({
      data: {
        invoiceId: invoice.id,
        customerId: invoice.customerId,
        amount: invoice.total,
        method: method, // e.g. "MIDTRANS", "QRIS", "VA_BCA"
        gateway: "MIDTRANS", // Sesuaikan nama gateway
        status: "PENDING",
        createdById: user.id,
      },
    });

    // 4. Simulasi Integrasi ke Payment Gateway API (misal: Midtrans Snap / Xendit Invoice)
    // Di dunia nyata, di sini kamu panggil API Midtrans SDK / Fetch API
    const externalOrderRef = `PAY-${newPayment.id}`;
    const paymentUrl = `https://app.sandbox.midtrans.com/snap/v2/vtweb/${externalOrderRef}`;

    return c.json(
      {
        success: true,
        message: "Payment Gateway berhasil diinisiasi.",
        data: {
          paymentId: newPayment.id,
          amount: newPayment.amount,
          paymentUrl: paymentUrl, // URL untuk di-redirect oleh Frontend
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
