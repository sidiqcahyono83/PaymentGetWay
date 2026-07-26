import { Hono } from "hono";
import { prisma } from "../../lib/prisma";

const app = new Hono();

/**
 * GET /bukukas
 * List Buku Kas
 *
 * Query:
 * ?page=1
 * ?limit=10
 * ?bulan=7
 * ?tahun=2026
 */
app.get("/", async (c) => {
  try {
    const page = Number(c.req.query("page") ?? 1);
    const limit = Number(c.req.query("limit") ?? 10);

    const bulan = c.req.query("bulan");
    const tahun = c.req.query("tahun");

    const where: any = {};

    if (bulan && tahun) {
      where.tanggal = {
        gte: new Date(Number(tahun), Number(bulan) - 1, 1),
        lt: new Date(Number(tahun), Number(bulan), 1),
      };
    }

    const [total, data] = await prisma.$transaction([
      prisma.bukuKas.count({
        where,
      }),

      prisma.bukuKas.findMany({
        where,
        include: {
          user: {
            select: {
              id: true,
              fullname: true,
              username: true,
            },
          },

          pendapatan: {
            include: {
              payment: {
                include: {
                  customer: {
                    select: {
                      id: true,
                      fullname: true,
                      username: true,
                    },
                  },
                },
              },
            },
          },

          pengeluaran: {
            include: {
              user: {
                select: {
                  id: true,
                  fullname: true,
                  username: true,
                },
              },
            },
          },
        },

        orderBy: {
          tanggal: "desc",
        },

        skip: (page - 1) * limit,

        take: limit,
      }),
    ]);

    return c.json({
      success: true,
      total,
      page,
      limit,
      data,
    });
  } catch (error: any) {
    return c.json(
      {
        success: false,
        message: error.message,
      },
      500,
    );
  }
});

/**
 * GET /bukukas/:id
 */
app.get("/:id", async (c) => {
  try {
    const id = c.req.param("id");

    const data = await prisma.bukuKas.findUnique({
      where: {
        id,
      },

      include: {
        user: true,

        pendapatan: {
          include: {
            payment: {
              include: {
                customer: true,
              },
            },
          },
        },

        pengeluaran: {
          include: {
            user: true,
          },
        },
      },
    });

    if (!data) {
      return c.json(
        {
          success: false,
          message: "Data tidak ditemukan.",
        },
        404,
      );
    }

    return c.json({
      success: true,
      data,
    });
  } catch (error: any) {
    return c.json(
      {
        success: false,
        message: error.message,
      },
      500,
    );
  }
});

/**
 * GET /bukukas/summary
 */
app.get("/summary/total", async (c) => {
  try {
    const summary = await prisma.bukuKas.aggregate({
      _sum: {
        totalMasuk: true,
        totalKeluar: true,
      },
    });

    const lastSaldo = await prisma.bukuKas.findFirst({
      orderBy: {
        tanggal: "desc",
      },
    });

    return c.json({
      success: true,

      totalMasuk: summary._sum.totalMasuk ?? 0,

      totalKeluar: summary._sum.totalKeluar ?? 0,

      saldoAkhir: lastSaldo?.saldoAkhir ?? 0,
    });
  } catch (error: any) {
    return c.json(
      {
        success: false,
        message: error.message,
      },
      500,
    );
  }
});

export default app;
