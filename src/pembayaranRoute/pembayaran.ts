import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { mkdir, writeFile, unlink } from "node:fs/promises";
import { existsSync } from "node:fs";
import { extname, join } from "node:path";
import { checkUserToken } from "../midleware/cekUserToken";

const app = new Hono();

// CREATE PEMBAYARAN
app.post("/", checkUserToken(), async (c) => {
  const user = c.get("user");
  const userId = user.id;
  try {
    const body = await c.req.parseBody();

    // ==========================
    // VALIDASI
    // ==========================
    // const userId = String(body.userId || "");
    const customerId = String(body.customerId || "");
    const metode = String(body.metode || "Cash");
    const totalBayar = Number(body.totalBayar || 0);
    const periode = new Date(String(body.periode));

    if (!userId) {
      return c.json(
        {
          success: false,
          message: "User wajib dipilih.",
        },
        400,
      );
    }

    if (!customerId) {
      return c.json(
        {
          success: false,
          message: "Customer wajib dipilih.",
        },
        400,
      );
    }

    if (isNaN(totalBayar) || totalBayar <= 0) {
      return c.json(
        {
          success: false,
          message: "Total pembayaran tidak valid.",
        },
        400,
      );
    }

    if (isNaN(periode.getTime())) {
      return c.json(
        {
          success: false,
          message: "Periode tidak valid.",
        },
        400,
      );
    }

    //   ==========================
    //   CEK AWAL BAYAR
    //   ==========================
    const customer = await prisma.customer.findUnique({
      where: {
        id: customerId,
      },
    });

    if (!customer) {
      return c.json(
        {
          success: false,
          message: "Customer tidak ditemukan.",
        },
        404,
      );
    }
    const sekarang = new Date();

    const mulaiTagihan = new Date(
      customer.createdAt.getFullYear(),
      customer.createdAt.getMonth() + 1,
      1,
    );
    const periodeTagihan = new Date(
      periode.getFullYear(),
      periode.getMonth(),
      1,
    );

    if (periodeTagihan < mulaiTagihan) {
      return c.json(
        {
          success: false,
          message: `Customer mulai ditagih ${mulaiTagihan.toLocaleString(
            "id-ID",
            {
              month: "long",
              year: "numeric",
            },
          )}.`,
        },
        400,
      );
    }

    const awalBulanSekarang = new Date(
      sekarang.getFullYear(),
      sekarang.getMonth(),
      1,
    );

    if (mulaiTagihan > awalBulanSekarang) {
      return c.json(
        {
          success: false,
          message:
            "Customer belum memiliki tagihan. Pembayaran dimulai bulan depan.",
        },
        400,
      );
    }

    let cek = new Date(mulaiTagihan);
    const periodeAwal = new Date(periode.getFullYear(), periode.getMonth(), 1);

    while (cek < periodeAwal) {
      const awal = new Date(cek.getFullYear(), cek.getMonth(), 1);

      const akhir = new Date(cek.getFullYear(), cek.getMonth() + 1, 1);

      const pembayaran = await prisma.pembayaran.findFirst({
        where: {
          customerId,
          periode: {
            gte: awal,
            lt: akhir,
          },
        },
      });

      if (!pembayaran) {
        return c.json(
          {
            success: false,
            message: `Pembayaran ${awal.toLocaleString("id-ID", {
              month: "long",
              year: "numeric",
            })} belum dilakukan.`,
            requiredPeriod: awal.toLocaleString("id-ID", {
              month: "long",
              year: "numeric",
            }),
          },
          409,
        );
      }

      cek.setMonth(cek.getMonth() + 1);
    }
    // ==========================
    // CEK PEMBAYARAN BULAN INI
    // ==========================
    const awalBulan = new Date(
      periode.getFullYear(),
      periode.getMonth(),
      1,
      0,
      0,
      0,
      0,
    );

    const akhirBulan = new Date(
      periode.getFullYear(),
      periode.getMonth() + 1,
      1,
      0,
      0,
      0,
      0,
    );

    const bulan = periode.getMonth() + 1;
    const tahun = periode.getFullYear();

    const pembayaranLama = await prisma.pembayaran.findFirst({
      where: {
        customerId,
        periode: {
          gte: awalBulan,
          lt: akhirBulan,
        },
      },
      include: {
        customer: {
          select: {
            fullname: true,
            username: true,
          },
        },
      },
    });

    if (pembayaranLama) {
      return c.json(
        {
          success: false,
          message: "Pembayaran bulan ini sudah ada.",
          data: pembayaranLama,
        },
        409,
      );
    }

    // ==========================
    // UPLOAD IMAGE
    // ==========================
    let imagePath: string | null = null;

    const file = body.image as File | undefined;

    if (file && file.size > 0) {
      const allowed = ["image/jpeg", "image/jpg", "image/png", "image/webp"];

      if (!allowed.includes(file.type)) {
        return c.json(
          {
            success: false,
            message: "Format gambar tidak didukung.",
          },
          400,
        );
      }

      if (file.size > 2 * 1024 * 1024) {
        return c.json(
          {
            success: false,
            message: "Ukuran gambar maksimal 2 MB.",
          },
          400,
        );
      }

      await mkdir("./uploads/pembayaran", {
        recursive: true,
      });

      const filename =
        Date.now() + "-" + crypto.randomUUID() + extname(file.name);

      const buffer = Buffer.from(await file.arrayBuffer());

      await writeFile(join("./uploads/pembayaran", filename), buffer);

      imagePath = `/uploads/pembayaran/${filename}`;
    }

    // ==========================
    // SIMPAN DATA
    // ==========================
    const pembayaran = await prisma.pembayaran.create({
      data: {
        userId,
        customerId,
        periode,
        metode,
        totalBayar,
        bulan,
        tahun,
        pendapatanId: body.pendapatanId ? String(body.pendapatanId) : null,
        image: imagePath,
      },

      include: {
        user: {
          select: {
            id: true,
            fullname: true,
            username: true,
          },
        },

        customer: {
          include: {
            paket: {
              select: {
                id: true,
                name: true,
                harga: true,
              },
            },

            area: {
              select: {
                id: true,
                name: true,
              },
            },

            odp: {
              select: {
                id: true,
                name: true,
              },
            },

            modem: true,
          },
        },

        pendapatan: true,
      },
    });

    return c.json(
      {
        success: true,
        message: "Pembayaran berhasil disimpan.",
        data: pembayaran,
      },
      201,
    );
  } catch (error: any) {
    console.error(error);

    if (error.code === "P2002") {
      return c.json(
        {
          success: false,
          message: "Data pembayaran sudah ada.",
        },
        409,
      );
    }

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
        error:
          process.env.NODE_ENV === "development" ? error.message : undefined,
      },
      500,
    );
  }
});

// EDIT PEMBAYARAN
app.patch("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");
    const body = await c.req.parseBody();

    const pembayaranLama = await prisma.pembayaran.findUnique({
      where: { id },
    });

    if (!pembayaranLama) {
      return c.json(
        {
          success: false,
          message: "Data pembayaran tidak ditemukan.",
        },
        404,
      );
    }

    let imagePath = pembayaranLama.image;

    const metode = String(body.metode ?? pembayaranLama.metode);

    const file = body.image as File | undefined;

    // ==========================
    // GANTI IMAGE
    // ==========================
    if (file && file.size > 0) {
      const allowed = ["image/jpeg", "image/jpg", "image/png", "image/webp"];

      if (!allowed.includes(file.type)) {
        return c.json(
          {
            success: false,
            message: "Format gambar tidak didukung.",
          },
          400,
        );
      }

      if (file.size > 2 * 1024 * 1024) {
        return c.json(
          {
            success: false,
            message: "Ukuran gambar maksimal 2 MB.",
          },
          400,
        );
      }

      await mkdir("./uploads/pembayaran", {
        recursive: true,
      });

      const filename =
        Date.now() + "-" + crypto.randomUUID() + extname(file.name);

      const buffer = Buffer.from(await file.arrayBuffer());

      const filepath = join("./uploads/pembayaran", filename);

      await writeFile(filepath, buffer);

      // hapus gambar lama
      if (pembayaranLama.image) {
        const oldPath = "." + pembayaranLama.image;

        if (existsSync(oldPath)) {
          await unlink(oldPath).catch(() => {});
        }
      }

      imagePath = `/uploads/pembayaran/${filename}`;
    }

    // ==========================
    // TRANSFER -> CASH
    // ==========================
    if (
      pembayaranLama.metode.toLowerCase().includes("transfer") &&
      metode.toLowerCase() === "cash"
    ) {
      if (pembayaranLama.image) {
        const oldPath = "." + pembayaranLama.image;

        if (existsSync(oldPath)) {
          await unlink(oldPath).catch(() => {});
        }
      }

      imagePath = null;
    }

    const pembayaran = await prisma.pembayaran.update({
      where: {
        id,
      },
      data: {
        metode,
        totalBayar: body.totalBayar
          ? Number(body.totalBayar)
          : pembayaranLama.totalBayar,
        image: imagePath,
      },
      include: {
        customer: true,
        user: true,
        pendapatan: true,
      },
    });

    return c.json({
      success: true,
      message: "Pembayaran berhasil diperbarui.",
      data: pembayaran,
    });
  } catch (error: any) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal memperbarui pembayaran.",
      },
      500,
    );
  }
});

app.delete("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");

    const pembayaran = await prisma.pembayaran.findUnique({
      where: {
        id,
      },
    });

    if (!pembayaran) {
      return c.json(
        {
          success: false,
          message: "Data pembayaran tidak ditemukan.",
        },
        404,
      );
    }

    if (pembayaran.image) {
      const oldPath = "." + pembayaran.image;

      if (existsSync(oldPath)) {
        await unlink(oldPath).catch(() => {});
      }
    }

    await prisma.pembayaran.delete({
      where: {
        id,
      },
    });

    return c.json({
      success: true,
      message: "Pembayaran berhasil dihapus.",
    });
  } catch (error: any) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal menghapus pembayaran.",
      },
      500,
    );
  }
});

app.get("/all", checkUserToken(), async (c) => {
  try {
    const pembayaran = await prisma.pembayaran.findMany({
      include: {
        customer: {
          include: {
            paket: true,
            area: true,
            odp: true,
            modem: true,
          },
        },
        user: true,
        pendapatan: true,
      },
    });

    return c.json({
      success: true,
      message: "Data pembayaran berhasil diambil.",
      data: pembayaran,
    });
  } catch (error: any) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal mengambil data pembayaran.",
      },
      500,
    );
  }
});

app.get("/:id", checkUserToken(), async (c) => {
  const id = c.req.param("id");
  try {
    const pembayaran = await prisma.pembayaran.findUnique({
      where: { id: id },
      include: {
        customer: {
          include: {
            paket: true,
            area: true,
            odp: true,
            modem: true,
          },
        },
        user: true,
        pendapatan: true,
      },
    });

    return c.json({
      success: true,
      message: "Data pembayaran berhasil diambil.",
      data: pembayaran,
    });
  } catch (error: any) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal mengambil data pembayaran.",
      },
      500,
    );
  }
});

//GET /pembayaran?page=1&limit=10&search=name
app.get("/", checkUserToken(), async (c) => {
  try {
    const page = Number(c.req.query("page") ?? 1);
    const limit = Number(c.req.query("limit") ?? 10);
    const search = c.req.query("search") ?? "";

    const skip = (page - 1) * limit;

    const where = search
      ? {
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
        }
      : {};

    const [total, pembayaran] = await prisma.$transaction([
      prisma.pembayaran.count({
        where,
      }),

      prisma.pembayaran.findMany({
        where,

        include: {
          customer: {
            include: {
              paket: true,
              area: true,
              odp: true,
              modem: true,
            },
          },

          user: true,

          pendapatan: true,
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
      message: "Data pembayaran berhasil diambil.",

      data: pembayaran,

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
        message: "Gagal mengambil data pembayaran.",
      },
      500,
    );
  }
});

export default app;
