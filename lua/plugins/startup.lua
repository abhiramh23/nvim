return {
    "startup-nvim/startup.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("startup").setup()
    end,
}
