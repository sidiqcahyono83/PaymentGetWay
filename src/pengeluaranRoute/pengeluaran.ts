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

import { z } from "zod";

const pengeluaranSchema = z.object({
  totalKeluar: z.number().positive("Total keluar harus lebih dari 0"),
  deskripsi: z.string().optional(),
  kategori: z.string().min(1, "Kategori wajib diisi"),
  tanggal: z.string().datetime().optional(), // Format ISO string jika ingin custom tanggal
});

async function getLastSaldo(
  prisma: any, // atau PrismaClient / Transaction Client
  userId: string
): Promise<number> {
  const lastKas = await prisma.bukuKas.findFirst({
    where: {
      userId,
    },
    orderBy: {
      createdAt: "desc", // Bisa juga menggunakan 'tanggal: desc'
    },
    select: {
      saldoAkhir: true,
    },
  });

  return lastKas?.saldoAkhir ?? 0;
}

app.post("/pengeluaran", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const { totalKeluar, deskripsi, kategori, tanggal } = await c.req.json();

    if (!totalKeluar || !kategori) {
      return c.json(
        { success: false, message: "totalKeluar dan kategori wajib diisi." },
        400
      );
    }

    const pengeluaranDate = tanggal ? new Date(tanggal) : new Date();

    const result = await prisma.$transaction(async (tx) => {
      const todayStart = new Date(
        new Date(pengeluaranDate).setHours(0, 0, 0, 0)
      );
      const todayEnd = new Date(
        new Date(pengeluaranDate).setHours(23, 59, 59, 999)
      );

      // 1. Cek apakah BukuKas untuk hari ini sudah ada
      let bukuKas = await tx.bukuKas.findFirst({
        where: {
          userId: user.id,
          tanggal: {
            gte: todayStart,
            lte: todayEnd,
          },
        },
      });

      if (!bukuKas) {
        // 2. Jika belum ada, ambil saldo akhir dari hari/transaksi sebelumnya
        const previousSaldo = await getLastSaldo(tx, user.id);

        // 3. Buat BukuKas baru untuk hari ini dengan saldo awal mengambil saldo terakhir
        bukuKas = await tx.bukuKas.create({
          data: {
            tanggal: pengeluaranDate,
            totalMasuk: 0,
            totalKeluar: totalKeluar,
            saldoAkhir: previousSaldo - totalKeluar, // Saldo akhir berkurang karena pengeluaran
            deskripsi: "Buku Kas Harian",
            keterangan: "Pencatatan Otomatis Pengeluaran",
            userId: user.id,
          },
        });
      } else {
        // 4. Jika BukuKas hari ini sudah ada, update totalKeluar dan kurangi saldoAkhir
        bukuKas = await tx.bukuKas.update({
          where: { id: bukuKas.id },
          data: {
            totalKeluar: { increment: totalKeluar },
            saldoAkhir: { decrement: totalKeluar },
          },
        });
      }

      // 5. Buat record Pengeluaran dan hubungkan ke BukuKas
      const newPengeluaran = await tx.pengeluaran.create({
        data: {
          userId: user.id,
          totalKeluar,
          deskripsi,
          kategori,
          tanggal: pengeluaranDate,
          bukuKasId: bukuKas.id,
        },
      });

      return { newPengeluaran, bukuKasTerbaru: bukuKas };
    });

    return c.json(
      {
        success: true,
        message: "Pengeluaran berhasil dicatat & Buku Kas diperbarui.",
        data: result,
      },
      201
    );
  } catch (err) {
    console.error("Error creating pengeluaran:", err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

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

    const totalKeluar = Number(body.totalKeluar);

    if (isNaN(totalKeluar) || totalKeluar <= 0) {
      return c.json(
        {
          success: false,
          message: "Total pengeluaran tidak valid.",
        },
        400
      );
    }

    if (!body.kategori) {
      return c.json(
        {
          success: false,
          message: "Kategori wajib diisi.",
        },
        400
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
      201
    );
  } catch (err: any) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: err.message,
      },
      400
    );
  }
});

// ==========================================
// 1. CREATE PENGELUARAN (POST /)
/*
{
  "totalKeluar": 150000,
  "kategori": "Operasional Kantor",
  "deskripsi": "Pembelian alat tulis kantor (ATK)"
}
*/
// ==========================================
app.post("/", checkUserToken(), async (c) => {
  try {
    const user = c.get("user");
    const { totalKeluar, deskripsi, kategori, tanggal } = await c.req.json();

    if (!totalKeluar || !kategori) {
      return c.json(
        { success: false, message: "totalKeluar dan kategori wajib diisi." },
        400
      );
    }

    const pengeluaranDate = tanggal ? new Date(tanggal) : new Date();

    const result = await prisma.$transaction(async (tx) => {
      // A. Cari BukuKas hari ini (atau buat baru jika belum ada)
      const todayStart = new Date(
        new Date(pengeluaranDate).setHours(0, 0, 0, 0)
      );
      const todayEnd = new Date(
        new Date(pengeluaranDate).setHours(23, 59, 59, 999)
      );

      let bukuKas = await tx.bukuKas.findFirst({
        where: {
          tanggal: {
            gte: todayStart,
            lte: todayEnd,
          },
        },
      });

      if (!bukuKas) {
        // Ambil saldoAkhir dari hari sebelumnya untuk kontinuitas
        const lastBukuKas = await tx.bukuKas.findFirst({
          orderBy: { tanggal: "desc" },
        });
        const previousSaldo = lastBukuKas ? lastBukuKas.saldoAkhir : 0;

        // Buat BukuKas baru untuk hari ini
        bukuKas = await tx.bukuKas.create({
          data: {
            tanggal: pengeluaranDate,
            totalMasuk: 0,
            totalKeluar: 0,
            saldoAkhir: previousSaldo,
            deskripsi: "Buku Kas Harian",
            keterangan: "Pencatatan Otomatis",
            userId: user.id,
          },
        });
      }

      // B. Buat Record Pengeluaran
      const newPengeluaran = await tx.pengeluaran.create({
        data: {
          userId: user.id,
          totalKeluar,
          deskripsi,
          kategori,
          tanggal: pengeluaranDate,
          bukuKasId: bukuKas.id,
        },
      });

      // C. Update BukuKas (tambah totalKeluar, kurangi saldoAkhir)
      await tx.bukuKas.update({
        where: { id: bukuKas.id },
        data: {
          totalKeluar: { increment: totalKeluar },
          saldoAkhir: { decrement: totalKeluar },
        },
      });

      return newPengeluaran;
    });

    return c.json(
      {
        success: true,
        message:
          "Pengeluaran berhasil dicatat dan terintegrasi dengan Buku Kas.",
        data: result,
      },
      201
    );
  } catch (err) {
    console.error("Error creating pengeluaran:", err);
    return c.json(
      { success: false, message: "Terjadi kesalahan pada server." },
      500
    );
  }
});

// ==========================================
// 2. READ ALL PENGELUARAN (GET /)
// ==========================================
app.get("/", checkUserToken(), async (c) => {
  try {
    const pengeluarans = await prisma.pengeluaran.findMany({
      include: {
        user: {
          select: { id: true, fullname: true, username: true },
        },
        bukuKas: true,
      },
      orderBy: { tanggal: "desc" },
    });

    return c.json({
      success: true,
      data: pengeluarans,
    });
  } catch (err) {
    console.error("Error fetching pengeluaran:", err);
    return c.json(
      { success: false, message: "Gagal mengambil data pengeluaran." },
      500
    );
  }
});

// ==========================================
// 3. READ SINGLE PENGELUARAN (GET /:id)
// ==========================================
app.get("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");
    const pengeluaran = await prisma.pengeluaran.findUnique({
      where: { id },
      include: {
        user: { select: { id: true, fullname: true } },
        bukuKas: true,
      },
    });

    if (!pengeluaran) {
      return c.json(
        { success: false, message: "Pengeluaran tidak ditemukan." },
        404
      );
    }

    return c.json({ success: true, data: pengeluaran });
  } catch (err) {
    console.error("Error fetching detail pengeluaran:", err);
    return c.json(
      { success: false, message: "Gagal mengambil detail pengeluaran." },
      500
    );
  }
});

// ==========================================
// 4. UPDATE PENGELUARAN (PUT /:id)
/*
    {
      "totalKeluar": 200000,
      "kategori": "Operasional Kantor",
      "deskripsi": "Revisi pembelian ATK dan tambahan kertas"
    }
*/
// ==========================================
app.put("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");
    const { totalKeluar, deskripsi, kategori } = await c.req.json();

    const existingPengeluaran = await prisma.pengeluaran.findUnique({
      where: { id },
    });

    if (!existingPengeluaran) {
      return c.json(
        { success: false, message: "Pengeluaran tidak ditemukan." },
        404
      );
    }

    const updated = await prisma.$transaction(async (tx) => {
      const oldTotal = existingPengeluaran.totalKeluar;
      const newTotal = totalKeluar !== undefined ? totalKeluar : oldTotal;
      const selisih = newTotal - oldTotal; // Selisih perubahan nominal

      // Jika ada perubahan nominal, sesuaikan kembali BukuKas terkait
      if (selisih !== 0 && existingPengeluaran.bukuKasId) {
        await tx.bukuKas.update({
          where: { id: existingPengeluaran.bukuKasId },
          data: {
            totalKeluar: { increment: selisih },
            saldoAkhir: { decrement: selisih }, // Jika pengeluaran bertambah, saldo akhir berkurang
          },
        });
      }

      // Update data pengeluaran
      return await tx.pengeluaran.update({
        where: { id },
        data: {
          totalKeluar: newTotal,
          deskripsi:
            deskripsi !== undefined ? deskripsi : existingPengeluaran.deskripsi,
          kategori:
            kategori !== undefined ? kategori : existingPengeluaran.kategori,
        },
      });
    });

    return c.json({
      success: true,
      message: "Pengeluaran berhasil diperbarui.",
      data: updated,
    });
  } catch (err) {
    console.error("Error updating pengeluaran:", err);
    return c.json(
      { success: false, message: "Gagal memperbarui pengeluaran." },
      500
    );
  }
});

// ==========================================
// 5. DELETE PENGELUARAN (DELETE /:id)
// ==========================================
app.delete("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");

    const existingPengeluaran = await prisma.pengeluaran.findUnique({
      where: { id },
    });

    if (!existingPengeluaran) {
      return c.json(
        { success: false, message: "Pengeluaran tidak ditemukan." },
        404
      );
    }

    await prisma.$transaction(async (tx) => {
      // Kembalikan/batalkan efek pengeluaran ke BukuKas
      if (existingPengeluaran.bukuKasId) {
        await tx.bukuKas.update({
          where: { id: existingPengeluaran.bukuKasId },
          data: {
            totalKeluar: { decrement: existingPengeluaran.totalKeluar },
            saldoAkhir: { increment: existingPengeluaran.totalKeluar }, // Saldo dikembalikan karena pengeluaran dibatalkan
          },
        });
      }

      // Hapus data pengeluaran
      await tx.pengeluaran.delete({
        where: { id },
      });
    });

    return c.json({
      success: true,
      message: "Pengeluaran berhasil dihapus dan Buku Kas telah disesuaikan.",
    });
  } catch (err) {
    console.error("Error deleting pengeluaran:", err);
    return c.json(
      { success: false, message: "Gagal menghapus pengeluaran." },
      500
    );
  }
});

export default app;
