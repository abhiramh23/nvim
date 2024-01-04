return {
    "dseum/window.nvim",
    lazy = false,
    config = true,
    keys = {
        {
            "<leader>ww",
            function()
                require("window").close_buf()
            end,
        },
        {
            "<C-w>s",
            function()
                require("window").split_win("h")
            end,
        },
        {
            "<C-w>v",
            function()
                require("window").split_win("v")
            end,
        },
    },
}
