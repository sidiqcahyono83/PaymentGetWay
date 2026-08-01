import "dotenv/config";
import type { CookieOptions } from "hono/utils/cookie";

export function ensureEnvVars() {
  const required = [
    "TOKEN_SECRET",
    "DATABASE_HOST",
    "DATABASE_USER",
    "DATABASE_PASSWORD",
    "DATABASE_NAME",
  ];

  const missing = required.filter((k) => !process.env[k]);
  if (missing.length > 0) {
    console.error(
      `Missing required environment variables: ${missing.join(", ")}`,
    );
    throw new Error("Missing required environment variables");
  }
}

export const isProduction = process.env.NODE_ENV === "production";

/**
 * Mengembalikan CookieOptions yang kompatibel dengan hono.
 * overrides bertipe Partial<CookieOptions> sehingga aman untuk merging.
 */
export const cookieOptions = (
  overrides: Partial<CookieOptions> = {},
): CookieOptions => {
  return {
    httpOnly: true,
    secure: false,
    sameSite: "strict",
    path: "/",
    maxAge: 60 * 60 * 24,
    ...overrides,
  };
};
