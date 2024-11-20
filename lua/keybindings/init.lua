-- Define common options for key mappings
local opts = { noremap = true, silent = true }

-- Use vim.keymap.set for simplicity and readability
vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerInsert<cr>", opts)
vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) -- Yank the selected icon into register
vim.keymap.set("i", "<f>", "<cmd>Format<CR>", opts)
vim.keymap.set("i", "<fw>", "<cmd>FormatWrite<cr>", opts)

-- Buffer navigation
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Buffer re-ordering
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Go to specific buffer positions using a loop
for i = 1, 9 do
    vim.keymap.set('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
end
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Buffer pin/unpin
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Magic buffer-picking mode
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Sort buffers
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
vim.keymap.set('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other useful commands (documentation notes for reference)
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
