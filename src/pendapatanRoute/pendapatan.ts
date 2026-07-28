import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import type { Prisma, PrismaClient } from "../../generated/prisma/client";

const app = new Hono<{
  Variables: Variables;
}>();

type Variables = {
  user: {
    id: string;
    username: string;
    fullname: string;
    level: string;
  };
};

app.get("/", checkUserToken(), async (c) => {
  const pendapatan = await prisma.pendapatan.findMany({});

  return c.json(pendapatan);
});

// Helper fungsi untuk mengambil saldo terakhir
export async function getLastSaldo(tx: any, userId: string): Promise<number> {
  const lastKas = await tx.bukuKas.findFirst({
    where: { userId },
    orderBy: { createdAt: "desc" },
  });
  return lastKas?.saldoAkhir ?? 0;
}

app.post("/", checkUserToken(), async (c) => {
  try {
    const body = await c.req.json();
    const user = c.get("user");

    if (!user) {
      return c.json(
        {
          success: false,
          message: "Unauthorized",
        },
        401
      );
    }

    const { paymentId, deskripsi } = body;

    if (!paymentId) {
      return c.json(
        {
          success: false,
          message: "paymentId wajib diisi.",
        },
        400
      );
    }

    const hasil = await prisma.$transaction(async (tx) => {
      // 1. Ambil data Payment & validasi
      const payment = await tx.payment.findUnique({
        where: { id: paymentId },
        include: {
          pendapatan: true,
          invoice: {
            include: { customer: true },
          },
        },
      });

      if (!payment) {
        throw new Error("Payment tidak ditemukan.");
      }

      // Pastikan payment sudah sukses/lunas
      if (payment.status !== "SUCCESS") {
        throw new Error("Payment belum sukses atau belum diverifikasi.");
      }

      // Cek apakah payment sudah pernah dicatat ke Pendapatan
      if (payment.pendapatan) {
        throw new Error("Payment ini sudah dicatatkan ke Pendapatan.");
      }

      // 2. Ambil saldo kas terakhir user
      const saldoAwal = await getLastSaldo(tx, user.id);
      const totalPendapatan = payment.amount;

      // 3. Buat Record Pendapatan (Relasi 1-to-1 ke Payment)
      const pendapatan = await tx.pendapatan.create({
        data: {
          paymentId: payment.id,
          userId: user.id,
          total: totalPendapatan,
          deskripsi:
            deskripsi ||
            `Pendapatan dari Invoice #${payment.invoice.invoiceNumber} - ${payment.invoice.customer.fullname}`,
        },
      });

      // 4. Cari atau Buat Buku Kas Harian
      const now = new Date();
      const todayStart = new Date(now.setHours(0, 0, 0, 0));
      const todayEnd = new Date(now.setHours(23, 59, 59, 999));

      let bukuKas = await tx.bukuKas.findFirst({
        where: {
          userId: user.id,
          tanggal: {
            gte: todayStart,
            lte: todayEnd,
          },
        },
      });

      if (bukuKas) {
        // Jika Buku Kas hari ini sudah ada, update totalMasuk & saldoAkhir
        bukuKas = await tx.bukuKas.update({
          where: { id: bukuKas.id },
          data: {
            totalMasuk: { increment: totalPendapatan },
            saldoAkhir: { increment: totalPendapatan },
            pendapatan: {
              connect: { id: pendapatan.id },
            },
          },
        });
      } else {
        // Jika belum ada, buat entri Buku Kas baru untuk hari ini
        bukuKas = await tx.bukuKas.create({
          data: {
            userId: user.id,
            tanggal: new Date(),
            totalMasuk: totalPendapatan,
            totalKeluar: 0,
            saldoAkhir: saldoAwal + totalPendapatan,
            deskripsi: "Pencatatan Pendapatan Harian",
            keterangan: "Pemasukan dari Payment",
            pendapatan: {
              connect: { id: pendapatan.id },
            },
          },
        });
      }

      return {
        pendapatan,
        bukuKas,
        totalMasuk: totalPendapatan,
      };
    });

    return c.json(
      {
        success: true,
        message: "Pendapatan dan Buku Kas berhasil dicatat.",
        data: hasil,
      },
      201
    );
  } catch (err: any) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: err.message || "Terjadi kesalahan pada server.",
      },
      400
    );
  }
});

//--PENDAPATAN MANUALL--//
app.post("/pendapatan/manual", checkUserToken(), async (c) => {
  try {
    // Ambil user dari Context Hono
    const user = c.get("user"); // user.id dijamin string

    const { total, deskripsi } = await c.req.json();

    if (!total || total <= 0) {
      return c.json(
        { success: false, message: "Total nominal wajib diisi." },
        400
      );
    }

    const hasil = await prisma.$transaction(async (tx) => {
      // 1. Saldo Kas Terakhir milik User yang sedang Login
      const lastKas = await tx.bukuKas.findFirst({
        where: { userId: user.id }, // Aman dari error TS null!
        orderBy: { createdAt: "desc" },
      });
      const saldoAwal = lastKas?.saldoAkhir ?? 0;

      // 2. Buat Pendapatan
      const pendapatan = await tx.pendapatan.create({
        data: {
          userId: user.id, // Menggunakan ID user login
          total: total,
          deskripsi: deskripsi,
        },
      });

      // 3. Catat / Update Buku Kas
      const now = new Date();
      const todayStart = new Date(now.setHours(0, 0, 0, 0));
      const todayEnd = new Date(now.setHours(23, 59, 59, 999));

      let bukuKas = await tx.bukuKas.findFirst({
        where: {
          userId: user.id,
          tanggal: { gte: todayStart, lte: todayEnd },
        },
      });

      if (bukuKas) {
        bukuKas = await tx.bukuKas.update({
          where: { id: bukuKas.id },
          data: {
            totalMasuk: { increment: total },
            saldoAkhir: { increment: total },
            pendapatan: { connect: { id: pendapatan.id } },
          },
        });
      } else {
        bukuKas = await tx.bukuKas.create({
          data: {
            userId: user.id,
            tanggal: new Date(),
            totalMasuk: total,
            totalKeluar: 0,
            saldoAkhir: saldoAwal + total,
            deskripsi: "Pencatatan Pendapatan Harian",
            keterangan: "Pemasukan Langsung / Direct Income",
            pendapatan: { connect: { id: pendapatan.id } },
          },
        });
      }

      return { pendapatan, bukuKas };
    });

    return c.json(
      { success: true, message: "Pendapatan berhasil dicatat.", data: hasil },
      201
    );
  } catch (err: any) {
    return c.json({ success: false, message: err.message }, 500);
  }
});

// GET /pendapatan?page=1&limit=10&search=john&bulan=7&tahun=2026
app.get("/", checkUserToken(), async (c) => {
  try {
    const page = Number(c.req.query("page") ?? 1);
    const limit = Number(c.req.query("limit") ?? 10);
    const search = c.req.query("search") ?? "";

    const bulan = c.req.query("bulan");
    const tahun = c.req.query("tahun");
    const metode = c.req.query("metode");

    const tanggalAwal = c.req.query("tanggalAwal");
    const tanggalAkhir = c.req.query("tanggalAkhir");

    const skip = (page - 1) * limit;

    const where: Prisma.PendapatanWhereInput = {};

    /**
     * Filter Search (Support pencarian deskripsi Pendapatan Manual & Detail Customer dari Payment)
     */
    if (search) {
      where.OR = [
        // Cari di deskripsi pendapatan langsung (misal: "Pemasangan Baru Bpk Ahmad")
        {
          deskripsi: {
            contains: search,
          },
        },
        // Cari di data Customer lewat relasi Payment
        {
          payment: {
            customer: {
              OR: [
                { fullname: { contains: search } },
                { username: { contains: search } },
                { phoneNumber: { contains: search } },
              ],
            },
          },
        },
      ];
    }

    /**
     * Filter Metode Pembayaran (diambil dari relasi Payment)
     */
    if (metode) {
      where.payment = {
        method: metode as any,
      };
    }

    /**
     * Filter Bulan + Tahun
     */
    if (bulan && tahun) {
      const start = new Date(Number(tahun), Number(bulan) - 1, 1);
      const end = new Date(Number(tahun), Number(bulan), 1);

      where.createdAt = {
        gte: start,
        lt: end,
      };
    }

    /**
     * Filter Rentang Tanggal
     */
    if (tanggalAwal || tanggalAkhir) {
      where.createdAt = {
        ...(tanggalAwal && { gte: new Date(tanggalAwal) }),
        ...(tanggalAkhir && { lte: new Date(tanggalAkhir) }),
      };
    }

    // Query Data & Total dengan Transaction
    const [total, pendapatan] = await prisma.$transaction([
      prisma.pendapatan.count({ where }),

      prisma.pendapatan.findMany({
        where,
        include: {
          user: {
            select: {
              id: true,
              fullname: true,
              username: true,
            },
          },
          payment: {
            include: {
              customer: {
                select: {
                  id: true,
                  fullname: true,
                  username: true,
                  phonenumber: true,
                },
              },
            },
          },
        },
        orderBy: {
          createdAt: "desc",
        },
        skip,
        take: limit,
      }),
    ]);

    return c.json({
      success: true,
      message: "Data pendapatan berhasil diambil.",
      data: pendapatan,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
      },
    });
  } catch (error) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal mengambil data pendapatan.",
      },
      500
    );
  }
});

// GET /pendapatan/:id
app.get("/:id", checkUserToken(), async (c) => {
  const id = c.req.param("id");
  try {
    const data = await prisma.pendapatan.findUnique({
      where: { id },
      include: {
        user: {
          select: {
            id: true,
            fullname: true,
            username: true,
          },
        },
        payment: {
          include: {
            customer: true,
          },
        },
      },
    });

    if (!data) {
      return c.json(
        {
          success: false,
          message: "Data pendapatan tidak ditemukan.",
        },
        404
      );
    }

    return c.json({
      success: true,
      message: "Detail pendapatan berhasil diambil.",
      data,
    });
  } catch (error) {
    console.error(error);
    return c.json(
      {
        success: false,
        message: "Gagal mengambil detail pendapatan.",
      },
      500
    );
  }
});

export default app;
