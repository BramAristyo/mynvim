local opt = vim.opt

vim.lsp.inlay_hint.enable(true)

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

opt.mouse = "a"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.pumheight = 10

opt.splitbelow = true
opt.splitright = true

opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 250

opt.clipboard = "unnamedplus"

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.exrc = true
opt.secure = true

-- vim.cmd.colorscheme("jb")

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--
-- 		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- 	end,
-- })

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = true,
	},
})

-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     local clients = vim.lsp.get_clients({ bufnr = 0 })
--     if #clients > 0 then
--       vim.lsp.buf.hover()
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- vim.g.clipboard = {
-- 	name = "OSC 52",
-- 	copy = {
-- 		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
-- 	},
-- 	paste = {
-- 		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
-- 		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
-- 	},
-- }
