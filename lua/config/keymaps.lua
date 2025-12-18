-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all text
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tabs
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "tn", "tabnext<RETURN>", opts)
keymap.set("n", "tp", "tabprev<RETURN>", opts)

-- Split window
keymap.set("n", "ss", ":split<RETURN>", opts)
keymap.set("n", "sv", ":vsplit<RETURN>", opts)

vim.keymap.set("n", "<leader>uh", function()
  local enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not enabled)
  vim.notify("Inlay hints " .. (enabled and "off" or "on"))
end, { desc = "Toggle Inlay Hints" })
