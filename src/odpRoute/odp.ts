import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";

const app = new Hono();

app.get("/all", checkUserToken(), async (c) => {
  try {
    const odps = await prisma.odp.findMany({
      select: {
        id: true,
        name: true,
        rasio: true,
        passiveSpliter: true,
        // area: true,
        // _count: {
        //   select: {
        //     customers: true,
        //   },
        // },
      },
    });
    return c.json(odps);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch odps." }, 500);
  }
});

app.post("/", checkUserToken(), async (c) => {
  const body = await c.req.json();
  const { name, rasio, passiveSpliter, areaId, customerIds } = body;

  try {
    const odp = await prisma.odp.create({
      data: {
        name,
        rasio,
        passiveSpliter,

        area: areaId
          ? {
              connect: {
                id: areaId,
              },
            }
          : undefined,

        customers: customerIds?.length
          ? {
              connect: customerIds.map((id: string) => ({
                id,
              })),
            }
          : undefined,
      },
      include: {
        area: true,
        customers: true,
      },
    });

    return c.json({ odp }, 201);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to create ODP." }, 500);
  }
});
app.patch("/:id", async (c) => {
  try {
    const id = c.req.param("id");
    const body = await c.req.json();

    const { name, rasio, passiveSpliter, areaId, customerIds = [] } = body;

    // Cek ODP
    const currentOdp = await prisma.odp.findUnique({
      where: {
        id,
      },
    });

    if (!currentOdp) {
      return c.json(
        {
          success: false,
          message: "ODP tidak ditemukan.",
        },
        404,
      );
    }

    // Update data ODP
    const odp = await prisma.odp.update({
      where: {
        id,
      },
      data: {
        name,
        rasio,
        passiveSpliter,
        area: areaId
          ? {
              connect: {
                id: areaId,
              },
            }
          : undefined,
      },
    });

    /**
     * Lepaskan semua customer dari ODP ini
     */
    await prisma.customer.updateMany({
      where: {
        odpId: id,
      },
      data: {
        odpId: null,
      },
    });

    /**
     * Pasangkan customer yang dipilih ke ODP ini
     */
    if (Array.isArray(customerIds) && customerIds.length > 0) {
      await prisma.customer.updateMany({
        where: {
          id: {
            in: customerIds,
          },
        },
        data: {
          odpId: id,
        },
      });
    }
    // console.log("ODP updated successfully:", odp);
    /**
     * Ambil kembali data lengkap
     */
    const result = await prisma.odp.findUnique({
      where: {
        id,
      },
      include: {
        area: true,
        customers: {
          include: {
            paket: true,
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

    return c.json({
      success: true,
      message: "ODP berhasil diperbarui.",
      data: result,
    });
  } catch (error) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal memperbarui ODP.",
      },
      500,
    );
  }
});
app.get("/:id", async (c) => {
  const id = c.req.param("id");

  try {
    const odp = await prisma.odp.findUnique({
      where: { id },
      include: {
        area: true,
        customers: true,
        _count: {
          select: {
            customers: true,
          },
        },
      },
    });

    return c.json(odp);
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

    const total = await prisma.odp.count({
      where,
    });

    const odp = await prisma.odp.findMany({
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
        area: true,

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
      message: "Data Odp berhasil diambil.",

      data: odp,

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
        message: "Gagal mengambil data ODP.",
      },
      500,
    );
  }
});

export default app;
