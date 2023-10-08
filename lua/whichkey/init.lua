local wk = require("which-key")
-- wk.register(mappings, opts)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local mappings = {
	q = { ":q!<cr>", "Quit" },
	Q = { ":wq<cr>", "Save & Quit" },
	w = { ":w<cr>", "Save" },
	-- x = { "<Cmd>BufferClose<CR>", "Close" },
	-- R = { "<Cmd>BufferRestore<CR>", "Restore" },
	-- p = { "<Cmd>BufferPin<CR>", "Pin/Unpin" },
	E = { ":e ~/AppData/Local/nvim/init.lua<cr>", "Edit config" },
	L = { ":e ~/AppData/Local/nvim/lua/plugins/init.lua<cr>", "Edit plugins" },
	f = { ":Telescope find_files<cr>", "Telescope Find Files" },
	r = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
	i = { "<cmd>IconPickerInsert<cr>", "IconPickerInsert" },
	t = {
		name = "terminal",
		t = { "<cmd>ToggleTerm<CR>", "Terminal" },
		p = { '<cmd> TermExec cmd="python %" <CR>', "python" },
		l = { "<cmd>LazyGit<CR>", "LazyGit" },
	},
	l = {
		name = "LSP",
		i = { "<cmd>LspInfo<CR>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<CR>", "show The Hover" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
		l = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			"List Workspace Folders",
		},
		t = { "<cmd>Lspsaga goto_definition<CR>", "Go To  Definition" },
		d = { "<cmd>Lspsaga peek_definition<CR>", "Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		--r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		r = { "<cmd>Lspsaga rename<CR>", "Rename" },
		R = { "<cmd>Lspsaga rename ++project<CR>", "project Rename" },
		a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Go To Previous Diagnostic" },
		o = { "<cmd>Lspsaga outline<CR>", "Show Outline" },
		c = { "<cmd>Lspsaga hover_doc<CR>", "Incoming Call Hierarchy" },
		C = { "<cmd>Lspsaga outgoing_calls<CR>", "outgoing Call Hierarchy" },
		f = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
	},

	z = {
		name = "Focus",
		z = { ":ZenMode<CR>", "Toggle Zen Mode" },
		t = { ":Twilight<CR>", "Toggle Twilight" },
	},
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
