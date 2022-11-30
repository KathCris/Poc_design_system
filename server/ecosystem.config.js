module.exports = {
  apps: [
    {
      name: "lms-app",
      exec_mode: "cluster",
      instances: "1",
      script: "./node_modules/nuxt/bin/nuxt.js",
      args: "start",
    },
  ],
};
