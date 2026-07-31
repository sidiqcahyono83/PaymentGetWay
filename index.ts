import { Hono } from "hono";
import { cors } from "hono/cors";
//Login//
import loginRoute from "./src/auth/login";
import loginCustomerRoute from "./src/auth/loginCustomer";
import userRoute from "./src/userRoute/user";
import areaRoute from "./src/areaRoute/area";
import paketRoute from "./src/paketRoute/paket";
import odpRoute from "./src/odpRoute/odp";
import modemRoute from "./src/modemRoute/modem";
import oltRoute from "./src/oltRoute/olt";
import customerRoute from "./src/customerRoute/customer";
import loginCustomeRoute from "./src/auth/loginCustomer";
import pembayaranRoute from "./src/pembayaranRoute/pembayaran";
import pppoeRoute from "./src/pppRoute/pppoe";

//IV dan Payment//
import invoiceRoute from "./src/invoice/invoiceRoute";
import paymentRoute from "./src/payment/payment";
import webhookRoute from "./src/webhook/wbhook";

//----KAS-----//
import pendapatanRoute from "./src/pendapatanRoute/pendapatan";
import pengeluaranRoute from "./src/pengeluaranRoute/pengeluaran";
import bukukasRoute from "./src/bukuKasRoute/bukukas";

//----ONU OLT-----//
import oltOnuRoute from "./src/oltRoute/onuOlt";

// ---Dashboard---//
import dashboardRoute from "./src/dashboard/dashboard";

// Ensure required environment variables are present before starting
import { ensureEnvVars } from "./lib/env";

import { serveStatic } from "hono/bun";

type Bindings = {
  TOKEN: string;
};

type Variables = {
  user: {
    id: string;
  };
};

export type HonoApp = {
  Bindings: Bindings;
  Variables: Variables;
};

const app = new Hono<HonoApp>();

// CORS: izinkan akses dari IP dan domain frontend
// CORS: izinkan akses dari IP dan domain frontend
app.use(
  "*",
  cors({
    origin: (origin) => {
      const allowedOrigins = [
        "http://103.63.26.87",
        "http://192.168.4.5",
        "http://192.168.4.9",
        "http://teranet.web.id",
        "https://teranet.web.id",
        "http://localhost:5173",
        "http://localhost:5174",
      ];
      if (!origin || allowedOrigins.includes(origin)) {
        return origin ?? "*";
      }
      return "null";
    },
    allowHeaders: ["Authorization", "Content-Type", "X-Requested-With"],
    allowMethods: ["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    credentials: true,
  }),
);

app.use("/uploads/*", serveStatic({ root: "./" }));
app.use("/foto", serveStatic({ root: "/home/teranet" }));
app.get("/", (c) => {
  return c.json({
    message: "NetworkStore API",
  });
});
//Login-Customer//
app.route("/auth/login/customer", loginCustomerRoute);
//Login-User//
app.route("/auth", loginRoute);
app.route("/dashboard", dashboardRoute);
app.route("/users", userRoute);
app.route("/areas", areaRoute);
app.route("/pakets", paketRoute);
app.route("/odps", odpRoute);
app.route("/modems", modemRoute);
app.route("/olts", oltRoute);
app.route("/customers", customerRoute);
app.route("/pembayaran", pembayaranRoute);
app.route("/pppoe", pppoeRoute);

//--INV--//
app.route("/invoice", invoiceRoute);

//--PEYMENT--//
app.route("/payment", paymentRoute);
app.route("/paymentGetway", webhookRoute);

// KAS //
app.route("/pendapatan", pendapatanRoute);
app.route("/pengeluaran", pengeluaranRoute);
app.route("/bukukas", bukukasRoute);

// ONU OLT //
app.route("/hsgqnew/:olt", oltOnuRoute);

const port = 3001;

// console.log(`Server running at http://localhost:${port}`);

export default {
  port,
  fetch: app.fetch,
};
// export default app;
