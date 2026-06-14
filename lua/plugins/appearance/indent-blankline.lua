-- Indent blankline plugin.
-- Displays indentation guides with a custom character.

-- return {
-- 	"lukas-reineke/indent-blankline.nvim",
-- 	main = "ibl",
-- 	config = function()
-- 		local highlight = {
-- 			"RainbowRed",
-- 			"RainbowYellow",
-- 			"RainbowBlue",
-- 			"RainbowOrange",
-- 			"RainbowGreen",
-- 			"RainbowViolet",
-- 			"RainbowCyan",
-- 		}
--
-- 		local hooks = require("ibl.hooks")
--
-- 		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- 			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
-- 			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
-- 			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
-- 			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
-- 			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
-- 			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
-- 			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- 		end)
--
-- 		require("ibl").setup({
-- 			indent = {
-- 				char = "│",
-- 				highlight = highlight,
-- 			},
-- 			scope = {
-- 				enabled = true,
-- 			},
-- 		})
-- 	end,
-- }

-- return {
-- 	"shellRaining/hlchunk.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		require("hlchunk").setup({
-- 			chunk = {
-- 				enable = true,
-- 				chars = {
-- 					horizontal_line = "─",
-- 					vertical_line = "│",
-- 					left_top = "╭",
-- 					left_bottom = "╰",
-- 				},
-- 			},
-- 			indent = {
-- 				enable = true,
-- 			},
-- 		})
-- 	end,
-- }

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = function(_, opts)
		return require("indent-rainbowline").make_opts(opts, {
			color_transparency = 0.14,
			colors = {
				0x61AFEF,
				0x98C379,
				0xE5C07B,
				0xD19A66,
				0xC678DD,
				0x56B6C2,
			},
		})
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	},
}
