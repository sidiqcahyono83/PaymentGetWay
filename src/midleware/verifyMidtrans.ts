// src/midleware/verifyMidtrans.ts
import { Hono } from "hono";
import crypto from "crypto";

/**
 * Middleware generic untuk memverifikasi signature dari payment gateway.
 * NOTE: ganti logika computeSignature(...) sesuai dokumen Midtrans / provider Anda.
 */
export function verifyMidtransSignature() {
  return async (c: any, next: any) => {
    const serverKey = process.env.MIDTRANS_SERVER_KEY;
    if (!serverKey) {
      console.error("MIDTRANS_SERVER_KEY not set");
      return c.json({ message: "Server configuration error" }, 500);
    }

    // Ambil raw body sebagai text (penting untuk perhitungan signature)
    const raw = await c.req.text();

    // Ambil signature dari header (sesuaikan nama header provider)
    const receivedSig =
      c.req.header("x-midtrans-signature") || c.req.header("x-signature") || "";

    // Contoh compute: HMAC-SHA512 over raw body using serverKey
    const computed = crypto
      .createHmac("sha512", serverKey)
      .update(raw)
      .digest("hex");

    if (!receivedSig || computed !== receivedSig) {
      console.warn("Invalid midtrans signature", { computed, receivedSig });
      return c.json({ message: "Invalid signature" }, 401);
    }

    // Jika valid, lanjutkan; simpan raw body ke context jika handler perlu
    c.set("rawBody", raw);
    return next();
  };
}
