-- Lualine statusline configuration.
-- Sets up the powerline theme and removes default separators.
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup{
      options = {
        theme = "powerline",
        section_separators = "",
        component_separators = "",
      }
    }
  end,
}
