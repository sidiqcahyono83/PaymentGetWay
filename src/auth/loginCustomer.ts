import { zValidator } from "@hono/zod-validator";
import { Hono } from "hono";
import z from "zod";
import { prisma } from "../../lib/prisma";
import { verifyPassword } from "../../lib/password";
import { createToken } from "../../lib/jwt";
import { deleteCookie, setCookie } from "hono/cookie";
import { checkUserToken } from "../midleware/cekUserToken";
import { checkCustomerToken } from "../midleware/checkCustomerToken";

export type Variables = {
  customer: {
    id: string;
  };
};

export const app = new Hono<{
  Variables: Variables;
}>();

//auth/gilno;
app.post(
  "/",
  zValidator(
    "json",
    z.object({
      username: z.string(),
      password: z.string(),
    }),
  ),
  async (c) => {
    const body = c.req.valid("json");

    const foundCus = await prisma.customer.findUnique({
      where: { username: body.username },
      include: {
        password: { select: { hash: true } },
        paket: true,
        area: true,
      },
    });

    if (!foundCus) {
      c.status(404);
      return c.json({ message: "Cannot login because customer not found" });
    }

    if (!foundCus?.password?.hash) {
      c.status(400);
      return c.json({
        message: "Cannot login because customer doesn't have a password",
      });
    }

    const validPassword = await verifyPassword(
      foundCus.password.hash,
      body.password,
    );

    if (!validPassword) {
      c.status(400);
      return c.json({
        message: "Password incorrect",
      });
    }

    const token = await createToken(foundCus.id);

    if (!token) {
      return c.json(
        {
          message: "Token failed to create",
        },
        500,
      );
    }

    setCookie(c, "token", token, {
      httpOnly: true,
      secure: false,
      sameSite: "lax",
      path: "/",
      maxAge: 60 * 60 * 2,
    });
    // console.log("Token:", token);

    return c.json({
      success: true,
      message: "Login successful",
      customer: {
        id: foundCus.id,
        username: foundCus.username,
        fullname: foundCus.fullname,
        area: foundCus.area?.name,
        paketName: foundCus.paket?.name,
        harga: foundCus.paket?.harga,
        status: foundCus.status,
      },
    });
  },
);

app.get("/me", checkCustomerToken(), async (c) => {
  const customer = c.get("customer");

  const data = await prisma.customer.findUnique({
    where: {
      id: customer.id,
    },
    select: {
      id: true,
      username: true,
      fullname: true,
      status: true,
    },
  });

  if (!data) {
    return c.json(
      {
        message: "Customer not found",
      },
      404,
    );
  }

  return c.json(data);
});

app.post("/logout", (c) => {
  deleteCookie(c, "token", {
    path: "/",
  });

  return c.json({
    message: "Logout berhasil",
  });
});

export default app;
