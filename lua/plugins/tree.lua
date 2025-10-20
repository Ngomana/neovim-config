return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer Neo-tree" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- show hidden files
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "", -- folder icon
          folder_open = "", -- open folder icon
          folder_empty = "", -- empty folder icon
          default = "", -- default file icon
          highlight = "NeoTreeFileIcon",
        },
      },
    },
  },
}
