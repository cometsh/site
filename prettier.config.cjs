/** @type {import('@types/prettier').Options} */
module.exports = {
  plugins: ["prettier-plugin-astro", "prettier-plugin-tailwindcss"],
  proseWrap: "always",
  htmlWhitespaceSensitivity: "ignore",
  overrides: [
    {
      files: "*.astro",
      options: { parser: "astro" },
    },
  ],
};
