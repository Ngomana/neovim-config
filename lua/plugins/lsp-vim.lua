return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable automatic server setup to prevent conflicts
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
