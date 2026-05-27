-- Comment.nvim configuration.
-- Provides easy commenting mappings for single lines and blocks.
return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup{}
  end,
}
