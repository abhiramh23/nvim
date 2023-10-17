require('lsp-setup').setup({
    servers = {
        lua_ls = {
            settings = {
                Lua = {
                    hint = {
                        enable = false,
                        arrayIndex = "Auto",
                        await = true,
                        paramName = "All",
                        paramType = true,
                        semicolon = "SameLine",
                        setType = false,
                    },
                },
            },
        },
    }
})
