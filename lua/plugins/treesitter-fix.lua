-- Fix for treesitter parser warnings
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure ensure_installed is a table
      opts.ensure_installed = opts.ensure_installed or {}
      
      -- Add jsonc if not present (fixes LazyVim warning)
      if not vim.tbl_contains(opts.ensure_installed, "jsonc") then
        table.insert(opts.ensure_installed, "jsonc")
      end
      
      return opts
    end,
  },
}
