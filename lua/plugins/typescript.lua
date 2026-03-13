return {
  -- Block vtsls from being set up by lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        vtsls = function()
          return true
        end,
      },
    },
  },
  -- Use typescript-tools.nvim for a faster native Lua TS server
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      settings = {
        tsserver_max_memory = 4096,
        complete_function_calls = true,
      },
    },
  },
  -- Ensure treesitter supports TypeScript
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "typescript", "tsx", "javascript" },
    },
  },
}
