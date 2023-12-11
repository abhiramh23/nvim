return {
	{ "folke/neoconf.nvim",     lazy = true, cmd = "Neoconf" },
	{ "nvim-lua/plenary.nvim",  lazy = true },
	{ "stevearc/dressing.nvim", lazy = true },
	{ "nvim-lua/popup.nvim",    lazy = true },
	{
		"gbprod/yanky.nvim",
		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	-- gitsign
	{
		"lewis6991/gitsigns.nvim",
		opts = { current_line_blame = true },
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup({
				-- You configuration here
			})
		end,
	},
	-- lsp
	{ "kkharji/lspsaga.nvim",        config = true },

	{ "ellisonleao/glow.nvim",       lazy = true,  config = true, cmd = "Glow" },
}
