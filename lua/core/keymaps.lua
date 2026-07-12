local map = vim.keymap.set

vim.g.mapleader = " "

map("i", "jk", "<Esc>")

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>wq", ":wq<CR>")

map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

map("n", "<leader>sv", ":vsplit<CR>")
map("n", "<leader>sh", ":split<CR>")

map("n", "<leader>d", "yyp")
map("v", "<leader>d", "y'>p")

map("n", "<leader><leader>", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fs", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = { "function", "method", "struct", "interface", "class", "constructor", "enum" },
	})
end)
map("n", "<C-/>", ":noh<CR>")

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>cd", ":Telescope diagnostics<CR>")
map("n", "<leader>gg", "<Cmd>LazyGit<CR>")
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "]d", vim.diagnostic.goto_next)
map("n", "[d", vim.diagnostic.goto_prev)

map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>rn", vim.lsp.buf.rename)

map("i", "<C-s>", vim.lsp.buf.signature_help)
map("i", "<C-o>", "<Esc>o")

map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<S-q>", ":Bdelete<CR>")

map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")

map("n", "<leader>th", function()
	local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
	print("Inlay Hints " .. (is_enabled and "OFF" or "ON"))
end, { desc = "Toggle LSP Inlay Hints" })

map("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlight" })

map("v", "<BS>", '"_d')
map("v", "<Delete>", '"_d')

map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end)
map("n", "<leader>dc", function()
	require("dap").continue()
end)
map("n", "<leader>do", function()
	require("dap").step_over()
end)
map("n", "<leader>di", function()
	require("dap").step_into()
end)
map("n", "<leader>du", function()
	require("dapui").toggle()
end)

map("n", "<leader>c", function()
	local diag = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diag > 0 then
		vim.fn.setreg("+", diag[1].message)
		print("Copied: " .. diag[1].message:sub(1, 60) .. (diag[1].message:len() > 60 and "..." or ""))
	else
		print("No diagnostic at cursor")
	end
end)

map("v", "<", "<gv")
map("v", ">", ">gv")
