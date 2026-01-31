return {
  -- Disable the Snacks Explorer
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      explorer = {
        enabled = false,
      },
    },
  },
  -- Override mason plugin path
  {
    "mason-org/mason.nvim",
    opts = {},
  },
}
