local wk = require("which-key")
local config_path = "~\\AppData\\Local\\nvim\\init.lua"

wk.add({
    { "<leader>E",  "<cmd>e" .. config_path .. " <cr>", desc = "Edit Configuration" },
    { "<leader>f",  group = "file" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>",    desc = "Find File",         mode = "n" },
    { "<leader>fn", desc = "New File" }, 
    {
        "<leader>b",
        group = "buffers",
        expand = function()
            return require("which-key.extras").expand.buf()
        end
    },
    {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { "n", "v" },                           -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q!<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
        { "<leader>w", "<cmd>w<cr>",  desc = "Write" },
        { "<leader>Q", "<cmd>wq<cr>", desc = "Write Quit" },
    }

})
