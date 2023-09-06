vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>e", ":Explore<CR>|", opts) -- open netrw

keymap("n", "<leader><ESC>", ":nohl<CR>", opts) -- clear search highlights

keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>c", ":close<CR>", opts) -- close current split window
keymap("n", "<leader><leader>", "<C-w>w", opts) -- focus next window
keymap("n", "<leader>h", "<C-w>h", opts) -- focus left window
keymap("n", "<leader>l", "<C-w>l", opts) -- focus right window
keymap("n", "<leader>k", "<C-w>k", opts) -- focus top window
keymap("n", "<leader>j", "<C-w>j", opts) -- focus bottom window
keymap("n", "<leader>=", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "-", ":vertical resize -2<CR>", opts) -- resize window vertically -
keymap("n", "+", ":vertical resize +2<CR>", opts) -- resize window vertically +
keymap("n", "<leader>m", ":MaximizerToggle<CR>", opts) -- toggle split window maximization
keymap("n", "<leader><CR>", "<cmd>w!<CR>", opts) -- save file

keymap("n", "<leader>n", ":bn<CR>", opts) --  buffer next
keymap("n", "<leader>p", ":bp<CR>", opts) --  buffer prev
keymap("n", "<leader>D", ":bdelete<CR>", opts) -- delete buffer
keymap("n", "<leader>d", ":Bdelete<CR>", opts) -- delete buffer but preserve the layout

keymap("n", "<leader>tk", ":m .-2<CR>==", opts) -- move text up
keymap("n", "<leader>tj", ":m .+1<CR>==", opts) -- move text down
