-- Nvim-autopairs configuration.
-- Automatically closes brackets, quotes, and other paired characters.
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup{}
  end,
}
