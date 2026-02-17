return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  -- Override all default keybindings by setting keys
  keys = {
    -- Disable the default 's' keybinding completely
    { "s", mode = { "n", "x", "o" }, false },
    -- Use 'S' for Flash instead
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
    -- Keep treesitter search on 'R'
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
  },
}
