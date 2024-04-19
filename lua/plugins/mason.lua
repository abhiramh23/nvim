return {
    "williamboman/mason.nvim",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        {
            "junnplus/lsp-setup.nvim",
            lazy = true,
            config = function()
                require("lsp")
            end,
        },
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls","html", "cssls", "tsserver" },
        })
    end,
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    },
}
