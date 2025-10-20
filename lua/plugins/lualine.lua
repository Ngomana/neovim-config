return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optional, if you need icons
  },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = {
          function()
            local filename = vim.fn.expand("%:t") -- Get the file name
            local dir = vim.fn.expand("%:p:h:t") -- Get the directory name
            if filename == "page.tsx" then
              return dir -- Display only the directory
            else
              return dir .. "/" .. filename -- Display directory and file
            end
          end,
        },
      },
      options = {
        theme = "gruvbox", -- Choose a theme if needed
      },
    })
  end,
  event = "VeryLazy",
}
