local configs = require("nvim-treesitter.configs")
require("nvim-treesitter.install").prefer_git = true
configs.setup({
	auto_install = true,
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
        "javascript",
        "tsx",
		"typescript",
		"html",
		"regex",
		"markdown",
		"python",
		"css",
		"markdown_inline",
		"markdown",
		"rst",
		"json",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"json5",
		"julia",
		"csv",
		"comment",
	},
})
