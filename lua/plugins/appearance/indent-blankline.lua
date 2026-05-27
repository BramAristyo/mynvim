-- Indent blankline plugin.
-- Displays indentation guides with a custom character.
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup{
      indent = {
       char = "│",
      },
      scope = {
        enabled = true,
      },
    }
  end,
}
