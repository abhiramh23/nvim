return {
    "neovim/nvim-lspconfig",
    dependencies = { "nanotee/nvim-lsp-basics" },
    config = function()
        -- Setup language servers.
        local lspconfig = require('lspconfig')
        lspconfig.pylsp.setup {}
        lspconfig.clangd.setup {}
        lspconfig.csharp_ls.setup {}
        lspconfig.lua_ls.setup {}
    end
}
