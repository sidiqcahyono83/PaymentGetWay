import { createMiddleware } from "hono/factory";
import { getCookie } from "hono/cookie";
import type { Variables } from "../type/hono";
import { validateToken } from "../../lib/jwt";

export const checkUserToken = () => {
  return createMiddleware<{
    Variables: Variables;
  }>(async (c, next) => {
    // 1. Ambil token dari cookie
    const token = getCookie(c, "token");

    if (!token) {
      return c.json({ message: "Unauthorized" }, 401);
    }

    // 2. Validasi token
    const payload = await validateToken(token);

    // oslo decodedToken → { subject, issuedAt, expiresAt }
    if (!payload?.subject) {
      return c.json({ message: "Invalid Token" }, 401);
    }

    // 3. ⭐ SET user dengan { id: subject } — INI YANG MEMPERBAIKI
    //    error "where: { id: undefined }" di /auth/me
    c.set("user", {
      id: payload.subject,
    });

    await next();
  });
};
