-- Nvim-tree file explorer.
-- Provides a sidebar for navigating the project directory structure.
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup{
      filters = {
        dotfiles = false,
      },
      view = {
        width = "15%"
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    }
  end,
}
