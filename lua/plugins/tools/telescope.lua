-- Telescope fuzzy finder.
-- Used for searching files, live grep, and more.
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup{}
  end,
}
