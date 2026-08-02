import { Hono } from "hono";
import z from "zod";
import { CustomerStatus } from "../../generated/prisma/client";
import { hashPassword } from "../../lib/password";
import { phpurl } from "../../lib/php";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import { checkCustomerToken } from "../midleware/checkCustomerToken";
import { data } from "./cus";

export const app = new Hono();

app.get("/all", checkUserToken(), async (c) => {
  const user = c.get("user");

  try {
    const customers = await prisma.customer.findMany({
      // where: {
      //   area: {
      //     users: {
      //       some: {
      //         id: user.id,
      //       },
      //     },
      //   },
      // },
      select: {
        id: true,
        username: true,
        fullname: true,
        address: true,
        phoneNumber: true,
        ontName: true,
        redamanOlt: true,
        diskon: true,
        status: true,
        paketId: true,
        areaId: true,
        odpId: true,
        modemId: true,
        oltId: true,
      },
    });

    console.log("Found:", customers.length);
    return c.json(customers);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch customers." }, 500);
  }
});

app.get("/:id", async (c) => {
  const id = c.req.param("id");
  try {
    const customers = await prisma.customer.findUnique({
      where: {
        id: id,
      },
      include: {
        payments: true,
        paket: true,
        area: true,
        odp: true,
        modem: true,
      },
    });

    return c.json(customers);
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch customers." }, 500);
  }
});

//-- ZOD VALIDASI Customer Input --//
const customerSchema = z.object({
  username: z.string().trim().min(3),
  fullname: z.string().trim().min(3),

  email: z.string().email().optional().nullable(),
  phoneNumber: z.string().optional().nullable(),
  address: z.string().optional().nullable(),

  ontName: z.string().optional().nullable(),
  redamanOlt: z.string().optional().nullable(),

  password: z.string().min(6),

  diskon: z.number().int().min(0).default(0),

  status: z.enum(CustomerStatus).default(CustomerStatus.PENDING),

  paketId: z.string().optional().nullable(),
  areaId: z.string().optional().nullable(),
  odpId: z.string().optional().nullable(),
  modemId: z.string().optional().nullable(),
  oltId: z.string().optional().nullable(),
});

app.post("/", async (c) => {
  try {
    const json = await c.req.json();

    const body = customerSchema.parse(json);

    const customer = await prisma.$transaction(async (tx) => {
      return tx.customer.create({
        data: {
          username: body.username.trim().toLowerCase(),
          fullname: body.fullname.trim(),

          email: body.email?.trim().toLowerCase() || null,
          phoneNumber: body.phoneNumber?.trim() || null,
          address: body.address?.trim() || null,

          ontName: body.ontName?.trim() || null,
          redamanOlt: body.redamanOlt?.trim() || null,

          diskon: body.diskon,
          status: body.status as CustomerStatus,

          paketId: body.paketId,
          areaId: body.areaId,
          odpId: body.odpId,
          modemId: body.modemId,
          oltId: body.oltId,

          password: {
            create: {
              hash: await hashPassword(body.password),
            },
          },
        },
        include: {
          paket: true,
          area: true,
          odp: true,
          modem: true,
          olt: true,
        },
      });
    });

    return c.json(
      {
        success: true,
        message: "Customer berhasil ditambahkan.",
        data: customer,
      },
      201,
    );
  } catch (error: any) {
    console.error(error);

    if (error.name === "ZodError") {
      return c.json(
        {
          success: false,
          message: "Validasi gagal.",
          errors: error.flatten(),
        },
        400,
      );
    }

    if (error.code === "P2002" && error.meta?.target?.includes("username")) {
      return c.json(
        {
          success: false,
          message: "Username sudah digunakan.",
        },
        409,
      );
    }

    if (error.code === "P2002" && error.meta?.target?.includes("email")) {
      return c.json(
        {
          success: false,
          message: "Email sudah digunakan.",
        },
        409,
      );
    }

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
      },
      500,
    );
  }
});

interface pppData {
  username: string;
  password: string;
  profile: string;
  message: string;
}
//Create Customer dan Cretae PPPoE
app.post("/register", async (c) => {
  try {
    const body = await c.req.json();

    //-----------------------------------
    // Validasi
    //-----------------------------------

    if (!body.username) {
      return c.json(
        {
          success: false,
          message: "Username wajib diisi",
        },
        400,
      );
    }

    if (!body.password) {
      return c.json(
        {
          success: false,
          message: "Password PPPoE wajib diisi",
        },
        400,
      );
    }

    if (!body.profile) {
      return c.json(
        {
          success: false,
          message: "Profile PPPoE wajib dipilih",
        },
        400,
      );
    }

    //-----------------------------------
    // 1. CREATE PPPoE
    //-----------------------------------

    const pppResult = await fetch(`${phpurl}/creatpppoe.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username: body.username,
        password: body.password,
        profile: body.profile,
      }),
    });

    const pppData = (await pppResult.json()) as pppData;

    if (!pppResult.ok) {
      return c.json(
        {
          success: false,
          message: pppData.message ?? "Gagal membuat user PPPoE",
        },
        400,
      );
    }

    //-----------------------------------
    // 2. CREATE CUSTOMER
    //-----------------------------------

    const customer = await prisma.customer.create({
      data: {
        username: body.username,
        fullname: body.fullname,
        address: body.address,
        phoneNumber: body.phoneNumber,
        ontName: body.ontName,
        redamanOlt: body.redamanOlt,
        diskon: Number(body.diskon ?? 0),
        olt: body.olt ?? "sruweng",
        status: body.status ?? "aktif",

        paketId: body.paketId || null,
        areaId: body.areaId || null,
        odpId: body.odpId || null,
        modemId: body.modemId || null,
        oltId: body.oltId || null,
      },
      include: {
        paket: true,
        area: true,
        odp: true,
        modem: true,
      },
    });

    return c.json(
      {
        success: true,
        message: "Customer berhasil ditambahkan.",
        customer,
        pppoe: pppData,
      },
      201,
    );
  } catch (error: any) {
    console.error(error);

    if (error.code === "P2002") {
      return c.json(
        {
          success: false,
          message: "Username sudah digunakan.",
        },
        400,
      );
    }

    return c.json(
      {
        success: false,
        message: "Gagal menambahkan customer.",
      },
      500,
    );
  }
});

app.patch("/:id", async (c) => {
  try {
    const id = c.req.param("id");
    const body = await c.req.json();

    //cekbody
    if (!body || Object.keys(body).length === 0) {
      return c.json(
        {
          success: false,
          message: "Data yang dikirim kosong.",
        },
        400,
      );
    }
    // Cek customer
    const customer = await prisma.customer.findUnique({
      where: {
        id,
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

    const updatedCustomer = await prisma.customer.update({
      where: {
        id,
      },
      data: {
        ...(body.username !== undefined && {
          username: body.username,
        }),

        ...(body.fullname !== undefined && {
          fullname: body.fullname,
        }),

        ...(body.address !== undefined && {
          address: body.address,
        }),

        ...(body.phonenumber !== undefined && {
          phonenumber: body.phonenumber,
        }),

        ...(body.ontName !== undefined && {
          ontName: body.ontName,
        }),

        ...(body.redamanOlt !== undefined && {
          redamanOlt: body.redamanOlt,
        }),

        ...(body.diskon !== undefined && {
          diskon: Number(body.diskon),
        }),

        ...(body.olt !== undefined && {
          olt: body.olt,
        }),

        ...(body.status !== undefined && {
          status: body.status,
        }),

        // Relasi
        ...(body.paketId !== undefined && {
          paketId: body.paketId || null,
        }),

        ...(body.areaId !== undefined && {
          areaId: body.areaId || null,
        }),

        ...(body.odpId !== undefined && {
          odpId: body.odpId || null,
        }),

        ...(body.modemId !== undefined && {
          modemId: body.modemId || null,
        }),

        ...(body.oltId !== undefined && {
          oltId: body.oltId || null,
        }),
      },

      include: {
        paket: true,
        area: true,
        odp: true,
        modem: true,
      },
    });

    return c.json({
      success: true,
      message: "Customer berhasil diperbarui.",
      data: updatedCustomer,
    });
  } catch (error: any) {
    console.error(error);

    if (error.code === "P2002") {
      return c.json(
        {
          success: false,
          message: "Username sudah digunakan.",
        },
        400,
      );
    }

    return c.json(
      {
        success: false,
        message: "Gagal memperbarui customer.",
      },
      500,
    );
  }
});

//GET /customers?page=1&limit=10&search=name
app.get("/", checkCustomerToken(), async (c) => {
  const page = Number(c.req.query("page") ?? 1);
  const limit = Number(c.req.query("limit") ?? 10);
  const search = c.req.query("search") ?? "";

  const where = {
    OR: [
      {
        fullname: {
          contains: search,
        },
      },
      {
        username: {
          contains: search,
        },
      },
    ],
  };

  const total = await prisma.customer.count({
    where,
  });

  const customers = await prisma.customer.findMany({
    where,
    skip: (page - 1) * limit,
    take: limit,
    orderBy: {
      fullname: "asc",
    },
    include: {
      paket: true,
      area: true,
      odp: true,
      modem: true,
    },
  });

  return c.json({
    data: customers,

    pagination: {
      page,
      limit,
      total,
      totalPages: Math.ceil(total / limit),
    },
  });
});

//---CREATE-MANY--//
app.post("/seed-customer", checkUserToken(), async (c) => {
  try {
    const parseDate = (value?: string | Date | null): Date | undefined => {
      if (!value) return undefined;

      if (value instanceof Date) {
        return isNaN(value.getTime()) ? undefined : value;
      }

      const date = new Date(value);

      return isNaN(date.getTime()) ? undefined : date;
    };

    // ===========================
    // Ambil Master Data Sekali
    // ===========================

    const [pakets, areas, odps, modems, olts] = await Promise.all([
      prisma.paket.findMany({ select: { id: true } }),
      prisma.area.findMany({ select: { id: true } }),
      prisma.odp.findMany({ select: { id: true } }),
      prisma.modem.findMany({ select: { id: true } }),
      prisma.olt.findMany({ select: { id: true } }),
    ]);

    const existingPaketIds = new Set(pakets.map((x) => x.id));
    const existingAreaIds = new Set(areas.map((x) => x.id));
    const existingOdpIds = new Set(odps.map((x) => x.id));
    const existingModemIds = new Set(modems.map((x) => x.id));
    const existingOltIds = new Set(olts.map((x) => x.id));

    // ===========================
    // Hash Password Paralel
    // ===========================

    const prepared = await Promise.all(
      data.map(async (item) => ({
        ...item,
        passwordHash: item.password ? await hashPassword(item.password) : null,
      })),
    );

    // ===========================
    // Data Customer
    // ===========================

    const customers = prepared.map((item) => {
      const status =
        CustomerStatus[item.status as keyof typeof CustomerStatus] ??
        CustomerStatus.PENDING;

      return {
        id: item.id,
        username: item.username,
        fullname: item.fullname,
        email: item.email,
        phoneNumber: item.phoneNumber,
        address: item.address,
        ontName: item.ontName,
        redamanOlt: item.redamanOlt,
        diskon: item.diskon ?? 0,
        status,

        paketId:
          item.paketId && existingPaketIds.has(item.paketId)
            ? item.paketId
            : null,

        areaId:
          item.areaId && existingAreaIds.has(item.areaId) ? item.areaId : null,

        odpId: item.odpId && existingOdpIds.has(item.odpId) ? item.odpId : null,

        modemId:
          item.modemId && existingModemIds.has(item.modemId)
            ? item.modemId
            : null,

        oltId: item.oltId && existingOltIds.has(item.oltId) ? item.oltId : null,

        createdAt: parseDate(item.createdAt),
      };
    });

    // ===========================
    // Insert Customer
    // ===========================

    await prisma.customer.createMany({
      data: customers,
      skipDuplicates: true,
    });

    // ===========================
    // Password
    // ===========================

    const passwords = prepared
      .filter((x) => x.passwordHash)
      .map((item) => ({
        customerId: item.id,
        hash: item.passwordHash!,
      }));

    await prisma.customerPassword.createMany({
      data: passwords,
      skipDuplicates: true,
    });

    return c.json(
      {
        success: true,
        message: "Customer berhasil diimport.",
        totalCustomer: customers.length,
        totalPassword: passwords.length,
      },
      201,
    );
  } catch (error) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Import customer gagal.",
        error: error instanceof Error ? error.message : String(error),
      },
      500,
    );
  }
});
export default app;
