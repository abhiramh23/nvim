local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerInsert<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
vim.keymap.set("i", "<f>", "<cmd>Format<CR>", opts)
vim.keymap.set("i", "<fw>", "<cmd>FormatWrite<cr>", opts)
