import type { Context, Next } from "hono";

interface OltConfig {
  baseUrl: string;
}

const OLT_LIST: Record<string, OltConfig> = {
  sruweng: {
    baseUrl: "http://103.63.26.87:1288",
  },
  manggal: {
    baseUrl: "http://103.63.26.87:1432",
  },
  pagutan: {
    baseUrl: "http://103.63.26.87:1285",
  },
  jonggol: {
    baseUrl: "http://103.63.26.87:1286",
  },
  sruweng2: {
    baseUrl: "http://103.63.26.87:1297",
  },
};

interface TokenCache {
  token: string;
  loginAt: number;
}

const tokenCache: Record<string, TokenCache> = {};

interface OltLoginResponse {
  code: number;
  message?: string;
}

async function loginOlt(baseUrl: string): Promise<string> {
  const res = await fetch(`${baseUrl}/userlogin?form=login`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      method: "set",
      param: {
        name: "root",
        key: "c9edb08bb57ba89f868f7125e8012294",
        value: "a2VmaWxhNzgqKg==",
        captcha_v: "",
        captcha_f: "",
      },
    }),
  });

  if (!res.ok) {
    throw new Error(`Login gagal (${res.status})`);
  }

  const contentType = res.headers.get("content-type") ?? "";

  if (!contentType.includes("application/json")) {
    const text = await res.text();
    throw new Error(`Response login bukan JSON: ${text}`);
  }

  const data = (await res.json()) as OltLoginResponse;

  if (data.code !== 1) {
    throw new Error(data.message ?? "Login OLT gagal");
  }

  const token = res.headers.get("x-token");

  if (!token) {
    throw new Error("Header x-token tidak ditemukan");
  }

  return token;
}

export const oltAuth = async (c: Context, next: Next) => {
  const olt = c.req.param("olt");

  if (!olt) {
    return c.json({ message: "Parameter OLT tidak ditemukan" }, 400);
  }

  const config = OLT_LIST[olt];

  if (!config) {
    return c.json({ message: "OLT tidak ditemukan" }, 404);
  }

  const now = Date.now();

  // Login ulang setiap 30 menit
  if (!tokenCache[olt] || now - tokenCache[olt].loginAt > 30 * 60 * 1000) {
    try {
      // console.log(`Login ke OLT ${olt}`);

      const token = await loginOlt(config.baseUrl);

      tokenCache[olt] = {
        token,
        loginAt: now,
      };

      // console.log(`Login ${olt} berhasil`);
    } catch (err) {
      console.error(err);

      return c.json(
        {
          message: err instanceof Error ? err.message : "Login OLT gagal",
        },
        500,
      );
    }
  }

  c.set("xToken", tokenCache[olt].token);
  c.set("baseUrl", config.baseUrl);

  await next();
};
