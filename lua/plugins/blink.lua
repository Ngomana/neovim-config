return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      ---------------------------------------------------------------------------
      -- 🔧 Keymaps
      ---------------------------------------------------------------------------
      opts.keymap = {
        preset = "none",
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
        ["<C-Space>"] = { "show_and_insert_or_accept_single", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      }

      ---------------------------------------------------------------------------
      -- ⚙️ Completion
      ---------------------------------------------------------------------------
      opts.completion = {
        timeout_ms = 3000, -- ⏱ wait for LSP before falling back
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
          prefetch_on_insert = true,
          show_on_backspace_in_keyword = true,
        },
      }

      ---------------------------------------------------------------------------
      -- 🧩 Sources (prioritize LSP)
      ---------------------------------------------------------------------------
      opts.sources = {
        default = { "lsp", "buffer", "path" },
        providers = {
          lsp = { score_offset = 1000 }, -- Highest priority
          buffer = { score_offset = -100 }, -- Lower priority
          path = { score_offset = -500 },
        },
      }

      ---------------------------------------------------------------------------
      -- 🎨 Appearance  (includes borders, icons, highlights)
      ---------------------------------------------------------------------------
      opts.appearance = {
        border = "rounded", -- replaces the old windows.completion/docs border
        kind_icons = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰇽",
          Variable = "󰂡",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          Constant = "󰏿",
          Struct = "",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "󰅲",
        },
      }

      return opts
    end,
  },
}
