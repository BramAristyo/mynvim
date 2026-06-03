-- Treesitter configuration.
-- Provides advanced syntax highlighting and code parsing.
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup{}

    require("nvim-treesitter").install({ "lua", "python", "javascript", "bash", "go", "rust" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "python", "javascript", "bash", "go", "rust" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
