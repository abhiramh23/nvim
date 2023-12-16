vim.loader.enable()
local options = {
    backup = false,                                 -- creates a backup file
    clipboard = "unnamedplus",                      -- allows neovim to access the system clipboard
    cmdheight = 1,                                  -- more space in the neovim command line for displaying messages
    completeopt = "menu,menuone,noselect,noinsert", -- mostly just for cmp
    conceallevel = 0,                               -- so that `` is visible in markdown files
    fileencoding = "utf-8",                         -- the encoding written to a file
    ignorecase = true,                              -- ignore case in search patterns
    mouse = "a",                                    -- allow the mouse to be used in neovim
    pumheight = 10,                                 -- pop up menu height
    pumblend = 10,                                  -- Popup blend
    showmode = false,                               -- we don't need to see things like -- INSERT -- anymore
    autochdir = true,
    smartcase = true,                               -- smart case
    smartindent = true,                             -- make indenting smarter again
    splitbelow = true,                              -- force all horizontal splits to go below current window
    splitright = true,                              -- force all vertical splits to go to the right of current window
    swapfile = false,                               -- creates a swapfile
    termguicolors = true,                           -- set term gui colors (most terminals support this)
    timeoutlen = 1000,                              -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                                -- enable persistent undo
    writebackup = false,                            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                               -- convert tabs to spaces
    shiftwidth = 2,                                 -- the number of spaces inserted for each indentation
    tabstop = 2,                                    -- insert 2 spaces for a tab
    cursorline = true,                              -- highlight the current line
    number = true,                                  -- set numbered lines
    laststatus = 3,
    showcmd = false,
    ruler = false,
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4,       -- set number column width to 2 {default 4}
    signcolumn = "yes",    -- always show the sign column, otherwise it would shift the text each time
    wrap = true,           -- display lines as one long line
    title = true,
    colorcolumn = "80",
    splitkeep = "screen",
    undolevels = 10000,
    wildmode = "longest:full,full", -- Command-line completion mode
    scrolloff = 4,                  -- Lines of context
    sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
    shiftround = true,              -- Round indent
    sidescrolloff = 8,              -- Columns of context
    spell = true,
    spelllang = { "en_us" },
    foldcolumn = "1", -- '0' is not bad
    foldlevel = 99,   -- Using ufo provider need a large value, feel free to decrease the value
    foldlevelstart = 99,
    foldenable = true,
    fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
    winwidth = 10,
    winminwidth = 10,
    equalalways = true,
    breakindent = true,
    hlsearch = false,

}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.fillchars.eob = " "
vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
    stl = " ",
})
for k, v in pairs(options) do
    vim.opt[k] = v
end
