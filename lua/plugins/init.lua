return {
	{
		"folke/neodev.nvim",
		lazy = true,
	},
	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			require("whichkey")
		end,
	},
	{ "folke/neoconf.nvim", lazy = true, cmd = "Neoconf" },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"folke/noice.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {
			lsp = {
				progress = { enabled = true },
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{ "stevearc/dressing.nvim", lazy = true },
	{
		"ziontee113/icon-picker.nvim",
		config = true,
		dependencies = "stevearc/dressing.nvim",
		lazy = true,
		cmd = "IconPickerInsert",
		opts = { disable_legacy_commands = true },
	},
	{
		"gbprod/yanky.nvim",
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				lazy = true,
				opts = {
					enable_autocmd = false,
				},
				config = function()
					require("ts_context_commentstring").setup({})
				end,
			},
		},
		config = function()
			pcall(require, "treesitter")
			require("ts_context_commentstring").setup({})
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
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
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	},
	-- telescope
	{
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
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
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
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"antosha417/nvim-lsp-file-operations",
		},
		keys = {
			{ "<C-f>", "<cmd>NvimTreeToggle<cr>", desc = "Tree view" },
		},
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true
		end,
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		config = function()
			require("autopair")
		end,
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		lazy = true,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",

			{
				"L3MON4D3/LuaSnip",
				opts = {
					history = true,
					delete_check_events = "TextChanged",
				},
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
			-- "hrsh7th/cmp-emoji",
			-- "chrisgrieser/cmp-nerdfont",
			-- "ray-x/cmp-treesitter",
			-- "hrsh7th/cmp-nvim-lsp-document-symbol",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			"lukas-reineke/cmp-under-comparator",
		},
		config = function()
			require("autocomplition")
		end,
	},
	-- lsp
	{ "kkharji/lspsaga.nvim", config = true },
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
			},
			{
				"junnplus/lsp-setup.nvim",
				lazy = true,
				config = function()
					require("lsp")
				end,
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
			})
		end,
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		},
	},
	{
		"nvim-lua/lsp-status.nvim",
		lazy = true,
		opts = {
			select_symbol = function(cursor_pos, symbol)
				if symbol.valueRange then
					local value_range = {
						["start"] = {
							character = 0,
							line = vim.fn.byte2line(symbol.valueRange[1]),
						},
						["end"] = {
							character = 0,
							line = vim.fn.byte2line(symbol.valueRange[2]),
						},
					}

					return require("lsp-status.util").in_range(cursor_pos, value_range)
				end
			end,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nanotee/nvim-lsp-basics" },
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>mf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
			},
			format_on_save = { lsp_fallback = true },
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,

		-- This function is optional, but if you want to customize formatters do it here
		config = function(_, opts)
			local util = require("conform.util")
			util.add_formatter_args(require("conform.formatters.shfmt"), { "-i", "2" })
			require("conform").setup(opts)
		end,
	},
	{

		"folke/twilight.nvim",
		cmd = "Twilight",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 10, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		cmd = "ZenMode",
	},
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			require("smoothcursor").setup()
		end,
	},
	{
		"dstein64/vim-startuptime",
		lazy = true,
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{ "ellisonleao/glow.nvim", lazy = true, config = true, cmd = "Glow" },
	{
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
	},
	{
		"folke/flash.nvim",
		lazy = true,
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"startup-nvim/startup.nvim",
		config = function()
			require("startup").setup()
		end,
	},
}
