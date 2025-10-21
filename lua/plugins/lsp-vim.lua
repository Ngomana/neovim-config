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

          -- Optional: better completion + hints
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              suggest = {
                completeFunctionCalls = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionLikeReturnTypeHints = true,
              },
            },
          },
        },
      },
    },
  },
}
