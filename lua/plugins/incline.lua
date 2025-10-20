return {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      window = {
        -- Basic window setup
        zindex = 50, -- Adjust z-index as needed
        width = 30, -- Adjust width as needed
      },
      -- Use other supported options
      -- For instance, adjusting height, etc.
    })
  end,
  event = "VeryLazy",
}
