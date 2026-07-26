import { zValidator } from "@hono/zod-validator";
import { Hono } from "hono";
import z from "zod";
import { prisma } from "../../lib/prisma";
import { verifyPassword } from "../../lib/password";
import { createToken } from "../../lib/jwt";
import { deleteCookie, setCookie } from "hono/cookie";
import { checkUserToken } from "../midleware/cekUserToken";

export type Variables = {
  user: {
    id: string;
  };
};

export const app = new Hono<{
  Variables: Variables;
}>();

//auth/gilno;
app.post(
  "/login",
  zValidator(
    "json",
    z.object({
      username: z.string(),
      password: z.string(),
    }),
  ),
  async (c) => {
    const body = c.req.valid("json");

    const foundUser = await prisma.user.findUnique({
      where: { username: body.username },
      include: { password: { select: { hash: true } } },
    });

    if (!foundUser) {
      c.status(404);
      return c.json({ message: "Cannot login because user not found" });
    }

    if (!foundUser?.password?.hash) {
      c.status(400);
      return c.json({
        message: "Cannot login because user doesn't have a password",
      });
    }

    const validPassword = await verifyPassword(
      foundUser.password.hash,
      body.password,
    );

    if (!validPassword) {
      c.status(400);
      return c.json({
        message: "Password incorrect",
      });
    }

    const token = await createToken(foundUser.id);

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
      maxAge: 60 * 60,
    });
    console.log("JWT:", token);

    return c.json({
      success: true,
      message: "Login successful",
      user: {
        id: foundUser.id,
        username: foundUser.username,
        fullname: foundUser.fullname,
        level: foundUser.level,
      },
    });
  },
);

app.get("/me", checkUserToken(), async (c) => {
  const user = c.get("user");

  const data = await prisma.user.findUnique({
    where: {
      id: user.id,
    },
    select: {
      id: true,
      username: true,
      fullname: true,
      level: true,
    },
  });

  if (!data) {
    return c.json(
      {
        message: "User not found",
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
