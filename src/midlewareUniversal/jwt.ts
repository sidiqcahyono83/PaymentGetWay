import { getCookie } from "hono/cookie";

export function getToken(c: any) {
  // Prioritas cookie
  let token = getCookie(c, "token");

  // Jika tidak ada, cek Authorization Header
  if (!token) {
    const auth = c.req.header("Authorization");

    if (auth?.startsWith("Bearer ")) {
      token = auth.substring(7);
    }
  }

  return token;
}
