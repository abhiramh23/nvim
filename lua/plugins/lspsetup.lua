return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "nanotee/nvim-lsp-basics" },
    config = function()
        -- Setup language servers.
        local lspconfig = require('lspconfig')
        local servers = {
            "lua_ls", "html", "cssls", "tsserver"
        }
        for key, value in pairs(servers) do
            lspconfig[value].setup { on_attach = require 'virtualtypes'.on_attach }
        end
    end
}
