return {
    "mfussenegger/nvim-lint",
    lazy = true,
    config = function()
        require("lint").linters_by_ft = {
            lua = { "luacheck" },
            python = { "pylint" },
            c = { "clangtidy" }
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
