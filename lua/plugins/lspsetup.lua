return {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "nanotee/nvim-lsp-basics" },
    config = function()
        -- Setup language servers.
        local lspconfig = require('lspconfig')
        lspconfig.pylsp.setup { on_attach = require 'virtualtypes'.on_attach }
        lspconfig.clangd.setup { on_attach = require 'virtualtypes'.on_attach }
        lspconfig.csharp_ls.setup { on_attach = require 'virtualtypes'.on_attach }
        lspconfig.lua_ls.setup { on_attach = require 'virtualtypes'.on_attach }
    end
}
