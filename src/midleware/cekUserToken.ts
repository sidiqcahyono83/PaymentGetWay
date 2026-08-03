import { createMiddleware } from "hono/factory";
import { getCookie } from "hono/cookie";
import type { Variables } from "../type/hono";
import { validateToken } from "../../lib/jwt";

export const checkUserToken = () => {
  return createMiddleware<{
    Variables: Variables;
  }>(async (c, next) => {
    // console.log("CUSTOMER ROUTE");
    // console.log("Cookie Header:", c.req.header("cookie"));
    const token = getCookie(c, "token");
    // console.log("Token:", token);
    if (!token) {
      return c.json(
        {
          message: "Unauthorized",
        },
        401,
      );
    }

    const payload = await validateToken(token);
    // console.log("Payload:", payload);
    if (!payload?.subject) {
      return c.json(
        {
          message: "Invalid Token",
        },
        401,
      );
    }

    c.set("user", {
      id: payload.subject,
    });

    await next();
    // console.log("Origin:", c.req.header("origin"));
    // console.log("Host:", c.req.header("host"));
    // console.log("Cookie:", c.req.header("cookie"));
  });
};
