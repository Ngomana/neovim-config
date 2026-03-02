return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
    },
    opts = function(_, opts)
      opts.open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" }
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
