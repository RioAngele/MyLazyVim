local M = {
	"lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
	main = "ibl",
}
--local M = { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }

return M
