// ============================================================
// midleware/oltAuth.ts — versi DIAGNOSTIK + TANGGUH
// (sesuai struktur proyekmu: client di ./oltLogin)
//
// Perbaikan:
//   - PASTI set c.set("oltName", olt) → route yang memakai
//     c.get("oltName") tidak dapat undefined.
//   - Log nilai param (buat debug).
//   - Fallback nama param: olt → nama → key.
//   - Error menampilkan daftar OLT terdaftar.
// ============================================================

import type { Context, Next } from "hono";
import { OLT_LIST, getOltToken } from "../midleware/oltLogin"; // ⭐ import dari folder yang sama

export const oltAuth = async (c: Context, next: Next) => {
  // Coba beberapa nama param (mengantisipasi mount yang beda)
  const oltRaw =
    c.req.param("olt") ?? c.req.param("nama") ?? c.req.param("key");

  // ⭐ LOG DIAGNOSTIK — cek di console backend
  console.log(
    "[oltAuth] param olt:",
    JSON.stringify(oltRaw),
    "| path:",
    c.req.path,
  );

  const olt = String(oltRaw ?? "").toLowerCase();

  if (!olt) {
    return c.json({ message: "Parameter OLT tidak ditemukan" }, 400);
  }

  const config = OLT_LIST[olt] ?? OLT_LIST[String(oltRaw)];

  if (!config) {
    return c.json(
      {
        message: `OLT "${olt}" tidak ditemukan. Terdaftar: ${Object.keys(OLT_LIST).join(", ")}`,
      },
      404,
    );
  }

  try {
    const token = await getOltToken(olt);

    c.set("xToken", token);
    c.set("baseUrl", config.baseUrl);
    c.set("oltName", olt); // ⭐ WAJIB — route memakai ini

    await next();
  } catch (err) {
    console.error(`[oltAuth] Login OLT ${olt} gagal:`, err);

    return c.json(
      {
        message: err instanceof Error ? err.message : "Login OLT gagal",
      },
      500,
    );
  }
};
