import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import type { PrismaClient } from "../../generated/prisma/client";

const app = new Hono<{
  Variables: {
    user: {
      id: string;
    };
  };
}>();

async function getLastSaldo(
  prisma: PrismaClient,
  userId: string,
): Promise<number> {
  const lastKas = await prisma.bukuKas.findFirst({
    where: {
      userId,
    },
    orderBy: {
      createdAt: "desc",
    },
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

    const totalKeluar = Number(body.totalKeluar);

    if (isNaN(totalKeluar) || totalKeluar <= 0) {
      return c.json(
        {
          success: false,
          message: "Total pengeluaran tidak valid.",
        },
        400,
      );
    }

    if (!body.kategori) {
      return c.json(
        {
          success: false,
          message: "Kategori wajib diisi.",
        },
        400,
      );
    }

    const hasil = await prisma.$transaction(async (tx) => {
      //-----------------------------------------
      // Ambil saldo terakhir
      //-----------------------------------------

      const saldoAwal = await getLastSaldo(tx as PrismaClient, user.id);

      //-----------------------------------------
      // Cek saldo cukup
      //-----------------------------------------

      if (saldoAwal < totalKeluar) {
        throw new Error("Saldo kas tidak mencukupi.");
      }

      //-----------------------------------------
      // Buat Buku Kas
      //-----------------------------------------

      const bukuKas = await tx.bukuKas.create({
        data: {
          userId: user.id,
          tanggal: new Date(),

          totalMasuk: 0,
          totalKeluar,

          saldoAkhir: saldoAwal - totalKeluar,

          deskripsi: "Pengeluaran",
          keterangan:
            body.keterangan ?? `${body.kategori} - ${body.deskripsi ?? ""}`,
        },
      });

      //-----------------------------------------
      // Buat Pengeluaran
      //-----------------------------------------

      const pengeluaran = await tx.pengeluaran.create({
        data: {
          userId: user.id,
          totalKeluar,
          kategori: body.kategori,
          deskripsi: body.deskripsi,
          tanggal: body.tanggal ? new Date(body.tanggal) : new Date(),

          bukuKasId: bukuKas.id,
        },
      });

      return {
        pengeluaran,
        bukuKas,
      };
    });

    return c.json(
      {
        success: true,
        message: "Pengeluaran berhasil disimpan.",
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

export default app;
