-- Everforest color scheme.
-- Provides a clean, green-based color palette for Neovim.
return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, 
  config = function()
    require("everforest").setup({})
  end,
}
