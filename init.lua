local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")

-- Load plugins from lua/plugins directory
require("lazy").setup({
	{ import = "plugins.appearance" },
	{ import = "plugins.tools" },
	{ import = "plugins.lsp" },
	{ import = "plugins.code" },
})

-- vim.cmd.colorscheme("jb")

local cwd = vim.fn.getcwd()

if cwd:match("services%-aaapower") then
	vim.cmd.colorscheme("everforest")
else
	vim.cmd.colorscheme("jb")
end
