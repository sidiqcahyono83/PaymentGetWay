import { Hono } from "hono";
import { minLength, z } from "zod";
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
    })
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
      body.password
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
        500
      );
    }
  }
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
        areas: true,
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
  phoneNumber: z.string().min(11),
  address: z.string().min(6),
  areas: z.array(z.string()).optional(),
});

app.post(
  "/register",
  checkUserToken(),
  zValidator("json", registerSchema),
  async (c) => {
    const body = c.req.valid("json");

    try {
      const newUser = await prisma.user.create({
        data: {
          username: body.username,
          fullname: body.fullname,
          phoneNumber: body.phoneNumber,
          address: body.address,
          password: {
            create: {
              hash: await hashPassword(body.password),
            },
          },
          // Hubungkan area jika `areaIds` dikirim dan tidak kosong
          ...(body.areas &&
            body.areas.length > 0 && {
              areas: {
                connect: body.areas.map((id) => ({ id })),
              },
            }),
        },
        // Opsional: sertakan relasi areas jika ingin ditampilkan di response
        include: {
          areas: {
            select: {
              id: true,
              name: true,
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
            phoneNumber: newUser.phoneNumber,
            address: newUser.address,
            areas: newUser.areas,
          },
        },
        201
      );
    } catch (error: unknown) {
      console.error(error);

      return c.json(
        {
          message: "Cannot register user.",
          error: error instanceof Error ? error.message : "Unknown error",
        },
        400
      );
    }
  }
);

app.patch("/:id", checkUserToken(), async (c) => {
  const userId = c.req.param("id");
  // Terima field baru: phoneNumber, address, level, beserta password & areaIds
  const { password, areaIds, phoneNumber, address, level } = await c.req.json();

  // Validasi minimal ada salah satu data yang dikirim untuk diupdate
  if (
    !password &&
    (!areaIds || areaIds.length === 0) &&
    !phoneNumber &&
    !address &&
    !level
  ) {
    return c.json(
      {
        message:
          "Sediakan minimal salah satu data yang valid untuk diperbarui (password, areaIds, phoneNumber, address, level).",
      },
      400
    );
  }

  // Validasi nilai level jika dikirim
  if (level) {
    const validLevels = ["ADMIN", "SUPER_ADMIN", "STAFF"]; // Sesuaikan kapitalisasi dengan Enum di Prisma schema Anda (misal: "admin", "staff" atau huruf besar)
    // Jika di schema menggunakan huruf kapital: "ADMIN", "STAFF"
    const upperLevel = level.toUpperCase();
    if (!validLevels.includes(upperLevel)) {
      return c.json(
        { message: "Level tidak valid. Pilih antara ADMIN atau STAFF." },
        400
      );
    }
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

    if (phoneNumber !== undefined) {
      updateData.phoneNumber = phoneNumber;
    }

    if (address !== undefined) {
      updateData.address = address;
    }

    if (level) {
      updateData.level = level.toUpperCase();
    }

    // Jika mengirim banyak areaId (Array)
    if (areaIds && Array.isArray(areaIds) && areaIds.length > 0) {
      updateData.areas = {
        // Menggunakan 'connect' untuk menambahkan area baru tanpa menghapus area lama
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
        phoneNumber: true,
        address: true,
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
      400
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
        level: level || "STAFF", // Default level jika tidak dikirim
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
            name: true,
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
      201
    );
  } catch (error) {
    console.error("Error creating user:", error);
    return c.json({ message: "Gagal membuat user." }, 500);
  }
});

export default app;
