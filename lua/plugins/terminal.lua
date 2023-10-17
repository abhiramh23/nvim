return {
    "akinsho/toggleterm.nvim",
    config = true,
    version = "*",
    opts = {
        -- size can be a number or function which is passed the current terminal
        function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-t>]],
        autochdir = true,
        shade_terminals = true,
        close_on_exit = true,
        persist_size = true,
        start_in_insert = true,
        insert_mappings = true,
        auto_scroll = true,
        shell = "pwsh",
        direction = "float",
        float_opts = {
            border = "curved",
            winblend = 3,
        },
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    },
}
