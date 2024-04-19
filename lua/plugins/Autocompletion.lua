return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "windwp/nvim-autopairs",
            lazy = true,
            event = "InsertEnter",
            config = function()
                require("autopair")
            end,
        },
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            config = function()
                pcall(require, "luasnip")
            end,
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
                "saadparwaiz1/cmp_luasnip",
            },
        },
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-nvim-lua",
        "lukas-reineke/cmp-rg",
        -- "FelipeLema/cmp-async-path",
        -- "amarakon/nvim-cmp-buffer-lines",
        -- "uga-rosa/cmp-dictionary",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "chrisgrieser/cmp-nerdfont",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "lukas-reineke/cmp-under-comparator",
        "kdheepak/cmp-latex-symbols"
    },
    config = function()
        require("autocomplition")
    end,
}
