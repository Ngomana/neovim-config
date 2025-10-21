return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- for file icons
    },
    config = function()
      local nvim_tree = require("nvim-tree")

      -- Disable netrw (the built-in file browser)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      nvim_tree.setup({
        sort_by = "case_sensitive",
        hijack_cursor = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,

        -- Show diagnostics like Neo-tree
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          debounce_delay = 50,
          icons = {
            hint = "󰌵",
            info = "",
            warning = "",
            error = "",
          },
        },

        -- Show git status like Neo-tree
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          timeout = 500,
        },

        view = {
          width = 32,
          side = "left",
          preserve_window_proportions = true,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
        },

        renderer = {
          root_folder_label = false,
          highlight_git = true,
          highlight_opened_files = "name",
          indent_markers = {
            enable = true,
            inline_arrows = true,
          },
          icons = {
            glyphs = {
              default = "󰈙",
              symlink = "",
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },

        -- Auto follow current file (like Neo-tree)
        update_focused_file = {
          enable = true,
          update_root = true,
          ignore_list = {},
        },

        -- Filter and show hidden/dotfiles (like Neo-tree filtered_items)
        filters = {
          dotfiles = false,
          custom = { "node_modules", ".git" },
        },

        actions = {
          open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
              enable = true,
            },
          },
        },
      })

      -- Optional keymaps similar to LazyVim defaults
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
      vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", { desc = "Focus File Explorer" })
    end,
  },
}
