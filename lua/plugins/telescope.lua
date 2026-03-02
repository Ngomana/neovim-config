return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    -- Custom action to open file with window-picker
    local function open_with_window_picker(prompt_bufnr)
      local entry = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      if entry then
        local win = require("window-picker").pick_window({ hint = "floating-big-letter" })
        if win then
          vim.api.nvim_set_current_win(win)
          vim.cmd("edit " .. entry.path)
        end
      end
    end

    require("telescope").setup({
      defaults = {
        -- Tell Telescope to use `fd` instead of `find`
        find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob",
          "!.git/*",
        },
        mappings = {
          i = {
            ["<C-w>"] = open_with_window_picker,
          },
          n = {
            ["<C-w>"] = open_with_window_picker,
          },
        },
      },
    })
  end,
}
