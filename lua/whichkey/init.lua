-- Function to determine the operating system
local function get_os()
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        return "windows"
    elseif vim.fn.has("unix") == 1 then
        return "linux"
    else
        return "unknown"
    end
end

-- Determine the OS and set the config path
local os_name = get_os()
local config_path

if os_name == "windows" then
    config_path = "~\\AppData\\Local\\nvim\\init.lua"
elseif os_name == "linux" then
    config_path = "~/.config/nvim/init.lua"
else
    error("Unsupported operating system")
end

-- Load which-key
local wk = require("which-key")

-- Define key mappings with which-key
wk.add({
    { "<leader>E",  "<cmd>e " .. vim.fn.fnameescape(config_path) .. " <cr>", desc = "Edit Configuration" },
    { "<leader>f",  group = "file" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                         desc = "Find File",         mode = "n" },
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
