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

map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>bp", ":bprev<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")

map("n", "<leader>d", "yyp")
map("v", "<leader>d", "y'>p")

map("n", "<leader><leader>", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>cd", vim.diagnostic.open_float)
map("n", "<leader>gg", ":LazyGit<CR>")
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>rn", vim.lsp.buf.rename)

map("i", "<C-k>", vim.lsp.buf.signature_help)

map("n", "<leader>cd", vim.diagnostic.open_float)
