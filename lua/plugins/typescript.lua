return {
  -- Ensure TypeScript/JavaScript parsers are installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx", "javascript", "jsdoc" })
      end
    end,
  },

  -- Mason: ensure TypeScript tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "typescript-language-server",
        "prettier",
        "eslint-lsp",
      })
    end,
  },

  -- LSP Config for TypeScript using typescript-language-server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Use ts_ls (typescript-language-server)
        ts_ls = {
          enabled = true,
        },
      },
    },
  },
}
