import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import { constants } from "node:buffer";

export const app = new Hono();

app.get("/all", checkUserToken(), async (c) => {
  try {
    const modems = await prisma.modem.findMany({
      select: {
        id: true,
        name: true,
        serial: true,
        _count: {
          select: {
            customer: true,
          },
        },
      },
    });

    return c.json(modems);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch modems." }, 500);
  }
});

app.post("/", async (c) => {
  const body = await c.req.json();
  const { name, serial } = body;

  try {
    const modem = await prisma.modem.create({
      data: {
        name,
        serial,
      },
    });

    return c.json({ modem }, 201);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to create modem." }, 500);
  }
});

app.patch("/:id", async (c) => {
  const id = c.req.param("id");
  const body = await c.req.json();
  const { name, serial } = body;

  try {
    const modem = await prisma.modem.update({
      where: { id },
      data: {
        name,
        serial,
      },
    });

    return c.json({ modem });
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to update modem." }, 500);
  }
});
app.get("/:id", async (c) => {
  const id = c.req.param("id");

  try {
    const modem = await prisma.modem.findUnique({
      where: { id },
    });

    return c.json(modem);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to update paket." }, 500);
  }
});

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

    const total = await prisma.modem.count({
      where,
    });

    const modem = await prisma.modem.findMany({
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
            customer: true,
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

      data: modem,

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
