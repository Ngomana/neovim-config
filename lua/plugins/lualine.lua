return {
  -- Override LazyVim's default to use lualine
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = { enabled = false },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/snacks.nvim",
    },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
        component_separators = { left = "|", right = "|"},
        section_separators = { left = "", right = ""},
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { 
          "branch",
          "diff",
          "diagnostics"
        },
        lualine_c = {
          function()
            local filename = vim.fn.expand("%:t")
            local dir = vim.fn.expand("%:p:h:t")
            if filename == "page.tsx" then
              return dir
            else
              return dir .. "/" .. filename
            end
          end,
          "filesize"
        },
        lualine_x = { 
          "encoding",
          "fileformat",
          "filetype"
        },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
    })
  end,
  lazy = false,
  priority = 1000,
  },
}
