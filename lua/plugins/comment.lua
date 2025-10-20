return {
  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDCreateDefaultMappings = 1 -- Enable default mappings
      vim.g.NERDDefaultComment = "// " -- Default comment string
    end,
  },
}
