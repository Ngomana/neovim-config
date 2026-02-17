return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
      },
      formatters = {
        prettier = {
          -- Use pnpm exec to run prettier (works with monorepos on Windows)
          command = "pnpm",
          args = { "exec", "prettier", "--stdin-filepath", "$FILENAME" },
        },
      },
    },
  },
}
