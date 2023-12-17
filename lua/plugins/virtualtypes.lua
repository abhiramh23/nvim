return {
    'jubnzv/virtual-types.nvim',
    lazy = true,
    config = function()
        local statusok, lsp = pcall(require, 'nvim_lsp')
        if not statusok then
            vim.notify("lsp not load")
        end
        local servers = { "clangd", "rust_analyzer", "pyright", "tsserver", "lua_ls" }
        for _, server in ipairs(servers) do
            lsp[server].setup { on_attach = require 'virtualtypes'.on_attach }
        end
    end
}
