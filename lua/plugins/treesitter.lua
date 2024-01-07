return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	build = ":TSUpdate",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-refactor',
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			lazy = true,
			opts = {
				enable_autocmd = false,
			},
			config = function()
				local status_ok, commentstring = pcall(require, "ts_context_commentstring")
				if not status_ok then
					vim.notify("ts_context_commentstring not load")
					return
				end
				commentstring.setup({
					enable_autocmd = false,
				})
				vim.opt.updatetime = 100
			end,
		},
	},
	config = function()
		local status_ok1 = pcall(require, "treesitter")
		if not status_ok1 then
			vim.notify("treesitter not load")
		end
		local status_ok, context = pcall(require, "treesitter-context")
		if not status_ok then
			vim.notify("ts_context_commentstring not load")
			return
		end
		context.setup({
			enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
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
}
