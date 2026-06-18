-- return {
--   "vimcolorschemes/olive-crt.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("olive-crt")
--   end,
-- }

-- return {
-- 	{
-- 		"neanias/everforest-nvim",
-- 		version = false,
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			require("everforest").setup({
-- 				background = "medium",
-- 			})
-- 			vim.cmd([[colorscheme everforest]])
-- 		end,
-- 	},
-- }

return {
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "medium",
			})
		end,
	},

	{
		"nickkadutskyi/jb.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
	},
}

-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme carbonfox")
-- 	end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme kanagawa-wave")
--   end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme tokyonight-night")
--   end,
-- }
