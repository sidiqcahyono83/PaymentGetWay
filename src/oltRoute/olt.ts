import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";

const app = new Hono();

app.get("/all", checkUserToken(), async (c) => {
  try {
    const olts = await prisma.olt.findMany({
      select: {
        id: true,
        name: true,
        location: true,
        username: true,
        password: true,
        serial: true,
        _count: {
          select: {
            customers: true,
          },
        },
      },
    });
    return c.json(olts);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch olts." }, 500);
  }
});
app.get("/:id", checkUserToken(), async (c) => {
  const id = c.req.param("id");
  try {
    const olts = await prisma.olt.findUnique({
      where: { id },
      include: {
        customer: {
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
    });
    return c.json(olts);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch olts." }, 500);
  }
});

app.post("/", checkUserToken(), async (c) => {
  const body = await c.req.json();
  const { name, username, password, location, serial } = body;
  try {
    const olt = await prisma.olt.create({
      data: {
        name,
        username,
        password,
        location,
        serial,
      },
    });

    return c.json({ olt }, 201);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to create olt." }, 500);
  }
});

app.patch("/:id", checkUserToken(), async (c) => {
  const id = c.req.param("id");
  const body = await c.req.json();
  const { name, username, password, location, serial } = body;

  try {
    const olt = await prisma.olt.update({
      where: { id },
      data: {
        name,
        username,
        password,
        location,
        serial,
      },
    });

    return c.json({ olt });
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to update olt." }, 500);
  }
});

//GET /olts?page=1&limit=10&search=name
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

    const total = await prisma.olt.count({
      where,
    });

    const olt = await prisma.olt.findMany({
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
      message: "Data Olt berhasil diambil.",

      data: olt,

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
        message: "Gagal mengambil data OLT.",
      },
      500,
    );
  }
});

export default app;
