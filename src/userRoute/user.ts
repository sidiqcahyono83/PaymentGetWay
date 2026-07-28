import { Hono } from "hono";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { prisma } from "../../lib/prisma";

const app = new Hono();

// LOGIN //

import { createToken } from "../../lib/jwt";
import { hashPassword, verifyPassword } from "../../lib/password";
import { checkUserToken } from "../midleware/cekUserToken";
import bcrypt from "bcryptjs";

//auth/login
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

    try {
      const token = await createToken(foundUser.id);

      return c.json({
        message: "Login successful",
        token,
        user: {
          username: foundUser.username,
          level: foundUser.level,
        },
      });
    } catch (err) {
      console.error(err);

      return c.json(
        {
          message: "Token failed to create",
          error: String(err),
        },
        500,
      );
    }
  },
);

app.get("/", async (c) => {
  try {
    const users = await prisma.user.findMany({
      select: {
        id: true,
        username: true,
        fullname: true,
        address: true,
        phoneNumber: true,
        level: true,
        _count: {
          select: {
            areas: true,
          },
        },
      },
    });
    return c.json({ users });
  } catch (error) {
    console.error(error);
    return c.json({ message: "Failed to fetch users." }, 500);
  }
});

const registerSchema = z.object({
  username: z.string().min(4),
  password: z.string().min(4),
  fullname: z.string().min(4),
});

app.post("/register", zValidator("json", registerSchema), async (c) => {
  const body = c.req.valid("json");

  try {
    const newUser = await prisma.user.create({
      data: {
        username: body.username,
        fullname: body.fullname,

        password: {
          create: {
            hash: await hashPassword(body.password),
          },
        },
      },
    });
    console.log(newUser);
    return c.json(
      {
        message: "Register new user successful",
        user: {
          username: newUser.username,
          fullname: newUser.fullname,
        },
      },
      201,
    );
  } catch (error: unknown) {
    console.error(error);

    return c.json(
      {
        message: "Cannot register user.",
      },
      400,
    );
  }
});

const updateUserSchema = z.object({
  username: z.string().min(4).optional(),
  password: z.string().min(4).optional(),
  fullname: z.string().min(4).optional(),
  address: z.string().optional(),
  phoneNumber: z.string().optional(),
  level: z.string().optional(),
});

app.patch("/:id", checkUserToken(), async (c) => {
  const userId = c.req.param("id");
  // Terima areaIds dalam bentuk Array (misal: string[])
  const { password, areaIds } = await c.req.json();

  if (!password && (!areaIds || areaIds.length === 0)) {
    return c.json(
      { message: "Sediakan password atau areaIds yang valid." },
      400,
    );
  }

  try {
    const updateData: any = {};

    if (password) {
      const hashedPassword = await bcrypt.hash(password, 10);
      updateData.password = {
        upsert: {
          create: { hash: hashedPassword },
          update: { hash: hashedPassword },
        },
      };
    }

    // Jika mengirim banyak areaId (Array)
    if (areaIds && Array.isArray(areaIds) && areaIds.length > 0) {
      updateData.areas = {
        // Map setiap string ID menjadi objek { id: "..." }
        connect: areaIds.map((id: string) => ({ id })),
      };
    }

    const updatedUser = await prisma.user.update({
      where: { id: userId },
      data: updateData,
      select: {
        id: true,
        username: true,
        fullname: true,
        level: true,
        areas: {
          select: {
            id: true,
            name: true,
          },
        },
        updatedAt: true,
      },
    });

    return c.json({
      message: "Data user berhasil diperbarui.",
      data: updatedUser,
    });
  } catch (error) {
    console.error("Error updating user:", error);
    return c.json({ message: "Gagal memperbarui user." }, 500);
  }
});

app.post("/", checkUserToken(), async (c) => {
  const { username, fullname, password, level, areaIds, address, phoneNumber } =
    await c.req.json();

  // 1. Validasi input wajib
  if (!username || !fullname || !password) {
    return c.json(
      { message: "Username, fullname, dan password wajib diisi." },
      400,
    );
  }

  try {
    // 2. Cek apakah username sudah digunakan
    const existingUser = await prisma.user.findUnique({
      where: { username },
    });

    if (existingUser) {
      return c.json({ message: "Username sudah digunakan." }, 400);
    }

    // 3. Hash password
    const hashedPassword = await bcrypt.hash(password, 10);

    // 4. Siapkan relasi area jika areaIds dikirim dalam bentuk array
    const areasConnect =
      Array.isArray(areaIds) && areaIds.length > 0
        ? { connect: areaIds.map((id: string) => ({ id })) }
        : undefined;

    // 5. Buat User baru beserta relasi Password & Areas
    const newUser = await prisma.user.create({
      data: {
        username,
        fullname,
        address,
        phoneNumber,
        level: level || "ADMIN", // Default level jika tidak dikirim
        password: {
          create: {
            hash: hashedPassword,
          },
        },
        areas: areasConnect, // Menghubungkan ke banyak areaId sekaligus
      },
      select: {
        id: true,
        username: true,
        fullname: true,
        level: true,
        address: true,
        phoneNumber: true,
        areas: {
          select: {
            id: true,
            name: true, // Sesuaikan dengan field nama area di schema Anda
          },
        },
        createdAt: true,
      },
    });

    return c.json(
      {
        message: "User berhasil dibuat.",
        data: newUser,
      },
      201,
    );
  } catch (error) {
    console.error("Error creating user:", error);
    return c.json({ message: "Gagal membuat user." }, 500);
  }
});

export default app;
