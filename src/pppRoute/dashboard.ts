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

  try {
    const activeResponse = await fetch(`${phpurlapi}/pppoe/active`);
    const secretResponse = await fetch(`${phpurlapi}/pppoe/secret`);
    const inactiveResponse = await fetch(`${phpurlapi}/pppoe/nonactive`);
    const nonActiveNonDisabledResponse = await fetch(
      `${phpurlapi}/pppoe/nonactiveNonDisable`,
    );
    const disableResponse = await fetch(`${phpurlapi}/pppoe/nonactiveDisable`);

    // console.log("Status :", response.status);
    // console.log("OK :", response.ok);

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
    // console.log(active);
    // console.log(secret);
    // console.log(inactive);

    // console.log("========== ACTIVE ==========");
    // console.log("Status :", data.status);
    // console.log("Message :", data.message);
    // console.log("Jumlah :", data.jumlah_active_ppp);
    // console.log("Data :", data.active_ppp.length);

    if (active.active_ppp.length > 0) {
      console.log("Sample :", active.active_ppp[0]);
    }

    if (secret.active_ppp.length > 0) {
      console.log("Sample :", secret.active_ppp[0]);
    }

    if (inactive.inactive_ppp.length > 0) {
      console.log("Sample :", inactive.inactive_ppp[0]);
    }

    if (nonActiveNonDisabled.inactive_ppp.length > 0) {
      console.log("Sample :", nonActiveNonDisabled.inactive_ppp[0]);
    }

    if (disabled.disabled_ppp.length > 0) {
      console.log("Sample :", disabled.disabled_ppp[0]);
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

export default app;
