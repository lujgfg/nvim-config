vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "Y", "0y$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<leader>x', ":bd!", { noremap = true, silent = true })
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>')
