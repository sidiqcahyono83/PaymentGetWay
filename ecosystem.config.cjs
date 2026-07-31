module.exports = {
  apps: [
    {
      name: "backend_paymentgateway",
      script: "bun",
      args: "index.ts",
      interpreter: "none",
      cwd: "/var/www/html/PaymentGetWay",

      env: {
        NODE_ENV: "production",
        PORT: 3001,
      },

      watch: false,
      autorestart: true,
      max_restarts: 10,
      restart_delay: 5000,

      out_file: "./logs/out.log",
      error_file: "./logs/error.log",
      merge_logs: true,
      time: true,
    },
  ],
};
