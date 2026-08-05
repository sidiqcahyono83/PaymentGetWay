import { Hono } from "hono";

export const app = new Hono();

interface ActivePPP {
  ".id": string;
  name: string;
  service: string;
  "caller-id": string;
  address: string;
  uptime: string;
  encoding: string;
  "session-id": string;
  "limit-bytes-in": string;
  "limit-bytes-out": string;
  radius: string;
}

interface ActiveResponse {
  status: number;
  message: string;
  jumlah_active_ppp: number;
  active_ppp: ActivePPP[];
}

interface SecretPPP {
  ".id": string;
  name: string;
  profile: string;
  disabled: string;
}

interface SecretResponse {
  status: number;
  message: string;
  jumlah_active_ppp: number;
  active_ppp: SecretPPP[];
}

interface InactivePPP {
  ".id": string;
  name: string;
  profile: string;
  disabled: string;
}

interface InactiveResponse {
  jumlah_inactive_ppp: number;
  inactive_ppp: InactivePPP[];
}

interface InactiveNonDisabledPPP {
  ".id": string;
  name: string;
  profile: string;
  disabled: string;
}

interface InactiveNonDisabledResponse {
  jumlah_inactive_ppp: number;
  inactive_ppp: InactivePPP[];
}

interface disabledPPP {
  ".id": string;
  name: string;
  profile: string;
  disabled: string;
}

interface disabledResponse {
  jumlah_disabled_ppp: number;
  disabled_ppp: disabledPPP[];
}
app.get("/", async (c) => {
  const phpurlapi = process.env.PHP_API_URL;

  try {
    const activeResponse = await fetch(`${phpurlapi}/pppoe/active`);
    const secretResponse = await fetch(`${phpurlapi}/pppoe/secret`);
    const inactiveResponse = await fetch(`${phpurlapi}/pppoe/nonactive`);
    const nonActiveNonDisabledResponse = await fetch(
      `${phpurlapi}/pppoe/nonactiveNonDisable`,
    );
    const disableResponse = await fetch(`${phpurlapi}/pppoe/nonactiveDisable`);

    if (!activeResponse.ok) {
      throw new Error(`Active HTTP ${activeResponse.status}`);
    }

    if (!secretResponse.ok) {
      throw new Error(`Secret HTTP ${secretResponse.status}`);
    }

    if (!inactiveResponse.ok) {
      throw new Error(`Inactive HTTP ${inactiveResponse.status}`);
    }

    if (!nonActiveNonDisabledResponse.ok) {
      throw new Error(
        `NonActiveNonDisabled HTTP ${nonActiveNonDisabledResponse.status}`,
      );
    }

    if (!disableResponse.ok) {
      throw new Error(`Disabled HTTP ${disableResponse.status}`);
    }

    const active = (await activeResponse.json()) as ActiveResponse;
    const secret = (await secretResponse.json()) as SecretResponse;
    const inactive = (await inactiveResponse.json()) as InactiveResponse;
    const nonActiveNonDisabled =
      (await nonActiveNonDisabledResponse.json()) as InactiveNonDisabledResponse;
    const disabled = (await disableResponse.json()) as disabledResponse;

    if (active.active_ppp.length > 0) {
      // console.log("Sample :", active.active_ppp[0]);
    }
    if (secret.active_ppp.length > 0) {
      // console.log("Sample :", secret.active_ppp[0]);
    }
    if (inactive.inactive_ppp.length > 0) {
      // console.log("Sample :", inactive.inactive_ppp[0]);
    }
    if (nonActiveNonDisabled.inactive_ppp.length > 0) {
      // console.log("Sample :", nonActiveNonDisabled.inactive_ppp[0]);
    }
    if (disabled.disabled_ppp.length > 0) {
      // console.log("Sample :", disabled.disabled_ppp[0]);
    }

    return c.json({
      success: true,
      summary: {
        jumlah_active: active.jumlah_active_ppp,
        jumlah_secret: secret.jumlah_active_ppp,
        jumlah_inactive: inactive.jumlah_inactive_ppp,
        jumlah_nonactive_nondisabled: nonActiveNonDisabled.jumlah_inactive_ppp,
        jumlah_disabled: disabled.jumlah_disabled_ppp,
      },
      active: active.active_ppp,
      secret: secret.active_ppp,
      inactive: inactive.inactive_ppp,
      nonActiveNonDisabled: nonActiveNonDisabled.inactive_ppp,
      disabled: disabled.disabled_ppp,
    });
  } catch (err) {
    console.error(err);
    return c.json(
      {
        success: false,
        message: err instanceof Error ? err.message : "Internal Server Error",
      },
      500,
    );
  }
});

app.get("/dashboard", async (c) => {
  const phpurlapi = process.env.PHP_API_URL;

  if (!phpurlapi) {
    return c.json(
      {
        success: false,
        message: "PHP_API_URL belum diset",
      },
      500,
    );
  }

  const page = Number(c.req.query("page") ?? "1");
  const limit = Number(c.req.query("limit") ?? "10");
  const search = (c.req.query("search") ?? "").toLowerCase();
  const type = c.req.query("type") ?? "secret";

  function paginate<T>(data: T[], page: number, limit: number) {
    const total = data.length;
    const totalPages = Math.ceil(total / limit);
    const start = (page - 1) * limit;
    const end = start + limit;

    return {
      data: data.slice(start, end),
      pagination: {
        page,
        limit,
        total,
        totalPages,
      },
    };
  }

  try {
    const [
      activeResponse,
      secretResponse,
      inactiveResponse,
      nonActiveNonDisabledResponse,
      disableResponse,
    ] = await Promise.all([
      fetch(`${phpurlapi}/pppoe/active`),
      fetch(`${phpurlapi}/pppoe/secret`),
      fetch(`${phpurlapi}/pppoe/nonactive`),
      fetch(`${phpurlapi}/pppoe/nonactiveNonDisable`),
      fetch(`${phpurlapi}/pppoe/nonactiveDisable`),
    ]);

    if (!activeResponse.ok)
      throw new Error(`Active HTTP ${activeResponse.status}`);

    if (!secretResponse.ok)
      throw new Error(`Secret HTTP ${secretResponse.status}`);

    if (!inactiveResponse.ok)
      throw new Error(`Inactive HTTP ${inactiveResponse.status}`);

    if (!nonActiveNonDisabledResponse.ok)
      throw new Error(
        `NonActiveNonDisabled HTTP ${nonActiveNonDisabledResponse.status}`,
      );

    if (!disableResponse.ok)
      throw new Error(`Disabled HTTP ${disableResponse.status}`);

    const active = (await activeResponse.json()) as ActiveResponse;
    const secret = (await secretResponse.json()) as SecretResponse;
    const inactive = (await inactiveResponse.json()) as InactiveResponse;
    const nonActiveNonDisabled =
      (await nonActiveNonDisabledResponse.json()) as InactiveNonDisabledResponse;
    const disabled = (await disableResponse.json()) as disabledResponse;

    let source: any[] = [];

    switch (type) {
      case "active":
        source = active.active_ppp;
        break;

      case "inactive":
        source = inactive.inactive_ppp;
        break;

      case "disabled":
        source = disabled.disabled_ppp;
        break;

      case "nonactive":
        source = nonActiveNonDisabled.inactive_ppp;
        break;

      default:
        source = secret.active_ppp;
        break;
    }

    // Search
    if (search) {
      source = source.filter((item) =>
        item.name?.toLowerCase().includes(search),
      );
    }

    const result = paginate(source, page, limit);

    return c.json({
      success: true,

      summary: {
        jumlah_active: active.jumlah_active_ppp,
        jumlah_secret: secret.jumlah_active_ppp,
        jumlah_inactive: inactive.jumlah_inactive_ppp,
        jumlah_nonactive_nondisabled: nonActiveNonDisabled.jumlah_inactive_ppp,
        jumlah_disabled: disabled.jumlah_disabled_ppp,
      },

      type,

      ...result,
    });
  } catch (err) {
    console.error(err);

    return c.json(
      {
        success: false,
        message: err instanceof Error ? err.message : "Internal Server Error",
      },
      500,
    );
  }
});

export default app;
