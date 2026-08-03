import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import z from "zod";
import { zValidator } from "@hono/zod-validator";

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
    });
    return c.json(olts);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch olts." }, 500);
  }
});
app.post(
  "/",
  checkUserToken(),
  zValidator(
    "json",
    z.object({
      name: z.string().min(1),
      username: z.string().min(1),
      password: z.string().min(1),
      location: z.string().nullable().optional(),
      serial: z.string().min(1),
      customerIds: z.array(z.string()).default([]),
    }),
  ),
  async (c) => {
    const body = c.req.valid("json");

    try {
      // Cek nama OLT
      const exists = await prisma.olt.findFirst({
        where: {
          name: body.name,
        },
      });

      if (exists) {
        return c.json(
          {
            message: "Nama OLT sudah digunakan.",
          },
          400,
        );
      }

      const olt = await prisma.olt.create({
        data: {
          name: body.name,
          username: body.username,
          password: body.password,
          location: body.location,
          serial: body.serial,
          customers: {
            connect: body.customerIds.map((id) => ({
              id,
            })),
          },
        },
        include: {
          customers: {
            select: {
              id: true,
              fullname: true,
              username: true,
            },
          },
        },
      });

      return c.json(
        {
          message: "OLT berhasil ditambahkan.",
          data: olt,
        },
        201,
      );
    } catch (error) {
      console.error(error);

      return c.json(
        {
          message: "Gagal menambahkan OLT.",
        },
        500,
      );
    }
  },
);

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
        customers: true,

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
