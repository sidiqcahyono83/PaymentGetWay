import { Hono } from "hono";
import { oltAuth } from "../midleware/oltAuth";

export type VariablesOlt = {
  xToken: string;
  baseUrl: string;
};

interface OntInfo {
  ont_name: string;
  ont_sn: string;
  [key: string]: unknown;
}

interface OntResponse {
  data: OntInfo[];
}
const olt = new Hono<{ Variables: VariablesOlt }>();

// semua ONU
olt.get("/onu", oltAuth, async (c) => {
  const token = c.get("xToken");
  const baseUrl = c.get("baseUrl");

  const res = await fetch(`${baseUrl}/ontinfo_table`, {
    headers: {
      "x-token": token,
    },
  });
  console.log(`${baseUrl}/ontinfo_table`);

  console.log("Status:", res.status);
  console.log("Content-Type:", res.headers.get("content-type"));

  const text = await res.text();

  console.log("Response:", text);

  return c.text(text);
});

// ONU berdasarkan ont_name
olt.get("/onu/:name", oltAuth, async (c) => {
  const token = c.get("xToken");
  const name = c.req.param("name");
  const baseUrl = c.get("baseUrl");

  if (!name) {
    return c.json({ message: "ont_name tidak ditemukan" }, 400);
  }

  const res = await fetch(`${baseUrl}/ontinfo_table`, {
    headers: {
      "x-token": token,
    },
  });

  const data = (await res.json()) as OntResponse;

  const result = data.data.filter(
    (ont: any) => ont.ont_name.toLowerCase() === name.toLowerCase(),
  );

  return c.json({
    total: result.length,
    data: result,
  });
});

olt.get("/onu/sn/:sn", oltAuth, async (c) => {
  const token = c.get("xToken");
  const sn = c.req.param("sn");
  const baseUrl = c.get("baseUrl");

  if (!sn) {
    return c.json({ error: "ONT SN tidak ditemukan" }, 400);
  }

  const res = await fetch(`${baseUrl}/ontinfo_table`, {
    headers: {
      "x-token": token,
    },
  });

  const data = (await res.json()) as OntResponse;

  const result = data.data.filter(
    (ont: any) => ont.ont_sn.toLowerCase() === sn.toLowerCase(),
  );

  return c.json({
    total: result.length,
    data: result,
  });
});

olt.get("/port/:port", oltAuth, async (c) => {
  const port = Number(c.req.param("port"));

  if (port < 1 || port > 8) {
    return c.json({ message: "port harus 1 - 8" }, 400);
  }

  const token = c.get("xToken");
  const baseUrl = c.get("baseUrl");

  const res = await fetch(
    `${baseUrl}/gponont_mgmt?form=res_name&port_id=${port}`,
    {
      headers: {
        "x-token": token,
      },
    },
  );

  const data = await res.json();

  return c.json(data);
});

export default olt;
