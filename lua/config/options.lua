-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- ~/.config/nvim/lua/config/options.lua

-- Use neo-tree as file explorer (disables Snacks Explorer)
vim.g.lazyvim_explorer = "neo-tree"

-- Line wrapping
vim.opt.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Wrap at word boundaries (not in middle of words)
vim.opt.breakindent = true -- Indent wrapped lines visually

-- Performance optimizations
vim.opt.updatetime = 250 -- Faster completion and diagnostics
vim.opt.timeoutlen = 300 -- Faster key sequence timeout
vim.opt.swapfile = false -- Disable swap files for better performance
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Disable backup before writing

-- LSP and completion performance
vim.opt.signcolumn = "yes" -- Always show sign column to prevent layout shift
vim.opt.pumheight = 10 -- Limit popup menu height for better performance

-- Reduce redraw frequency
vim.opt.lazyredraw = false -- Keep disabled in Neovim 0.9+
vim.opt.ttyfast = true -- Faster terminal connection

-- Clipboard (using OSC 52 - no external tools needed)
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
