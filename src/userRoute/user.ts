import { Hono } from "hono";
import { z } from "zod";
import { zValidator } from "@hono/zod-validator";
import { prisma } from "../../lib/prisma";
const app = new Hono();

// LOGIN //


import { createToken } from "../../lib/jwt";
import { hashPassword, verifyPassword } from "../../lib/password";

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

app.post("/", zValidator("json", registerSchema), async (c) => {
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

// app.patch("/:id", zValidator("json", updateUserSchema), async (c) => {
//   const id = c.req.param("id");
//   const body = c.req.valid("json");

//   try {
//     // cek user
//     const user = await prisma.user.findUnique({
//       where: {
//         id,
//       },
//       include: {
//         password: true,
//       },
//     });

//     if (!user) {
//       return c.json(
//         {
//           message: "User tidak ditemukan",
//         },
//         404,
//       );
//     }

//     const data = {
//       ...(body.username !== undefined && { username: body.username }),
//       ...(body.fullname !== undefined && { fullname: body.fullname }),
//       ...(body.address !== undefined && { address: body.address }),
//       ...(body.phoneNumber !== undefined && {
//         phoneNumber: body.phoneNumber,
//       }),
//       ...(body.level !== undefined && { level: body.level }),
//     };

//     if (body.password) {
//       Object.assign(data, {
//         password: user.password
//           ? {
//               update: {
//                 hash: await hashPassword(body.password),
//               },
//             }
//           : {
//               create: {
//                 hash: await hashPassword(body.password),
//               },
//             },
//       });
//     }

//     const updatedUser = await prisma.user.update({
//       where: { id },
//       data,
//     });

//     return c.json({
//       message: "User berhasil diperbarui",
//       user: {
//         id: updatedUser.id,
//         username: updatedUser.username,
//         fullname: updatedUser.fullname,
//         address: updatedUser.address,
//         phoneNumber: updatedUser.phoneNumber,
//         level: updatedUser.level,
//       },
//     });
//   } catch (error) {
//     console.error(error);

//     return c.json(
//       {
//         message: "Gagal mengubah data user",
//       },
//       500,
//     );
//   }
// });

export default app;
