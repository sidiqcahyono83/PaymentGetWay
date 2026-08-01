import { zValidator } from "@hono/zod-validator";
import { Hono } from "hono";
import z from "zod";
import { prisma } from "../../lib/prisma";
import { verifyPassword } from "../../lib/password";
import { createToken } from "../../lib/jwt";
import { deleteCookie, setCookie } from "hono/cookie";
import { checkUserToken } from "../midleware/cekUserToken";
import { cookieOptions } from "../../lib/env";

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
    (result, c) => {
      // Custom handler agar pesan ZodError dikirim rapi ke Frontend
      if (!result.success) {
        return c.json(
          {
            success: false,
            message: "Format input tidak valid",
            error: result.error,
          },
          400,
        );
      }
    },
  ),
  async (c) => {
    const body = c.req.valid("json");

    const foundUser = await prisma.user.findUnique({
      where: { username: body.username },
      include: { password: { select: { hash: true } } },
    });

    if (!foundUser) {
      return c.json({ message: "Cannot login because user not found" }, 404);
    }

    if (!foundUser?.password?.hash) {
      return c.json(
        { message: "Cannot login because user doesn't have a password" },
        400,
      );
    }

    const validPassword = await verifyPassword(
      foundUser.password.hash,
      body.password,
    );

    if (!validPassword) {
      return c.json({ message: "Password incorrect" }, 400);
    }

    const token = await createToken(foundUser.id);

    if (!token) {
      return c.json({ message: "Token failed to create" }, 500);
    }

    // Set Cookie dengan konfigurasi aman
    setCookie(c, "token", token, cookieOptions());

    // setCookie(
    //   c,
    //   "token",
    //   token,
    //   cookieOptions({
    //     httpOnly: true,
    //     secure: false,
    //     sameSite: "strict",
    //     path: "/",
    //     maxAge: 60 * 60 * 24,
    //   }),
    // );

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
    return c.json({ message: "User not found" }, 404);
  }

  return c.json(data);
});

app.post("/logout", (c) => {
  // Opsi deleteCookie harus persis sama opsi path & sameSite saat setCookie
  deleteCookie(c, "token", {
    path: "/",
    secure: process.env.NODE_ENV === "production",
    sameSite: process.env.NODE_ENV === "production" ? "None" : "Lax",
  });

  return c.json({
    message: "Logout berhasil",
  });
});

export default app;
