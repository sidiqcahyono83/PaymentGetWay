import { Hono } from "hono";
import { phpurl } from "../../lib/php";
import { prisma } from "../../lib/prisma";
export const app = new Hono();

interface PppSecret {
  ".id": string;
  name: string;
  profile: string;
  disabled: string;
}

interface PppActive {
  ".id": string;
  name: string;
  profile: string;
  disabled: string;
}

interface ProfileSummary {
  profile: string;
  total: number;
  active: number;
}

interface ApiResponse<T> {
  status: number;
  message: string;
  total: number;
  data: T[];
}

app.get("/dashboard", async (c) => {
  const phpurlapi = process.env.PHP_API_URL;
  try {
    const [
      secretResponse,
      activeResponse,
      inactiveResponse,
      disableResponse,
      nonDisableResponse,
    ] = await Promise.all([
      await fetch(`${phpurlapi}/pppoe/secret`),
      await fetch(`${phpurlapi}/pppoe/active`),
      await fetch(`${phpurlapi}/pppoe/nonactive`),
      await fetch(`${phpurlapi}/pppoe/nonactive`),
      await fetch(`${phpurlapi}/pppoe/nonactive`),
    ]);

    console.log("Secret Response:", secretResponse);
    console.log("Active Response:", activeResponse);
    console.log("Inactive Response:", inactiveResponse);
    console.log("Disabled Response:", disableResponse);
    console.log("Inactive Non-Disabled Response:", nonDisableResponse);
    // const secrets = secretResponse.data;
    // const active = activeResponse.data;
    // const inactive = inactiveResponse.data;
    // const disabled = disableResponse.data;
    // const inactiveNonDisabled = nonDisableResponse.data;

    // const profileMap = new Map<string, ProfileSummary>();

    // // ===============================
    // // Hitung total secret per profile
    // // ===============================
    // for (const secret of secrets) {
    //   const profile = secret.profile || "-";

    //   let summary = profileMap.get(profile);

    //   if (!summary) {
    //     summary = {
    //       profile,
    //       total: 0,
    //       active: 0,
    //     };

    //     profileMap.set(profile, summary);
    //   }

    //   summary.total++;
    // }

    // // ===============================
    // // Username aktif
    // // ===============================
    // const activeNames = new Set(active.map((item) => item.name));

    // // ===============================
    // // Hitung aktif per profile
    // // ===============================
    // for (const secret of secrets) {
    //   if (activeNames.has(secret.name)) {
    //     const summary = profileMap.get(secret.profile || "-");

    //     if (summary) {
    //       summary.active++;
    //     }
    //   }
    // }

    // const totalSecret = secrets.length;
    // const totalActive = active.length;
    // const totalInactive = inactive.length;
    // const totalDisabled = disabled.length;
    // const totalInactiveNonDisabled = inactiveNonDisabled.length;

    // const onlinePercentage =
    //   totalSecret === 0
    //     ? 0
    //     : Number(((totalActive / totalSecret) * 100).toFixed(2));

    return c.json({
      success: true,
      summary: {
        // total_secret: totalSecret,
        // active: totalActive,
        // inactive: totalInactive,
        // disabled: totalDisabled,
        // inactive_non_disabled: totalInactiveNonDisabled,
        // online_percentage: onlinePercentage,
      },
      // profile: Array.from(profileMap.values()).sort(
      // (a, b) => b.total - a.total,
      // ),
      // last_update: new Date().toISOString(),
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

//active
app.get("/active", async (c) => {
  try {
    const result = await fetch(`${phpurl}/pppactive.php`);

    if (!result.ok) {
      throw new Error(`Error! status: ${result.status}`);
    }

    const data = await result.json();
    // console.log("Data fetched from PHP API:", data);
    // Mengembalikan data sebagai JSON response dari Hono
    return c.json(data);
  } catch (error) {
    console.error(`Error fetching data: ${error}`);

    // Mengembalikan respons error jika terjadi kesalahan
    return c.json({ message: `Error fetching data` }, 500);
  }
});

//secret
app.get("/secret", async (c) => {
  try {
    const result = await fetch(`${phpurl}/pppSecret.php`);

    if (!result.ok) {
      throw new Error(`Error! status: ${result.status}`);
    }

    const data = await result.json();

    // Mengembalikan data sebagai JSON response dari Hono
    return c.json(data);
  } catch (error) {
    console.error(`Error fetching data: ${error}`);

    // Mengembalikan respons error jika terjadi kesalahan
    return c.json({ message: `Error fetching data` }, 500);
  }
});

//nonactive
app.get("/nonactive", async (c) => {
  try {
    const result = await fetch(`${phpurl}/nonactive.php`);

    if (!result.ok) {
      throw new Error(`Error! status: ${result.status}`);
    }

    const data = await result.json();

    // Mengembalikan data sebagai JSON response dari Hono
    return c.json(data);
  } catch (error) {
    console.error(`Error fetching data: ${error}`);

    // Mengembalikan respons error jika terjadi kesalahan
    return c.json({ message: `Error fetching data` }, 500);
  }
});

//nonactive Disable
app.get("/nonactiveNonDisable", async (c) => {
  try {
    const result = await fetch(`${phpurl}/nonactiveNonDisable.php`);

    if (!result.ok) {
      throw new Error(`Error! status: ${result.status}`);
    }

    const data = await result.json();

    // Mengembalikan data sebagai JSON response dari Hono
    return c.json(data);
  } catch (error) {
    console.error(`Error fetching data: ${error}`);

    // Mengembalikan respons error jika terjadi kesalahan
    return c.json({ message: `Error fetching data` }, 500);
  }
});

//nonactiveDisable
app.get("/nonactiveDisable", async (c) => {
  try {
    const result = await fetch(`${phpurl}/jumlahDIsable.php`);

    if (!result.ok) {
      throw new Error(`Error! status: ${result.status}`);
    }

    const data = await result.json();

    // Mengembalikan data sebagai JSON response dari Hono
    return c.json(data);
  } catch (error) {
    console.error(`Error fetching data: ${error}`);

    // Mengembalikan respons error jika terjadi kesalahan
    return c.json({ message: `Error fetching data` }, 500);
  }
});

/* interface UserPppoe {
{
    "username":"rafasya",
    "password":"rafasya123",
    "profile":"Unlimited1-30Mbps"
}
*/

// Endpoint untuk membuat PPPoE user
app.post("/createppp", async (c) => {
  try {
    const { username, password, profile } = await c.req.json();

    // Cek apakah data yang diperlukan ada
    if (!username || !password || !profile) {
      return c.json({ message: "Missing required fields" }, 400);
    }

    // Kirim request untuk membuat user baru
    const createResult = await fetch(`${phpurl}/creatpppoe.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username, password, profile }),
    });

    const data = await createResult.json();

    // Cek status hasil pembuatan user
    if (createResult.ok) {
      return c.json(data, 200); // Berhasil membuat user
    } else {
      return c.json({ message: "Error creating PPPoE user" }, 500);
    }
  } catch (error) {
    console.error(`Error creating PPPoE: ${error}`);
    return c.json({ message: "Error creating PPPoE" }, 500);
  }
});

// Endpoint untuk menonaktifkan PPPoE user
app.post("/disableppp", async (c) => {
  try {
    const { username } = await c.req.json();

    // Cek apakah username ada dalam request
    if (!username) {
      return c.json({ message: "Username is required" }, 400);
    }

    // Kirim request ke PHP API untuk menonaktifkan user
    const result = await fetch(`${phpurl}/disablepppoe.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username }),
    });

    // Periksa apakah respons dari PHP API valid
    if (!result.ok) {
      return c.json({ message: "Error disabling PPPoE user" }, 500);
    }

    const data = await result.json();

    // Periksa apakah data dari PHP API memiliki properti message
    if (data && data) {
      return c.json(data, 200); // Jika ada message, kembalikan respons
    } else {
      // Jika tidak ada message dalam respons, beri pesan error default
      return c.json({ message: "Unexpected error occurred" }, 500);
    }
  } catch (error) {
    console.error(`Error disabling PPPoE: ${error}`);
    return c.json({ message: "Error disabling PPPoE" }, 500);
  }
});

//Enable
app.post("/enableppp", async (c) => {
  try {
    const username = await c.req.json();

    if (!username) {
      console.error("No username provided");
      return c.json({ message: "Username is required" }, 400);
    }

    // console.log("Mengirim request ke PHP API dengan username:", username);

    const response = await fetch(`${phpurl}/enable.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username }),
    });

    console.log("Response status dari PHP API:", response.status);

    if (!response.ok) {
      const text = await response.text();
      console.error("Error response dari PHP API:", text);
      return c.json(
        { message: "Error enabling PPPoE user", detail: text },
        500,
      );
    }

    let data;
    try {
      data = await response.json();
    } catch (error) {
      console.error("Invalid JSON response dari PHP API:", error);
      return c.json({ message: "Invalid response from server" }, 500);
    }

    return c.json(data, 200);
  } catch (error) {
    console.error(`Error enabling PPPoE: ${error}`);
    return c.json({ message: "Error enabling PPPoE" }, 500);
  }
});

app.post("/updateppp", async (c) => {
  try {
    const { username, profile } = await c.req.json();

    if (!username || !profile) {
      return c.json({ message: "Username dan profile wajib diisi" }, 400);
    }

    console.log("Mengirim request ke PHP API updatepppoe.php", {
      username,
      profile,
    });

    const response = await fetch(`${phpurl}/updateprofilepppoe.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username, profile }),
    });

    console.log("Status response dari PHP API:", response.status);

    const text = await response.text();

    // Coba parse JSON
    let data;
    try {
      data = JSON.parse(text);
    } catch (error) {
      console.error("Gagal parsing JSON:", error);
      return c.json({ message: "Respon server tidak valid", raw: text }, 500);
    }

    if (!response.ok) {
      return c.json(
        { message: "Gagal update profile PPPoE", detail: data },
        500,
      );
    }

    return c.json(data, 200);
  } catch (error) {
    console.error("Error saat update PPPoE:", error);
    return c.json({ message: "Terjadi kesalahan server" }, 500);
  }
});

app.post("/deleteppp", async (c) => {
  try {
    const { username } = await c.req.json();

    if (!username) {
      return c.json({ message: "Username wajib disertakan" }, 400);
    }

    const response = await fetch(`${phpurl}/deletepppoe.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username }),
    });

    const text = await response.text();

    let data;
    try {
      data = JSON.parse(text);
    } catch (error) {
      console.error("Respon PHP bukan JSON:", text);
      return c.json({ message: "Respon server tidak valid", raw: text }, 500);
    }

    if (!response.ok) {
      return c.json({
        message: "Gagal menghapus user PPPoE",
        detail: data,
      });
    }

    return c.json(data, 200);
  } catch (error) {
    console.error("Error saat menghapus user PPPoE:", error);
    return c.json({ message: "Terjadi kesalahan server" }, 500);
  }
});

interface SyncResult {
  customer_id: string;
  username: string;
  fullname: string;
  sync: boolean;
  status: "sinkron" | "tidak sinkron";
}

// app.get("/syncCheck", async (c) => {
//   try {
//     // ======================
//     // 1. Ambil data PPP Secret
//     // ======================
//     const pppResponse = await fetch(`${phpurl}/pppSecret.php`);
//     const pppJson = await pppResponse.json();

//     const pppSecrets = pppJson|| [];

//     // ambil hanya name
//     const pppNames = pppSecrets.map((p: any) => p.name);

//     // ======================
//     // 2. Ambil data Customers
//     // ======================

//     const customers = await prisma.customer.findMany({
//       select: {
//         id: true,
//         username: true,
//         fullname: true,
//         status: true,
//       },
//     });

//     // ======================
//     // 3. Cek sinkronisasi
//     // ======================
//     const result: SyncResult[] = customers.map((cust: any): SyncResult => {
//       const isSync = pppNames.includes(cust.username);

//       return {
//         customer_id: cust.id,
//         username: cust.username,
//         fullname: cust.fullname,
//         sync: isSync,
//         status: isSync ? "sinkron" : "tidak sinkron",
//       };
//     });

//     // ======================
//     // 4. Statistik
//     // ======================
//     const total = result.length;
//     const sinkron = result.filter((r) => r.sync).length;
//     const tidakSinkron = total - sinkron;

//     return c.json({
//       success: true,
//       message: "Cek sinkronisasi customer vs PPP Secret",
//       summary: {
//         total_customer: total,
//         sinkron,
//         tidak_sinkron: tidakSinkron,
//       },
//       data: result,
//     });
//   } catch (error: any) {
//     return c.json(
//       {
//         success: false,
//         message: error.message,
//       },
//       500,
//     );
//   }
// });

interface PppNotSync {
  ppp_id: string;
  name: string;
  profile: string;
  disabled: boolean;
  status: "tidak sinkron";
}
// app.get("/secret/notSync", async (c) => {
//   try {
//     // ======================
//     // 1. Ambil PPP Secret
//     // ======================
//     const pppResponse = await fetch(`${phpurl}/pppSecret.php`);
//     const pppJson = await pppResponse.json();

//     const pppSecrets = pppJson|| [];

//     // ======================
//     // 2. Ambil Customer Username
//     // ======================
//     const customers = await prisma.customer.findMany({
//       select: {
//         username: true,
//       },
//     });

//     const customerUsernames = customers.map((c) => c.username);

//     // ======================
//     // 3. Filter PPP TIDAK sinkron
//     // ======================
//     const notSync: PppNotSync[] = pppSecrets
//       .filter((p: any) => !customerUsernames.includes(p.name))
//       .map(
//         (p: any): PppNotSync => ({
//           ppp_id: p[".id"],
//           name: p.name,
//           profile: p.profile,
//           disabled: p.disabled === "true",
//           status: "tidak sinkron",
//         }),
//       );

//     // ======================
//     // 4. Response
//     // ======================
//     return c.json({
//       success: true,
//       message: "PPP Secret tidak sinkron dengan Customers",
//       summary: {
//         total_ppp_secret: pppSecrets.length,
//         tidak_sinkron: notSync.length,
//       },
//       data: notSync,
//     });
//   } catch (error: any) {
//     return c.json(
//       {
//         success: false,
//         message: error.message,
//       },
//       500,
//     );
//   }
// });

export default app;
