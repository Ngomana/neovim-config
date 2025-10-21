return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
          -- 👇 Capabilities are inherited from LazyVim automatically
          flags = { allow_incremental_sync = true },

          on_init = function(client)
            client.config.flags = client.config.flags or {}
            client.config.flags.allow_incremental_sync = true
            client.notify("workspace/didChangeWatchedFiles", {})
          end,

          -- 🚫 Disable all TypeScript & JavaScript inlay hints
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
              },
              suggest = {
                completeFunctionCalls = true, -- keep this nice completion feature
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
              },
              suggest = {
                completeFunctionCalls = true,
              },
            },
          },
        },
      },
    },
  },
}
