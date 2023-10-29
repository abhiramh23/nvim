return {
	{
		"folke/neodev.nvim",
		lazy = true,
	},
	{ "folke/neoconf.nvim", lazy = true, cmd = "Neoconf" },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "stevearc/dressing.nvim", lazy = true },
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
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("autopair")
		end,
	},
	-- lsp
	{ "kkharji/lspsaga.nvim", config = true },
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	},
	{ "ellisonleao/glow.nvim", lazy = true, config = true, cmd = "Glow" },
}
