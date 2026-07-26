import { Hono } from "hono";
import { prisma } from "../../lib/prisma";
import { checkUserToken } from "../midleware/cekUserToken";
import { phpurl } from "../../lib/php";

export const app = new Hono();

interface PPPActive {
  ".id": string;
  name: string;
  service: string;
  "caller-id": string;
  address: string;
  uptime: string;
  encoding: string;
  "session-id": string;
  "limit-bytes-in": string;
  "limit-bytes-out": string;
  radius: string;
}

interface PPPActiveResponse {
  status: number;
  message: string;
  jumlah_active_ppp: number;
  jumlah_disabled_ppp: number;
  active_ppp: PPPActive[];
}
interface MonthlyIncome {
  month: string;
  year: number;
  income: number;
}

const monthNames = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "Mei",
  "Jun",
  "Jul",
  "Agu",
  "Sep",
  "Okt",
  "Nov",
  "Des",
];

app.get("/", checkUserToken(), async (c) => {
  const now = new Date();

  const bulan = now.getMonth() + 1;
  const tahun = now.getFullYear();

  const awalBulan = new Date(tahun, bulan - 1, 1);
  const akhirBulan = new Date(tahun, bulan, 1);

  const startChart = new Date(now.getFullYear(), now.getMonth() - 11, 1);

  const [
    totalCustomers,
    activeCustomers,
    suspendedCustomers,
    newCustomersCount,

    invoicePaid,
    invoiceUnpaid,
    invoiceExpired,

    incomeMonth,

    newCustomers,

    unpaidCustomers,

    latestPayments,

    payments,
  ] = await Promise.all([
    prisma.customer.count(),
    prisma.customer.count({
      where: {
        status: "ACTIVE",
      },
    }),
    prisma.customer.count({
      where: {
        status: "SUSPENDED",
      },
    }),
    prisma.invoice.count({
      where: {
        bulan,
        tahun,
        status: "EXPIRED",
      },
    }),
    prisma.customer.count({
      where: {
        createdAt: {
          gte: awalBulan,
          lt: akhirBulan,
        },
      },
    }),
    prisma.invoice.count({
      where: {
        bulan,
        tahun,
        status: "PAID",
      },
    }),
    prisma.invoice.count({
      where: {
        bulan,
        tahun,
        status: "UNPAID",
      },
    }),
    prisma.payment.aggregate({
      where: {
        status: "SUCCESS",
        paidAt: {
          gte: awalBulan,
          lt: akhirBulan,
        },
      },
      _sum: {
        amount: true,
      },
    }),
    prisma.customer.findMany({
      where: {
        createdAt: {
          gte: awalBulan,
          lt: akhirBulan,
        },
      },
      include: {
        paket: true,
        area: true,
      },
      orderBy: {
        createdAt: "desc",
      },
      take: 10,
    }),
    prisma.customer.findMany({
      where: {
        invoices: {
          some: {
            bulan,
            tahun,
            status: "UNPAID",
          },
        },
      },
      include: {
        paket: true,
        area: true,
      },
      orderBy: {
        fullname: "asc",
      },
      take: 20,
    }),
    prisma.payment.findMany({
      where: {
        status: "SUCCESS",
      },
      include: {
        customer: true,
        invoice: true,
      },
      orderBy: {
        paidAt: "desc",
      },
      take: 10,
    }),
    prisma.payment.findMany({
      where: {
        status: "SUCCESS",
        paidAt: {
          not: null,
          gte: startChart,
          lt: akhirBulan,
        },
      },
      select: {
        amount: true,
        paidAt: true,
      },
      orderBy: {
        paidAt: "asc",
      },
    }),
  ]);
  const monthlyIncome: MonthlyIncome[] = [];

  for (let i = 11; i >= 0; i--) {
    const date = new Date(now.getFullYear(), now.getMonth() - i, 1);

    monthlyIncome.push({
      month: monthNames[date.getMonth()] ?? "",
      year: date.getFullYear(),
      income: 0,
    });
  }

  payments.forEach((payment) => {
    if (!payment.paidAt) return;

    const month = payment.paidAt.getMonth();
    const year = payment.paidAt.getFullYear();

    const item = monthlyIncome.find(
      (m) => m.month === monthNames[month] && m.year === year
    );

    if (item) {
      item.income += Number(payment.amount);
    }
  });
  const [pppResult, disableResult] = await Promise.all([
    fetch(`${phpurl}/pppactive.php`),
    fetch(`${phpurl}/jumlahDIsable.php`),
  ]);

  if (!pppResult.ok) {
    throw new Error("Gagal mengambil PPP Active");
  }

  if (!disableResult.ok) {
    throw new Error("Gagal mengambil PPP Disable");
  }
  // console.log(pppResult, disableResult);
  const pppData = (await pppResult.json()) as PPPActiveResponse;

  const disableData = (await disableResult.json()) as PPPActiveResponse;

  const summary = {
    totalCustomers,
    activeCustomers,
    suspendedCustomers,
    newCustomers: newCustomersCount,
    invoicePaid,
    invoiceUnpaid,
    invoiceExpired,

    income: Number(incomeMonth._sum.amount ?? 0),
    pppoeActive: pppData.jumlah_active_ppp,
    pppoeDisable: disableData.jumlah_disabled_ppp,
  };
  console.log(summary);
  return c.json({
    success: true,
    summary,
    monthlyIncome,
    latestPayments,
    newCustomers,
    unpaidCustomers,
  });
});

export default app;
