local types = require("luasnip.util.types")

require 'luasnip'.config.setup({
    history = true,
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "GruvboxOrange" } }
            }
        },
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "GruvboxBlue" } }
            }
        }
    },
})
