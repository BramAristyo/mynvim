-- Treesitter configuration.
-- Provides advanced syntax highlighting and code parsing.
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup{
      ensure_installed = { "lua", "python", "javascript", "bash", "go" },
    }
  end,
}
