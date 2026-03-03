return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
    },
    opts = function(_, opts)
      opts.open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" }

      -- Icons and git status symbols
      opts.default_component_configs = vim.tbl_deep_extend("force", opts.default_component_configs or {}, {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "★",
            ignored = "",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      })

      -- Explicit renderers to ensure git status is visible
      opts.renderers = vim.tbl_deep_extend("force", opts.renderers or {}, {
        file = {
          { "indent" },
          { "icon" },
          { "name", use_git_status_colors = true },
          { "git_status", highlight = "NeoTreeDimText" },
        },
        directory = {
          { "indent" },
          { "icon" },
          { "name" },
          { "git_status", highlight = "NeoTreeDimText" },
        },
      })

      -- Performance
      opts.async_directory_scan = "auto"
      opts.enable_git_status = true
      opts.enable_diagnostics = false
      opts.git_status_async = true
      opts.git_status_async_options = {
        batch_size = 1000,
        batch_delay = 10,
        max_lines = 10000,
      }
      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        use_libuv_file_watcher = true,
        scan_mode = "deep",
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      })

      -- Window mappings
      opts.window = opts.window or {}
      opts.window.mappings = vim.tbl_extend("force", opts.window.mappings or {}, {
        ["<cr>"] = "open_with_window_picker",
        ["o"] = "open_with_window_picker",
        ["O"] = "system_open",
        ["s"] = "split_with_window_picker",
        ["v"] = "vsplit_with_window_picker",
      })
      opts.commands = opts.commands or {}
      opts.commands.system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.fn.jobstart({ "xdg-open", path }, { detach = true })
      end
      return opts
    end,
  },
}
