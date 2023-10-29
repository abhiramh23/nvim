return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	-- or                              , branch = '0.1.x',
	dependencies = {
		"tsakirist/telescope-lazy.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"piersolenski/telescope-import.nvim",
		"nvim-telescope/telescope-github.nvim",
		"smartpde/telescope-recent-files",
		"crispgm/telescope-heading.nvim",
		-- lazygit
		{
			"kdheepak/lazygit.nvim",
			lazy = true,
			cmd = "LazyGit",
		},
	},
	config = function()
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("gh")
		require("telescope").load_extension("lazygit")
		require("telescope").load_extension("lazy")
		require("telescope").load_extension("import")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("recent_files")
		require("telescope").load_extension("yank_history")
		require("telescope").load_extension("heading")
		require("telescope").load_extension("ui-select")
	end,
	opts = {
		extensions = {
			import = {
				-- Add imports to the top of the file keeping the cursor in place
				insert_at_top = true,
			},
			lazy = {
				-- Optional theme (the extension doesn't set a default theme)
				theme = "tokyonight",
				-- Whether or not to show the icon in the first column
				show_icon = true,
				-- Mappings for the actions
				mappings = {
					open_in_browser = "<C-o>",
					open_in_file_browser = "<M-b>",
					open_in_find_files = "<C-f>",
					open_in_live_grep = "<C-g>",
					open_plugins_picker = "<C-b>", -- Works only after having called first another action
					open_lazy_root_find_files = "<C-r>f",
					open_lazy_root_live_grep = "<C-r>g",
				},
				-- Other telescope configuration options
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			undo = {
				-- telescope-undo.nvim config, see below
			},
			recent_files = {
				-- This extension's options, see below.
			},
			heading = {
				treesitter = true,
			},
			file_browser = {
				theme = "tokyonight",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	},
}
