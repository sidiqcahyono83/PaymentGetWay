import { createMiddleware } from "hono/factory";
import { getCookie } from "hono/cookie";
import type { VariablesCustomer } from "../type/hono";
import { validateTokenCustomer } from "../../lib/jwtCustomer";

export const checkCustomerToken = () => {
  return createMiddleware<{
    Variables: VariablesCustomer;
  }>(async (c, next) => {
    // console.log("CUSTOMER ROUTE");
    // console.log("Cookie Header:", c.req.header("cookie"));
    const token = getCookie(c, "token");
    console.log("Token2:", token);
    if (!token) {
      return c.json(
        {
          message: "Unauthorized",
        },
        401,
      );
    }

    const payload = await validateTokenCustomer(token);
    console.log("Payload:", payload);
    if (!payload?.subject) {
      return c.json(
        {
          message: "Invalid Token",
        },
        401,
      );
    }

    c.set("customer", {
      id: payload.subject,
    });

    await next();
    console.log("Origin:", c.req.header("origin"));
    console.log("Host:", c.req.header("host"));
    console.log("Cookie:", c.req.header("cookie"));
  });
};
