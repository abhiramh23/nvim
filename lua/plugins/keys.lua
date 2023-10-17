return {
    "tamton-aquib/keys.nvim",
    lazy = true,
    cmd = "KeysToggle",
    config = function()
        require("keys").setup({
            enable_on_startup = true,
            win_opts = {
                width = 25,
                -- etc
            },
            -- TODO: more options later
        }, require("keys").current_keys(true))
    end,
}
