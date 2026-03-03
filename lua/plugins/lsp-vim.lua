return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true,

      servers = {
        -- Disable clangd for JavaScript/TypeScript projects
        clangd = {
          autostart = false, -- Don't start in non-C/C++ projects
        },
      },
    },
  },
}
