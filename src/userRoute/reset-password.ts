// ============================================================
// RESET PASSWORD USER — pakai Argon2id (sesuai lib/password.ts)
//
// Jalankan dari folder backend:
//   bun run reset-password.ts
//
// Ganti USERNAME & NEW_PASSWORD sesuai kebutuhan.
// (Tulis ulang nilai di bawah ini sebelum menjalankan!)
// ============================================================

import { hashPassword } from "../../lib/password";
import { prisma } from "../../lib/prisma";

const USERNAME = "evil"; // ← ganti username yang mau di-reset
const NEW_PASSWORD = "evi1103"; // ← ganti password baru

async function main() {
  // 1. Cek user & hash lama
  const user = await prisma.user.findUnique({
    where: { username: USERNAME },
    include: { password: { select: { hash: true } } },
  });

  if (!user) {
    console.error(`User "${USERNAME}" tidak ditemukan.`);
    return;
  }

  const oldHash = user.password?.hash ?? "";
  console.log("Panjang hash lama:", oldHash.length);
  console.log("Prefix hash lama:", oldHash.slice(0, 10));
  console.log(
    oldHash.startsWith("$2a$") || oldHash.startsWith("$2b$")
      ? "→ hash BCRYPT (inilah yang bikin login gagal dengan Argon2)"
      : "→ hash bukan bcrypt (kemungkinan sudah Argon2)",
  );

  // 2. Buat hash Argon2id baru
  const newHash = await hashPassword(NEW_PASSWORD);
  console.log(
    "Panjang hash baru:",
    newHash.length,
    "| prefix:",
    newHash.slice(0, 10),
  );

  // 3. Simpan (upsert relasi password)
  await prisma.user.update({
    where: { id: user.id },
    data: {
      password: {
        upsert: {
          create: { hash: newHash },
          update: { hash: newHash },
        },
      },
    },
  });

  console.log(`✅ Password "${USERNAME}" berhasil di-reset ke Argon2id.`);
  console.log(`   Silakan login dengan password baru.`);
}

main()
  .catch((err) => {
    console.error("Gagal reset password:", err);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
