// ============================================================
// midleware/oltLogin.ts — CLIENT OLT (nama file sesuai proyekmu)
//
// KOREKSI "OLT tidak ditemukan" di oltFetch:
//   Penyebab: nilai yang diteruskan ke oltFetch bukan key yang
//   ada di OLT_LIST (biasanya `undefined` karena middleware tidak
//   set `oltName`, atau malah baseUrl yang dikirim).
//
// Fix:
//   1. oltFetch menerima NAMA OLT ATAU baseUrl — resolve otomatis.
//   2. Kalau undefined → error dengan pesan jelas (bukan asumsi).
//   3. Tetap: timeout, single-flight login, auto re-login 401,
//      cache respons TTL.
// ============================================================

export interface OltConfig {
  baseUrl: string;
}

export const OLT_LIST: Record<string, OltConfig> = {
  sruweng: { baseUrl: "http://103.63.26.87:1288" },
  manggal: { baseUrl: "http://103.63.26.87:1432" },
  pagutan: { baseUrl: "http://103.63.26.87:1285" },
  jonggol: { baseUrl: "http://103.63.26.87:1286" },
  sruweng2: { baseUrl: "http://103.63.26.87:1297" },
};

// ---------- Konfigurasi ----------
const TOKEN_TTL_MS = 30 * 60 * 1000;
const FETCH_TIMEOUT_MS = 10_000;
const CACHE_TTL_MS = Number(process.env.OLT_CACHE_TTL_MS ?? 15_000);

// ---------- Cache token (single-flight) ----------
interface TokenCacheEntry {
  token: string;
  loginAt: number;
  inflight: Promise<string> | null;
}

const tokenCache: Record<string, TokenCacheEntry> = {};

// ---------- Cache respons ----------
interface CacheEntry {
  body: any;
  fetchedAt: number;
}

const responseCache = new Map<string, CacheEntry>();

// ---------- RESOLVE OLT: terima nama ATAU baseUrl ----------
export function resolveOlt(oltOrUrl: string | undefined | null): string {
  if (!oltOrUrl) {
    throw new Error(
      "Nama OLT kosong (undefined). Pastikan middleware set c.set('oltName', ...) — cek oltAuth.ts.",
    );
  }

  const key = String(oltOrUrl).toLowerCase();

  // Langsung ketemu sebagai key
  if (OLT_LIST[key]) return key;

  // Mungkin yang dikirim adalah baseUrl → cocokkan dengan nilai
  for (const [k, cfg] of Object.entries(OLT_LIST)) {
    if (cfg.baseUrl === oltOrUrl) return k;
  }

  throw new Error(
    `OLT "${oltOrUrl}" tidak ditemukan. Terdaftar: ${Object.keys(OLT_LIST).join(", ")}`,
  );
}

// ---------- fetch dengan timeout ----------
async function fetchWithTimeout(
  url: string,
  init: RequestInit = {},
  timeoutMs: number = FETCH_TIMEOUT_MS,
): Promise<Response> {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);

  try {
    return await fetch(url, { ...init, signal: controller.signal });
  } finally {
    clearTimeout(timer);
  }
}

// ---------- Login OLT ----------
interface OltLoginResponse {
  code: number;
  message?: string;
}

async function loginOlt(baseUrl: string): Promise<string> {
  const res = await fetchWithTimeout(`${baseUrl}/userlogin?form=login`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
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

// ---------- Ambil token (cached / single-flight / force) ----------
export async function getOltToken(olt: string, force = false): Promise<string> {
  const cfg = OLT_LIST[olt];

  if (!cfg) {
    throw new Error(`OLT "${olt}" tidak ditemukan di OLT_LIST`);
  }

  const entry = tokenCache[olt];
  const stillValid =
    entry && !force && Date.now() - entry.loginAt < TOKEN_TTL_MS && entry.token;

  if (stillValid) {
    return entry.token;
  }

  if (entry?.inflight) {
    return entry.inflight;
  }

  const inflight = loginOlt(cfg.baseUrl)
    .then((token) => {
      tokenCache[olt] = { token, loginAt: Date.now(), inflight: null };
      return token;
    })
    .catch((err) => {
      if (tokenCache[olt]) tokenCache[olt].inflight = null;
      throw err;
    });

  tokenCache[olt] = {
    token: entry?.token ?? "",
    loginAt: entry?.loginAt ?? 0,
    inflight,
  };

  return inflight;
}

// ---------- Fetch API OLT (auto re-login 401 + cache respons) ----------
export interface OltFetchOptions {
  params?: Record<string, string | number>;
  refresh?: boolean;
  timeoutMs?: number;
}

export async function oltFetch(
  oltOrUrl: string | undefined,
  path: string,
  opts: OltFetchOptions = {},
) {
  // ⭐ RESOLVE dulu — terima nama ATAU baseUrl, error jelas kalau kosong
  const olt = resolveOlt(oltOrUrl);

  // Guard: TS (noUncheckedIndexedAccess) menganggap OLT_LIST[olt] bisa undefined
  const cfg = OLT_LIST[olt];

  if (!cfg) {
    throw new Error(`OLT "${olt}" tidak ditemukan di OLT_LIST`);
  }

  const url = new URL(path, cfg.baseUrl);
  for (const [k, v] of Object.entries(opts.params ?? {})) {
    url.searchParams.set(k, String(v));
  }

  const cacheKey = `${olt}:${url.toString()}`;
  const now = Date.now();

  if (!opts.refresh) {
    const hit = responseCache.get(cacheKey);

    if (hit && now - hit.fetchedAt < CACHE_TTL_MS) {
      return { ...hit.body, cached: true };
    }
  }

  const doFetch = (token: string) =>
    fetchWithTimeout(
      url.toString(),
      {
        headers: { "x-token": token },
      },
      opts.timeoutMs,
    );

  let res = await doFetch(await getOltToken(olt));

  if (res.status === 401 || res.status === 403) {
    const freshToken = await getOltToken(olt, true);
    res = await doFetch(freshToken);
  }

  const raw = await res.text();
  let parsed: any = raw;

  try {
    parsed = JSON.parse(raw);
  } catch {
    // body bukan JSON
  }

  const body = {
    success: res.ok,
    status: res.status,
    raw,
    data: parsed,
    cached: false,
    fetchedAt: Date.now(),
  };

  if (res.ok) {
    responseCache.set(cacheKey, { body, fetchedAt: body.fetchedAt });
  }

  return body;
}

/** Hapus cache respons OLT */
export function clearOltCache(olt?: string) {
  if (olt) {
    for (const key of responseCache.keys()) {
      if (key.startsWith(`${olt}:`)) responseCache.delete(key);
    }
  } else {
    responseCache.clear();
  }
}
