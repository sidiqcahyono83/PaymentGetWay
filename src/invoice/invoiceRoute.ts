import { Hono } from "hono";
import { checkUserToken } from "../midleware/cekUserToken";
import { prisma } from "../../lib/prisma";
import { generateInvoiceNumber } from "../util/generateInvoiceNumber";
import { checkCustomerToken } from "../midleware/checkCustomerToken";
import { InvoiceStatus } from "../../generated/prisma/client";

export const app = new Hono();

app.get("/dashboard", checkUserToken(), async (c) => {
  try {
    const now = new Date();

    const todayStart = new Date(now);
    todayStart.setHours(0, 0, 0, 0);

    const tomorrow = new Date(todayStart);
    tomorrow.setDate(tomorrow.getDate() + 1);

    const sevenDays = new Date(todayStart);
    sevenDays.setDate(sevenDays.getDate() + 7);

    const firstDayMonth = new Date(now.getFullYear(), now.getMonth(), 1);

    const nextMonth = new Date(now.getFullYear(), now.getMonth() + 1, 1);

    const [
      dueToday,
      dueNext7Days,

      totalInvoice,
      paid,
      unpaid,
      partial,
      expired,
      cancelled,
      overdue,

      totalNominal,
      paidNominal,
      outstandingNominal,

      invoiceThisMonth,
    ] = await Promise.all([
      // Jatuh tempo hari ini
      prisma.invoice.count({
        where: {
          status: {
            in: [InvoiceStatus.UNPAID, InvoiceStatus.PARTIAL],
          },
          dueDate: {
            gte: todayStart,
            lt: tomorrow,
          },
        },
      }),

      // Jatuh tempo 7 hari ke depan
      prisma.invoice.count({
        where: {
          status: {
            in: [InvoiceStatus.UNPAID, InvoiceStatus.PARTIAL],
          },
          dueDate: {
            gte: tomorrow,
            lte: sevenDays,
          },
        },
      }),

      prisma.invoice.count(),

      prisma.invoice.count({
        where: {
          status: InvoiceStatus.PAID,
        },
      }),

      prisma.invoice.count({
        where: {
          status: InvoiceStatus.UNPAID,
        },
      }),

      prisma.invoice.count({
        where: {
          status: InvoiceStatus.PARTIAL,
        },
      }),

      prisma.invoice.count({
        where: {
          status: InvoiceStatus.EXPIRED,
        },
      }),

      prisma.invoice.count({
        where: {
          status: InvoiceStatus.CANCELLED,
        },
      }),

      prisma.invoice.count({
        where: {
          status: {
            in: [InvoiceStatus.UNPAID, InvoiceStatus.PARTIAL],
          },
          dueDate: {
            lt: now,
          },
        },
      }),

      prisma.invoice.aggregate({
        _sum: {
          total: true,
        },
      }),

      prisma.invoice.aggregate({
        where: {
          status: InvoiceStatus.PAID,
        },
        _sum: {
          total: true,
        },
      }),

      prisma.invoice.aggregate({
        where: {
          status: {
            in: [InvoiceStatus.UNPAID, InvoiceStatus.PARTIAL],
          },
        },
        _sum: {
          total: true,
        },
      }),

      prisma.invoice.count({
        where: {
          periode: {
            gte: firstDayMonth,
            lt: nextMonth,
          },
        },
      }),
    ]);

    return c.json({
      success: true,
      data: {
        invoice: {
          total: totalInvoice,
          bulanIni: invoiceThisMonth,
        },

        status: {
          paid,
          unpaid,
          partial,
          expired,
          cancelled,
          overdue,
          dueToday,
          dueNext7Days,
        },

        nominal: {
          total: totalNominal._sum.total ?? 0,
          paid: paidNominal._sum.total ?? 0,
          outstanding: outstandingNominal._sum.total ?? 0,
        },
      },
    });
  } catch (error) {
    console.error(error);

    return c.json(
      {
        success: false,
        message: "Gagal mengambil dashboard invoice.",
      },
      500,
    );
  }
});

//POST /invoice/generate
app.post("/generate1", checkUserToken(), async (c) => {
  try {
    const { bulan, tahun, dueDate } = await c.req.json();

    if (!bulan || !tahun || !dueDate) {
      return c.json(
        {
          success: false,
          message: "bulan, tahun dan dueDate wajib diisi.",
        },
        400,
      );
    }

    const customers = await prisma.customer.findMany({
      where: {
        status: "ACTIVE",
      },
      include: {
        paket: true,
      },
    });

    if (customers.length === 0) {
      return c.json(
        {
          success: false,
          message: "Tidak ada customer aktif.",
        },
        404,
      );
    }

    const invoices = [];

    for (const customer of customers) {
      if (!customer.paket) {
        console.warn(`Customer ${customer.username} belum memiliki paket.`);
        continue;
      }

      // Cek invoice periode yang sama
      const exist = await prisma.invoice.findUnique({
        where: {
          customerId_bulan_tahun: {
            customerId: customer.id,
            bulan,
            tahun,
          },
        },
      });

      if (exist) {
        continue;
      }

      const subtotal = customer.paket.harga - customer.diskon;

      const invoice = await prisma.invoice.create({
        data: {
          invoiceNumber: await generateInvoiceNumber(),
          customerId: customer.id,
          periode: new Date(tahun, bulan - 1, 1),
          bulan,
          tahun,
          subtotal,
          diskon: customer.diskon,
          pajak: 0,
          total: subtotal,
          dueDate: new Date(dueDate),
        },
        include: {
          customer: {
            select: {
              id: true,
              fullname: true,
              username: true,
              phoneNumber: true,
              status: true,
            },
          },
        },
      });

      invoices.push(invoice);
    }

    return c.json(
      {
        success: true,
        jumlah_invoice: invoices.length,
        data: invoices,
        pagination: {
          page: 1,
          limit: invoices.length,
          total: invoices.length,
          totalPages: 1,
        },
      },
      201,
    );
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
      },
      500,
    );
  }
});

// POST /invoice/generate cek auth
app.post("/generate", checkUserToken(), async (c) => {
  try {
    const { bulan, tahun, dueDate } = await c.req.json();

    if (!bulan || !tahun || !dueDate) {
      return c.json(
        {
          success: false,
          message: "bulan, tahun dan dueDate wajib diisi.",
        },
        400,
      );
    }

    const customers = await prisma.customer.findMany({
      where: {
        status: "ACTIVE",
      },
      include: {
        paket: true,
      },
    });

    if (customers.length === 0) {
      return c.json(
        {
          success: false,
          message: "Tidak ada customer aktif.",
        },
        404,
      );
    }

    const invoices = [];

    for (const customer of customers) {
      if (!customer.paket) {
        console.warn(`Customer ${customer.username} belum memiliki paket.`);
        continue;
      }

      // Cek apakah invoice periode tersebut sudah ada
      const exist = await prisma.invoice.findUnique({
        where: {
          customerId_bulan_tahun: {
            customerId: customer.id,
            bulan,
            tahun,
          },
        },
      });

      if (exist) {
        continue;
      }

      const subtotal = customer.paket.harga - customer.diskon;

      const invoice = await prisma.invoice.create({
        data: {
          invoiceNumber: await generateInvoiceNumber(),
          customerId: customer.id,
          periode: new Date(tahun, bulan - 1, 1),
          bulan,
          tahun,
          subtotal,
          diskon: customer.diskon,
          pajak: 0,
          total: subtotal,
          dueDate: new Date(dueDate),
        },
        include: {
          customer: {
            select: {
              id: true,
              fullname: true,
              username: true,
              phoneNumber: true,
              status: true,
            },
          },
        },
      });

      invoices.push(invoice);
    }

    return c.json(
      {
        success: true,
        data: invoices,
        pagination: {
          page: 1,
          limit: invoices.length,
          total: invoices.length,
          totalPages: 1,
        },
      },
      201,
    );
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan pada server.",
      },
      500,
    );
  }
});

// app.get("/", checkLogin(), checkRole("SUPER_ADMIN", "ADMIN"), async (c) => {
//   try {
//     const page = Number(c.req.query("page") ?? 1);
//     const limit = Number(c.req.query("limit") ?? 10);

//     const search = c.req.query("search") ?? "";
//     const status = c.req.query("status");
//     const bulan = c.req.query("bulan");
//     const tahun = c.req.query("tahun");

//     const skip = (page - 1) * limit;

//     const where: any = {};

//     if (status) {
//       where.status = status;
//     }

//     if (bulan) {
//       where.bulan = Number(bulan);
//     }

//     if (tahun) {
//       where.tahun = Number(tahun);
//     }

//     if (search) {
//       where.customer = {
//         OR: [
//           {
//             fullname: {
//               contains: search,
//             },
//           },
//           {
//             username: {
//               contains: search,
//             },
//           },
//         ],
//       };
//     }

//     const [data, total] = await prisma.$transaction([
//       prisma.invoice.findMany({
//         where,
//         skip,
//         take: limit,

//         include: {
//           customer: {
//             select: {
//               id: true,
//               fullname: true,
//               username: true,
//               phoneNumber: true,
//               status: true,
//             },
//           },
//         },

//         orderBy: [
//           {
//             tahun: "desc",
//           },
//           {
//             bulan: "desc",
//           },
//           {
//             createdAt: "desc",
//           },
//         ],
//       }),

//       prisma.invoice.count({
//         where,
//       }),
//     ]);

//     return c.json({
//       success: true,
//       data,
//       pagination: {
//         page,
//         limit,
//         total,
//         totalPages: Math.ceil(total / limit),
//       },
//     });
//   } catch (err) {
//     console.error(err);

//     return c.json(
//       {
//         success: false,
//         message: "Gagal mengambil invoice.",
//       },
//       500,
//     );
//   }
// });

app.get("/", checkUserToken(), async (c) => {
  try {
    const page = Number(c.req.query("page") ?? 1);
    const limit = Number(c.req.query("limit") ?? 10);

    const search = c.req.query("search") ?? "";
    const status = c.req.query("status");
    const bulan = c.req.query("bulan");
    const tahun = c.req.query("tahun");

    const skip = (page - 1) * limit;

    const where: any = {};

    if (status) {
      where.status = status;
    }

    if (bulan) {
      where.bulan = Number(bulan);
    }

    if (tahun) {
      where.tahun = Number(tahun);
    }

    if (search) {
      where.customer = {
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
    }

    const [data, total] = await prisma.$transaction([
      prisma.invoice.findMany({
        where,
        skip,
        take: limit,

        include: {
          customer: {
            select: {
              id: true,
              fullname: true,
              username: true,
              phoneNumber: true,
              status: true,
            },
          },
        },

        orderBy: [
          {
            invoiceNumber: "asc",
          },
          {
            tahun: "desc",
          },
          {
            bulan: "desc",
          },
          {
            createdAt: "desc",
          },
        ],
      }),

      prisma.invoice.count({
        where,
      }),
    ]);

    return c.json({
      success: true,
      jumlah: data.length,
      pagination: {
        page,
        limit,
        total,
        totalPages: Math.ceil(total / limit),
      },
      data,
    });
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Gagal mengambil invoice.",
      },
      500,
    );
  }
});

app.get("/:id", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");

    const invoice = await prisma.invoice.findUnique({
      where: {
        id,
      },
      include: {
        customer: {
          include: {
            paket: true,
            area: true,
          },
        },

        payments: true,
      },
    });

    if (!invoice) {
      return c.json(
        {
          success: false,
          message: "Invoice tidak ditemukan.",
        },
        404,
      );
    }

    return c.json({
      success: true,
      data: invoice,
    });
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan.",
      },
      500,
    );
  }
});

//GET /invoice/customer/:customerId//
app.get("/customer/:customerId", checkUserToken(), async (c) => {
  try {
    const customerId = c.req.param("customerId");

    const invoices = await prisma.invoice.findMany({
      where: {
        customerId,
      },

      orderBy: [
        {
          tahun: "desc",
        },
        {
          bulan: "desc",
        },
      ],
    });

    return c.json({
      success: true,
      data: invoices,
    });
  } catch (err) {
    return c.json(
      {
        success: false,
      },
      500,
    );
  }
});

//PATCH /invoice/:id/cancel
app.patch("/:id/cancel", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");

    const invoice = await prisma.invoice.findUnique({
      where: { id },
      include: {
        payments: true,
      },
    });

    if (!invoice) {
      return c.json(
        {
          success: false,
          message: "Invoice tidak ditemukan.",
        },
        404,
      );
    }

    if (invoice.status === "PAID") {
      return c.json(
        {
          success: false,
          message: "Invoice yang sudah dibayar tidak dapat dibatalkan.",
        },
        400,
      );
    }

    if (invoice.payments.length > 0) {
      return c.json(
        {
          success: false,
          message: "Invoice sudah memiliki transaksi pembayaran.",
        },
        400,
      );
    }

    const updated = await prisma.invoice.update({
      where: {
        id,
      },
      data: {
        status: "CANCELLED",
      },
    });

    return c.json({
      success: true,
      message: "Invoice berhasil dibatalkan.",
      data: updated,
    });
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan.",
      },
      500,
    );
  }
});

//PATCH /invoice/:id/expired
app.patch("/:id/expired", checkUserToken(), async (c) => {
  try {
    const id = c.req.param("id");

    const invoice = await prisma.invoice.findUnique({
      where: {
        id,
      },
    });

    if (!invoice) {
      return c.json(
        {
          success: false,
          message: "Invoice tidak ditemukan.",
        },
        404,
      );
    }

    if (invoice.status === "PAID") {
      return c.json(
        {
          success: false,
          message: "Invoice sudah dibayar.",
        },
        400,
      );
    }

    if (invoice.status === "CANCELLED") {
      return c.json(
        {
          success: false,
          message: "Invoice telah dibatalkan.",
        },
        400,
      );
    }

    if (invoice.dueDate > new Date()) {
      return c.json(
        {
          success: false,
          message: "Invoice belum melewati jatuh tempo.",
        },
        400,
      );
    }

    const updated = await prisma.invoice.update({
      where: {
        id,
      },
      data: {
        status: "EXPIRED",
      },
    });

    return c.json({
      success: true,
      message: "Invoice berhasil diubah menjadi EXPIRED.",
      data: updated,
    });
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Terjadi kesalahan.",
      },
      500,
    );
  }
});

//GET /invoice/me untuk customers
app.get("/me", checkCustomerToken(), async (c) => {
  try {
    const customer = c.get("customer");

    const invoices = await prisma.invoice.findMany({
      where: {
        id: customer.id,
      },

      include: {
        payments: {
          include: {
            attachments: true,
            verification: {
              include: {
                verifiedBy: {
                  select: {
                    id: true,
                    fullname: true,
                  },
                },
              },
            },
          },

          orderBy: {
            createdAt: "desc",
          },
        },
      },

      orderBy: [
        {
          tahun: "desc",
        },
        {
          bulan: "desc",
        },
      ],
    });

    return c.json({
      success: true,
      data: invoices,
    });
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: "Gagal mengambil invoice.",
      },
      500,
    );
  }
});

export default app;
