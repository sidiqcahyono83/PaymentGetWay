import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import { paket } from "./pakets";

const app = new Hono();

app.get("/all", checkUserToken(), async (c) => {
  try {
    const pakets = await prisma.paket.findMany({
      select: {
        id: true,
        name: true,
        harga: true,
        _count: {
          select: {
            customers: true,
          },
        },
      },
    });
    return c.json(pakets);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch pakets." }, 500);
  }
});

app.post("/", checkUserToken(), async (c) => {
  const body = await c.req.json();
  const { name, harga } = body;
  try {
    const paket = await prisma.paket.create({
      data: {
        name,
        harga,
      },
    });

    return c.json({ paket }, 201);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to create paket." }, 500);
  }
});

//CREATE-MANY--//
app.post("/seed-paket", async (c) => {
  try {
    // Formatting tanggal dari ISO string ke Object Date JS
    const formattedData = paket.map((item) => ({
      id: item.id,
      name: item.name,
      harga: item.harga,
    }));

    const result = await prisma.paket.createMany({
      data: formattedData,
      skipDuplicates: true, // Biar tidak error kalau ID sudah pernah di-insert
    });

    return c.json(
      {
        message: "Default paket inserted successfully.",
        count: result.count,
      },
      201
    );
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to insert default areas." }, 500);
  }
});

app.patch("/:id", async (c) => {
  const id = c.req.param("id");
  const body = await c.req.json();
  const { name, harga } = body;

  try {
    const paket = await prisma.paket.update({
      where: { id },
      data: {
        name,
        harga,
      },
    });

    return c.json({ paket });
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to update paket." }, 500);
  }
});
app.get("/:id", async (c) => {
  const id = c.req.param("id");

  try {
    const paket = await prisma.paket.findUnique({
      where: { id },
    });

    return c.json(paket);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to update paket." }, 500);
  }
});

//GET /areas?page=1&limit=10&search=name
app.get("/", checkUserToken(), async (c) => {
  try {
    const page = Number(c.req.query("page") ?? 1);
    const limit = Number(c.req.query("limit") ?? 10);
    const search = c.req.query("search") ?? "";

    const skip = (page - 1) * limit;

    const where = {
      OR: [
        {
          name: {
            contains: search,
          },
        },
      ],
    };

    const total = await prisma.paket.count({
      where,
    });

    const paket = await prisma.paket.findMany({
      where,

      include: {
        customers: {
          include: {
            paket: true,
            area: true,
            odp: true,
            modem: true,
          },
        },
        _count: {
          select: {
            customers: true,
          },
        },
      },

      orderBy: {
        createdAt: "desc",
      },

      skip,

      take: limit,
    });

    return c.json({
      success: true,
      message: "Data paket berhasil diambil.",

      data: paket,

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
      500
    );
  }
});

export default app;
