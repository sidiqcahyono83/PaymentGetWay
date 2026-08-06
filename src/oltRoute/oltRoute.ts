// ============================================================
// oltRoute/oltRoute.ts — route OLT (sesuai struktur proyekmu)
//
// Kunci perbaikan:
//   - oltFetch() menerima NAMA OLT (dari c.get("oltName")) —
//     dan oltFetch sekarang TOLERAN: terima nama ATAU baseUrl,
//     error jelas kalau kosong (resolveOlt).
//   - Fallback: kalau c.get("oltName") undefined, ambil dari
//     param URL.
// ============================================================

import { Hono } from "hono";
import { OLT_LIST, oltFetch, resolveOlt } from "../midleware/oltLogin";
import { oltAuth } from "./oltAuth";

export type VariablesOlt = {
  xToken: string;
  baseUrl: string;
  oltName: string;
};

const olt = new Hono<{ Variables: VariablesOlt }>();

const CACHE_AGE = 10;

/** Ambil nama OLT — dari context, fallback param URL */
function getOltName(c: any): string {
  const fromCtx = c.get?.("oltName");
  if (fromCtx) return fromCtx;

  const fromParam =
    c.req?.param?.("olt") ?? c.req?.param?.("nama") ?? c.req?.param?.("key");
  if (fromParam) return resolveOlt(fromParam);

  throw new Error("Nama OLT tidak ditemukan di context maupun URL.");
}

/** Helper: ambil ontinfo_table (cache + refresh) */
async function getOntTable(c: any, refresh = false) {
  const oltName = getOltName(c);
  return oltFetch(oltName, "/ontinfo_table", { refresh });
}

function respond(c: any, body: any) {
  const data = Array.isArray(body.data?.data) ? body.data.data : [];

  c.header("Cache-Control", `max-age=${CACHE_AGE}`);

  return c.json({
    success: body.success,
    total: data.length,
    data,
    cached: body.cached ?? false,
    fetchedAt: body.fetchedAt ?? Date.now(),
  });
}

// ------------------------------------------------------------
// GET / → SEMUA ONU
// ------------------------------------------------------------
olt.get("/", oltAuth, async (c) => {
  try {
    const refresh = c.req.query("refresh") === "1";
    const body = await getOntTable(c, refresh);

    if (!body.success) {
      return c.json(
        {
          success: false,
          message: `Gagal mengambil data OLT (${body.status})`,
        },
        502,
      );
    }

    return respond(c, body);
  } catch (err) {
    console.error("[olt] GET / gagal:", err);
    return c.json(
      { success: false, message: err instanceof Error ? err.message : "Gagal" },
      500,
    );
  }
});

// ------------------------------------------------------------
// GET /onu/:name → filter by ont_name
// ------------------------------------------------------------
olt.get("/onu/:name", oltAuth, async (c) => {
  try {
    const name = c.req.param("name");

    if (!name) {
      return c.json({ message: "ont_name tidak ditemukan" }, 400);
    }

    const refresh = c.req.query("refresh") === "1";
    const body = await getOntTable(c, refresh);

    if (!body.success) {
      return c.json(
        {
          success: false,
          message: `Gagal mengambil data OLT (${body.status})`,
        },
        502,
      );
    }

    const result = body.data.data.filter(
      (ont: any) =>
        String(ont.ont_name ?? "").toLowerCase() === name.toLowerCase(),
    );

    c.header("Cache-Control", `max-age=${CACHE_AGE}`);

    return c.json({
      success: true,
      total: result.length,
      data: result,
      cached: body.cached ?? false,
      fetchedAt: body.fetchedAt ?? Date.now(),
    });
  } catch (err) {
    console.error("[olt] GET /onu/:name gagal:", err);
    return c.json(
      { success: false, message: err instanceof Error ? err.message : "Gagal" },
      500,
    );
  }
});

// ------------------------------------------------------------
// GET /onu/sn/:sn → filter by ont_sn
// ------------------------------------------------------------
olt.get("/onu/sn/:sn", oltAuth, async (c) => {
  try {
    const sn = c.req.param("sn");

    if (!sn) {
      return c.json({ error: "ONT SN tidak ditemukan" }, 400);
    }

    const refresh = c.req.query("refresh") === "1";
    const body = await getOntTable(c, refresh);

    if (!body.success) {
      return c.json(
        {
          success: false,
          message: `Gagal mengambil data OLT (${body.status})`,
        },
        502,
      );
    }

    const result = body.data.data.filter(
      (ont: any) => String(ont.ont_sn ?? "").toLowerCase() === sn.toLowerCase(),
    );

    c.header("Cache-Control", `max-age=${CACHE_AGE}`);

    return c.json({
      success: true,
      total: result.length,
      data: result,
      cached: body.cached ?? false,
      fetchedAt: body.fetchedAt ?? Date.now(),
    });
  } catch (err) {
    console.error("[olt] GET /onu/sn/:sn gagal:", err);
    return c.json(
      { success: false, message: err instanceof Error ? err.message : "Gagal" },
      500,
    );
  }
});

// ------------------------------------------------------------
// GET /port/:port → data port (1-8)
// ------------------------------------------------------------
olt.get("/port/:port", oltAuth, async (c) => {
  try {
    const port = Number(c.req.param("port"));

    if (port < 1 || port > 8) {
      return c.json({ message: "port harus 1 - 8" }, 400);
    }

    const oltName = getOltName(c);
    const refresh = c.req.query("refresh") === "1";

    const body = await oltFetch(oltName, "/gponont_mgmt", {
      params: { form: "res_name", port_id: port },
      refresh,
    });

    if (!body.success) {
      return c.json(
        {
          success: false,
          message: `Gagal mengambil data port (${body.status})`,
        },
        502,
      );
    }

    c.header("Cache-Control", `max-age=${CACHE_AGE}`);

    return c.json({
      success: true,
      data: body.data,
      cached: body.cached ?? false,
      fetchedAt: body.fetchedAt ?? Date.now(),
    });
  } catch (err) {
    console.error("[olt] GET /port/:port gagal:", err);
    return c.json(
      { success: false, message: err instanceof Error ? err.message : "Gagal" },
      500,
    );
  }
});

// ------------------------------------------------------------
// GET /daftar → daftar OLT terdaftar
// ------------------------------------------------------------
olt.get("/daftar", async (c) => {
  return c.json({
    success: true,
    data: Object.entries(OLT_LIST).map(([key, cfg]) => ({
      key,
      baseUrl: cfg.baseUrl,
    })),
  });
});

// ------------------------------------------------------------
// GET /debug → diagnostik
// ------------------------------------------------------------
olt.get("/debug", oltAuth, async (c) => {
  return c.json({
    success: true,
    oltName: c.get("oltName"),
    baseUrl: c.get("baseUrl"),
    terdaftar: Object.keys(OLT_LIST),
  });
});

export default olt;
