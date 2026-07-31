module.exports = {
  apps: [
    {
      name: "teranet-backend",
      script: "src/index.ts", // file utama Bun kamu
      interpreter: "bun", // gunakan Bun sebagai interpreter
      watch: true, // optional: restart kalau ada perubahan file
      env: {
        NODE_ENV: "production",
        PORT: 3000,
      },
    },
  ],
};
// pm2 start ecosystem.config.js
