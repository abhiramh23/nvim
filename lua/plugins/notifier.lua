return {
    "vigoux/notifier.nvim",
    lazy = true,
    config = function()
        require("notifier").setup({
            -- You configuration here
        })
    end,
}
