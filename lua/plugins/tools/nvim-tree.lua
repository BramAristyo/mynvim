-- Nvim-tree file explorer.
-- Provides a sidebar for navigating the project directory structure.
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup{
      filters = {
        dotfiles = false,
      }
    }
  end,
}
