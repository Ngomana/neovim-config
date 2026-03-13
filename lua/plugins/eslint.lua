return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            -- Validate on save only instead of every keystroke (much faster for TypeScript)
            run = "onSave",
          },
        },
      },
    },
  },
}
