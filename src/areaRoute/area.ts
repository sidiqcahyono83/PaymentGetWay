import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import { defaultAreas } from "./ar";

export const app = new Hono();

app.get("/all", checkUserToken(), async (c) => {
  try {
    const areas = await prisma.area.findMany({
      select: {
        id: true,
        name: true,

        _count: {
          select: {
            odp: true,
            customers: true,
            users: true,
          },
        },
      },
    });

    return c.json(areas);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch areas." }, 500);
  }
});

app.post("/", async (c) => {
  const body = await c.req.json();
  const { name } = body;

  try {
    const area = await prisma.area.create({
      data: {
        name,
      },
    });

    return c.json({ area }, 201);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to create area." }, 500);
  }
});

//CREATE-MANY--//
app.post("/seed-areas", async (c) => {
  try {
    // Formatting tanggal dari ISO string ke Object Date JS
    const formattedData = defaultAreas.map((item) => ({
      id: item.id,
      name: item.name,
      createdAt: new Date(item.createdAt),
      updatedAt: new Date(item.updatedAt),
    }));

    const result = await prisma.area.createMany({
      data: formattedData,
      skipDuplicates: true, // Biar tidak error kalau ID sudah pernah di-insert
    });

    return c.json(
      {
        message: "Default areas inserted successfully.",
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
  const { name } = body;

  try {
    const area = await prisma.area.update({
      where: { id },
      data: {
        name,
      },
    });

    return c.json({ area });
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to update paket." }, 500);
  }
});
app.get("/:id", async (c) => {
  const id = c.req.param("id");

  try {
    const area = await prisma.area.findUnique({
      where: { id },
    });

    return c.json(area);
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

    const total = await prisma.area.count({
      where,
    });

    const area = await prisma.area.findMany({
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

        users: true,
        _count: {
          select: {
            customers: true,
            odp: true,
            users: true,
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
      message: "Data Area berhasil diambil.",

      data: area,

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
