-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable LSP inlay hints (works even if a server/plugin re-enables them)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_disable_inlay_hints", { clear = true }),
  callback = function(args)
    -- Neovim 0.10+: vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
      pcall(vim.lsp.inlay_hint.enable, false, { bufnr = args.buf })
      return
    end
    -- Neovim 0.9 fallback (no per-buffer API)
    if vim.lsp.buf and vim.lsp.buf.inlay_hint then
      pcall(vim.lsp.buf.inlay_hint, args.buf, false)
    end
  end,
})
