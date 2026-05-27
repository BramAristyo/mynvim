-- Lazygit integration for Neovim.
-- Allows running Lazygit directly within the editor.
return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = { "LazyGit" },
  dependencies = { "nvim-lua/plenary.nvim" },
}
