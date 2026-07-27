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
    const body = await c.req.json();
    const user = c.get("user");

    if (!user) {
      return c.json({ success: false, message: "Unauthorized" }, 401);
    }

    const { total, deskripsi } = body;

    // Validasi input
    if (!total || typeof total !== "number" || total <= 0) {
      return c.json(
        {
          success: false,
          message:
            "Nominal total pendapatan wajib diisi dan harus bernilai positif.",
        },
        400
      );
    }

    if (!deskripsi) {
      return c.json(
        {
          success: false,
          message: "Deskripsi/Keterangan pendapatan wajib diisi.",
        },
        400
      );
    }

    const hasil = await prisma.$transaction(async (tx) => {
      // 1. Ambil saldo kas terakhir user
      const saldoAwal = await getLastSaldo(tx, user.id);

      // 2. Buat Record Pendapatan tanpa paymentId
      const pendapatan = await tx.pendapatan.create({
        data: {
          userId: user.id,
          total: total,
          deskripsi: deskripsi, // contoh: "Pendapatan Pemasangan Baru - Bpk Ahmad"
        },
      });

      // 3. Cari atau Buat Buku Kas Harian
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
        // Update Buku Kas yang sudah ada hari ini
        bukuKas = await tx.bukuKas.update({
          where: { id: bukuKas.id },
          data: {
            totalMasuk: { increment: total },
            saldoAkhir: { increment: total },
            pendapatan: {
              connect: { id: pendapatan.id },
            },
          },
        });
      } else {
        // Buat Buku Kas baru untuk hari ini
        bukuKas = await tx.bukuKas.create({
          data: {
            userId: user.id,
            tanggal: new Date(),
            totalMasuk: total,
            totalKeluar: 0,
            saldoAkhir: saldoAwal + total,
            deskripsi: "Pencatatan Pendapatan Harian",
            keterangan: "Pemasukan Langsung / Non-Invoice",
            pendapatan: {
              connect: { id: pendapatan.id },
            },
          },
        });
      }

      return {
        pendapatan,
        bukuKas,
      };
    });

    return c.json(
      {
        success: true,
        message: "Pendapatan manual berhasil dicatat.",
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

//GET /pendapatan?page=1&limit=10&search=name
// app.get("/", checkUserToken(), async (c) => {
//   try {
//     const page = Number(c.req.query("page") ?? 1);
//     const limit = Number(c.req.query("limit") ?? 10);
//     const search = c.req.query("search") ?? "";

//     const bulan = c.req.query("bulan");
//     const tahun = c.req.query("tahun");
//     const metode = c.req.query("metode");

//     const tanggalAwal = c.req.query("tanggalAwal");
//     const tanggalAkhir = c.req.query("tanggalAkhir");

//     const skip = (page - 1) * limit;

//     const where: Prisma.PendapatanWhereInput = {};

//     /**
//      * Search
//      */

//     if (search) {
//       where.pembayaran = {
//         some: {
//           OR: [
//             {
//               customer: {
//                 fullname: {
//                   contains: search,
//                 },
//               },
//             },
//             {
//               customer: {
//                 username: {
//                   contains: search,
//                 },
//               },
//             },
//             {
//               customer: {
//                 phonenumber: {
//                   contains: search,
//                 },
//               },
//             },
//             {
//               metode: {
//                 contains: search,
//               },
//             },
//           ],
//         },
//       };
//     }

//     /**
//      * Metode
//      */

//     if (metode) {
//       where.metode = metode;
//     }

//     /**
//      * Bulan + Tahun
//      */

//     if (bulan && tahun) {
//       const start = new Date(Number(tahun), Number(bulan) - 1, 1);

//       const end = new Date(Number(tahun), Number(bulan), 1);

//       where.createdAt = {
//         gte: start,
//         lt: end,
//       };
//     }

//     /**
//      * Rentang tanggal
//      */

//     if (tanggalAwal || tanggalAkhir) {
//       where.createdAt = {
//         ...(tanggalAwal && {
//           gte: new Date(tanggalAwal),
//         }),

//         ...(tanggalAkhir && {
//           lte: new Date(tanggalAkhir),
//         }),
//       };
//     }

//     const [total, pendapatan] = await prisma.$transaction([
//       prisma.pendapatan.count({
//         where,
//       }),

//       prisma.pendapatan.findMany({
//         where,

//         include: {
//           _count: {
//             select: {
//               pembayaran: true,
//             },
//           },
//           pembayaran: {
//             include: {
//               customer: true,
//               user: true,
//             },
//           },
//         },

//         orderBy: {
//           createdAt: "desc",
//         },

//         skip,

//         take: limit,
//       }),
//     ]);

//     return c.json({
//       success: true,
//       message: "Data pendapatan berhasil diambil.",

//       data: pendapatan,

//       pagination: {
//         page,
//         limit,
//         total,
//         totalPages: Math.ceil(total / limit),
//       },
//     });
//   } catch (error) {
//     console.error(error);

//     return c.json(
//       {
//         success: false,
//         message: "Gagal mengambil data pendapatan.",
//       },
//       500
//     );
//   }
// });

// app.get("/:id", checkUserToken(), async (c) => {
//   const id = c.req.param("id");
//   try {
//     const res = await prisma.pendapatan.findUnique({
//       where: { id },
//       include: {
//         pembayaran: {
//           select: {
//             customer: true,
//             user: true,
//           },
//         },
//         _count: {
//           select: {
//             pembayaran: true,
//           },
//         },
//       },
//     });
//     const data = c.json(res);
//     return data;
//   } catch (error) {
//     console.error(error);
//   }
// });

export default app;
