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

map("n", "<leader>d", "yyp")    
map("v", "<leader>d", "y'>p")

map("n", "<leader><leader>", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")  

map("n", "<leader>e", ":NvimTreeToggle<CR>")

map("n", "<leader>cd", vim.diagnostic.open_float)  

 
