-- Create annotations with one keybind, and jump your cursor in the inserted annotation
local M = {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = true,
	keys = {
		{
			"<leader>cc",
			function()
				require("neogen").generate({})
			end,
			desc = "Neogen Comment",
		},
	},
	opts = { snippet_engine = "luasnip" },
}

M.config = function(_, opts)
	-- local opts = { noremap = true, silent = true }
	-- vim.api.nvim_set_keymap("i", "<C-l>", ":lua require('neogen').jump_next<CR>", opts)
	-- vim.api.nvim_set_keymap("i", "<C-h>", ":lua require('neogen').jump_prev<CR>", opts)
	require("neogen").setup(opts)
end

return M
