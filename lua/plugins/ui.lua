return {

  { import = "lazyvim.plugins.extras.ui.dashboard", enabled = false },

  -- Disable snacks dashboard starter to use dashboard-nvim
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
           █████╗ ████████╗██╗  ██╗██╗      ██████╗ ███╗   ██╗    ██╗      █████╗ ██████╗ ███████╗    
          ██╔══██╗╚══██╔══╝██║  ██║██║     ██╔═══██╗████╗  ██║    ██║     ██╔══██╗██╔══██╗██╔════╝    
          ███████║   ██║   ███████║██║     ██║   ██║██╔██╗ ██║    ██║     ███████║██████╔╝███████╗    
          ██╔══██║   ██║   ██╔══██║██║     ██║   ██║██║╚██╗██║    ██║     ██╔══██║██╔══██╗╚════██║    
          ██║  ██║   ██║   ██║  ██║███████╗╚██████╔╝██║ ╚████║    ███████╗██║  ██║██████╔╝███████║    
          ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝    ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝    
       ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      opts.config = opts.config or {}
      opts.config.header = vim.split(logo, "\n")

      -- Optional: Remove LazyVim’s footer/buttons if you want full control
      opts.config.center = opts.config.center or {}
      opts.config.footer = {}
    end,
  },
}
