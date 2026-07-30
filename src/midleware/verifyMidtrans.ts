// src/midleware/verifyMidtrans.ts
import crypto from "crypto";

/**
 * Middleware untuk memverifikasi signature Midtrans.
 * Menggunakan rumus Snap/Core bila tersedia:
 *   signature_key = sha512(order_id + status_code + gross_amount + serverKey)
 * Jika payload tidak menyediakan order_id/status_code/gross_amount, fallback ke:
 *   HMAC-SHA512(rawBody, serverKey)
 *
 * Menyimpan payload ter-parse di context: c.set("midtransPayload", payload)
 */
export function verifyMidtransSignature() {
  return async (c: any, next: any) => {
    const serverKey = process.env.MIDTRANS_SERVER_KEY;
    if (!serverKey) {
      console.error("MIDTRANS_SERVER_KEY not configured");
      return c.json({ message: "Server configuration error" }, 500);
    }

    // Ambil raw body (text) karena signature biasanya dihitung atas raw payload
    const raw = await c.req.text();

    let payload: any;
    try {
      payload = JSON.parse(raw);
    } catch (err) {
      console.warn("Invalid JSON payload for signature verification", err);
      return c.json({ message: "Invalid JSON payload" }, 400);
    }

    // Midtrans Snap/Core sering menyertakan signature_key dalam payload
    const receivedSig =
      (payload.signature_key as string) ||
      (payload.signatureKey as string) ||
      c.req.header("x-midtrans-signature") ||
      c.req.header("x-signature") ||
      "";

    // Pakai rumus Snap/Core bila order_id, status_code, gross_amount tersedia
    const orderId = payload.order_id ?? payload.orderId ?? "";
    const statusCode = (payload.status_code ?? payload.statusCode ?? "") + "";
    const grossAmount =
      (payload.gross_amount ?? payload.grossAmount ?? "") + "";

    let expected = "";
    if (orderId && statusCode && grossAmount) {
      expected = crypto
        .createHash("sha512")
        .update(orderId + statusCode + grossAmount + serverKey)
        .digest("hex");
    } else {
      // Fallback: HMAC-SHA512 over raw body
      expected = crypto
        .createHmac("sha512", serverKey)
        .update(raw)
        .digest("hex");
    }

    if (!receivedSig || expected !== receivedSig) {
      console.warn("Midtrans signature mismatch", { expected, receivedSig });
      return c.json({ message: "Invalid signature" }, 401);
    }

    // Simpan payload & raw untuk handler berikutnya
    c.set("rawBody", raw);
    c.set("midtransPayload", payload);

    await next();
  };
}
