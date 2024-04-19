return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "windwp/nvim-autopairs",
            lazy = true,
            config = function()
                require("autopair")
            end,
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
