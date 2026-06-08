-- Treesitter configuration.
-- Provides advanced syntax highlighting and code parsing.
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup{}

    require("nvim-treesitter").install({ "lua", "python", "javascript", "bash", "go", "rust", "php", "blade" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "python", "javascript", "bash", "go", "rust", "php", "blade" },
      callback = function()
        vim.treesitter.start()
      end,
    })

    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.blade.php",
      callback = function()
        vim.bo.filetype = "blade"
      end,
    })
  end,
}
