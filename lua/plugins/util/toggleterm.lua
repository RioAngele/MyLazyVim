local M = {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {--[[ things you want to change go here]]
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
}

M.config = function(_, opts)
	require("toggleterm").setup(opts)

	function _G.set_terminal_keymaps()
		local key_opts = { noremap = true }
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], key_opts)
		-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], key_opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], key_opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], key_opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], key_opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], key_opts)
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	vim.api.nvim_set_keymap(
		"n",
		"<leader>gg",
		"<cmd>lua _LAZYGIT_TOGGLE()<CR>",
		{ noremap = true, silent = true, desc = "Lazygit" }
	)

	local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

	function _LAZYDOCKER_TOGGLE()
		lazydocker:toggle()
	end

	vim.api.nvim_set_keymap(
		"n",
		"<leader>ud",
		"<cmd>lua _LAZYDOCKER_TOGGLE()<CR>",
		{ noremap = true, silent = true, desc = "lazydocker" }
	)
	-- local node = Terminal:new({ cmd = "node", hidden = true })
	--
	-- function _NODE_TOGGLE()
	-- 	node:toggle()
	-- end
	--
	-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
	--
	-- function _NCDU_TOGGLE()
	-- 	ncdu:toggle()
	-- end
	--
	local htop = Terminal:new({ cmd = "htop", hidden = true })

	function _HTOP_TOGGLE()
		htop:toggle()
	end

	vim.api.nvim_set_keymap(
		"n",
		"<leader>uh",
		"<cmd>lua _HTOP_TOGGLE()<CR>",
		{ noremap = true, silent = true, desc = "Htop" }
	)

	local python = Terminal:new({ cmd = "python", hidden = true })

	function _PYTHON_TOGGLE()
		python:toggle()
	end

	vim.api.nvim_set_keymap(
		"n",
		"<leader>uy",
		"<cmd>lua _PYTHON_TOGGLE()<CR>",
		{ noremap = true, silent = true, desc = "Python" }
	)
end

return M
