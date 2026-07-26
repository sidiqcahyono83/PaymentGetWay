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

app.get("/all", checkUserToken(), async (c) => {
  const pendapatan = await prisma.pendapatan.findMany({
    include: {
      pembayaran: {
        include: {
          customer: true,
          user: true,
        },
      },
    },
  });

  return c.json(pendapatan);
});

export async function getLastSaldo(
  prisma: PrismaClient,
  userId: string,
): Promise<number> {
  const lastKas = await prisma.bukuKas.findFirst({
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
        401,
      );
    }

    const pembayaran = body.pembayaran ?? [];

    if (!Array.isArray(pembayaran) || pembayaran.length === 0) {
      return c.json(
        {
          success: false,
          message: "Minimal pilih satu pembayaran.",
        },
        400,
      );
    }

    const pembayaranIds = pembayaran.map((item: any) => item.pembayaranId);

    const hasil = await prisma.$transaction(async (tx) => {
      //----------------------------------------------------
      // Ambil pembayaran
      //----------------------------------------------------

      const dataPembayaran = await tx.pembayaran.findMany({
        where: {
          id: {
            in: pembayaranIds,
          },
        },
      });

      if (dataPembayaran.length !== pembayaranIds.length) {
        throw new Error("Ada pembayaran yang tidak ditemukan.");
      }

      //----------------------------------------------------
      // Cek sudah masuk pendapatan
      //----------------------------------------------------

      const sudahMasuk = dataPembayaran.find(
        (item) => item.pendapatanId !== null,
      );

      if (sudahMasuk) {
        throw new Error("Ada pembayaran yang sudah masuk pendapatan.");
      }

      //----------------------------------------------------
      // Hitung total
      //----------------------------------------------------

      const totalMasuk = dataPembayaran.reduce(
        (sum, item) => sum + item.totalBayar,
        0,
      );

      //----------------------------------------------------
      // Saldo terakhir
      //----------------------------------------------------

      const lastKas = await tx.bukuKas.findFirst({
        where: {
          userId: user.id,
        },
        orderBy: {
          createdAt: "desc",
        },
      });

      const saldoAwal = lastKas?.saldoAkhir ?? 0;

      //----------------------------------------------------
      // Buat Pendapatan
      //----------------------------------------------------

      const pendapatan = await tx.pendapatan.create({
        data: {
          totalMasuk,
          metode: body.metode,
          deskripsi: body.deskripsi,

          pembayaran: {
            connect: pembayaranIds.map((id: string) => ({
              id,
            })),
          },
        },
      });

      //----------------------------------------------------
      // Update pembayaran
      //----------------------------------------------------

      await tx.pembayaran.updateMany({
        where: {
          id: {
            in: pembayaranIds,
          },
        },
        data: {
          pendapatanId: pendapatan.id,
        },
      });

      //----------------------------------------------------
      // Buat Buku Kas
      //----------------------------------------------------

      const bukuKas = await tx.bukuKas.create({
        data: {
          userId: user.id,
          tanggal: new Date(),

          totalMasuk,
          totalKeluar: 0,

          saldoAkhir: saldoAwal + totalMasuk,

          deskripsi: "Pendapatan",
        },
      });

      //----------------------------------------------------
      // Hubungkan BukuKas <-> Pendapatan
      //----------------------------------------------------

      await tx.pendapatan.update({
        where: {
          id: pendapatan.id,
        },
        data: {
          bukuKas: {
            connect: {
              id: bukuKas.id,
            },
          },
        },
      });

      return {
        pendapatan,
        bukuKas,
        totalMasuk,
        totalCustomer: dataPembayaran.length,
      };
    });

    return c.json(
      {
        success: true,
        message: "Pendapatan berhasil dibuat.",
        data: hasil,
      },
      201,
    );
  } catch (err: any) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: err.message,
      },
      400,
    );
  }
});

//GET /pendapatan?page=1&limit=10&search=name
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
     * Search
     */

    if (search) {
      where.pembayaran = {
        some: {
          OR: [
            {
              customer: {
                fullname: {
                  contains: search,
                },
              },
            },
            {
              customer: {
                username: {
                  contains: search,
                },
              },
            },
            {
              customer: {
                phonenumber: {
                  contains: search,
                },
              },
            },
            {
              metode: {
                contains: search,
              },
            },
          ],
        },
      };
    }

    /**
     * Metode
     */

    if (metode) {
      where.metode = metode;
    }

    /**
     * Bulan + Tahun
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
     * Rentang tanggal
     */

    if (tanggalAwal || tanggalAkhir) {
      where.createdAt = {
        ...(tanggalAwal && {
          gte: new Date(tanggalAwal),
        }),

        ...(tanggalAkhir && {
          lte: new Date(tanggalAkhir),
        }),
      };
    }

    const [total, pendapatan] = await prisma.$transaction([
      prisma.pendapatan.count({
        where,
      }),

      prisma.pendapatan.findMany({
        where,

        include: {
          _count: {
            select: {
              pembayaran: true,
            },
          },
          pembayaran: {
            include: {
              customer: true,
              user: true,
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
      500,
    );
  }
});

app.get("/:id", checkUserToken(), async (c) => {
  const id = c.req.param("id");
  try {
    const res = await prisma.pendapatan.findUnique({
      where: { id },
      include: {
        pembayaran: {
          select: {
            customer: true,
            user: true,
          },
        },
        _count: {
          select: {
            pembayaran: true,
          },
        },
      },
    });
    const data = c.json(res);
    return data;
  } catch (error) {
    console.error(error);
  }
});

export default app;
