import { Hono } from "hono";
import { checkUserToken } from "../midleware/cekUserToken";
import { prisma } from "../../lib/prisma";
import {
  PaymentMethod,
  InvoiceStatus,
  PaymentStatus,
  VerificationStatus,
} from "../../generated/prisma/client";

const app = new Hono();

// POST /payment/manual
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
        400,
      );
    }

    // Validasi method
    if (!Object.values(PaymentMethod).includes(method)) {
      return c.json(
        {
          success: false,
          message: "Metode pembayaran tidak valid.",
        },
        400,
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
        404,
      );
    }

    if (invoice.status !== "UNPAID") {
      return c.json(
        {
          success: false,
          message: "Invoice sudah dibayar.",
        },
        400,
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
        400,
      );
    }

    const payment = await prisma.$transaction(async (tx) => {
      const payment = await tx.payment.create({
        data: {
          invoiceId,
          customerId: invoice.customerId,
          amount: invoice.total,
          method,
          gateway: "MANUAL",
          status: method === PaymentMethod.CASH ? "SUCCESS" : "PENDING",
          paidAt: method === PaymentMethod.CASH ? new Date() : null,
          createdById: user.id,
        },
      });

      if (method === PaymentMethod.CASH) {
        await tx.invoice.update({
          where: {
            id: invoice.id,
          },
          data: {
            status: "PAID",
            paidAt: new Date(),
          },
        });
      }

      return payment;
    });

    return c.json(
      {
        success: true,
        message: "Pembayaran berhasil dibuat.",
        data: payment,
      },
      201,
    );
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
      },
      500,
    );
  }
});

//POST /payment/ :id /attachment
app.post("/:id/attachment", checkUserToken(), async (c) => {
  try {
    const paymentId = c.req.param("id");

    const body = await c.req.parseBody();

    const file = body.file;

    if (!(file instanceof File)) {
      return c.json(
        {
          success: false,
          message: "File wajib diupload.",
        },
        400,
      );
    }

    const payment = await prisma.payment.findUnique({
      where: {
        id: paymentId,
      },
    });

    if (!payment) {
      return c.json(
        {
          success: false,
          message: "Payment tidak ditemukan.",
        },
        404,
      );
    }

    if (payment.status !== "PENDING") {
      return c.json(
        {
          success: false,
          message: "Payment tidak dapat diupload.",
        },
        400,
      );
    }

    /**
     * Simpan file
     *
     * nanti kita buat helper uploadFile()
     */

    const fileName = crypto.randomUUID() + "-" + file.name;

    const path = `uploads/payment/${fileName}`;

    await Bun.write(path, file);

    await prisma.$transaction(async (tx) => {
      await tx.paymentAttachment.create({
        data: {
          paymentId,

          originalName: file.name,

          fileName,

          mimeType: file.type,

          extension: file.name.split(".").pop() ?? "",

          size: file.size,

          path,
        },
      });

      await tx.payment.update({
        where: {
          id: paymentId,
        },
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
    console.error(err);

    return c.json(
      {
        success: false,
      },
      500,
    );
  }
});

//PATCH /payment/:id/verify
// PATCH /payment/:id/verify
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
        400,
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
        404,
      );
    }

    if (payment.status !== PaymentStatus.WAITING_VERIFICATION) {
      return c.json(
        {
          success: false,
          message: "Payment tidak menunggu verifikasi.",
        },
        400,
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
      500,
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

export default app;
