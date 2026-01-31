return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      
      -- Lazy load snippet sources only when needed
      vim.api.nvim_create_autocmd("InsertEnter", {
        once = true,
        callback = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_snipmate").lazy_load()
          require("luasnip.loaders.from_lua").lazy_load()
        end,
      })
    end,
  },
}
