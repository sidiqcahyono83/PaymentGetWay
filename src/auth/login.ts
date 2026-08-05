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
  zValidator("json", z.object({ username: z.string(), password: z.string() })),
  async (c) => {
    try {
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

      return c.json({
        message: "Login successful",
        token,
        user: {
          id: foundUser.id,
          username: foundUser.username,
          fullname: foundUser.fullname, // ← tambahkan, frontend kamu butuh ini
          level: foundUser.level,
        },
      });
    } catch (err) {
      console.error("[auth/login] error:", err);
      return c.json(
        {
          message: "Terjadi kesalahan pada server.",
          // SEMENTARA: tampilkan detail biar gampang debug —
          // hapus baris ini setelah ketemu penyebabnya.
          error: err instanceof Error ? err.message : String(err),
        },
        500,
      );
    }
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
