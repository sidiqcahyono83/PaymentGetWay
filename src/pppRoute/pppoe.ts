import { Hono } from "hono";
import { phpurl } from "../../lib/php";
import { prisma } from "../../lib/prisma";
export const app = new Hono();

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

    // console.log("Response status dari PHP API:", response.status);

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

    // console.log("Mengirim request ke PHP API updatepppoe.php", {
    // username,
    // profile,
    // });

    const response = await fetch(`${phpurl}/updateprofilepppoe.php`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username, profile }),
    });

    // console.log("Status response dari PHP API:", response.status);

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

export default app;
