local M = {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = function()
		---@diagnostic disable-next-line
		require("nvim-surround").setup({
			keymaps = {
				insert = "<c-g>gsa",
				insert_line = "<c-g>gsl",
				normal = "gsa",
				normal_cur = "gsA",
				normal_line = "gsl",
				normal_cur_line = "gsL",
				visual = "gsa",
				visual_line = "gsl",
				delete = "gsd",
				change = "gsc",
				change_line = "gsC",
			},
		})
		local map = vim.keymap.set
		map({ "n", "v" }, "gsa", "gsa", { desc = "surround insert", silent = true, noremap = true })
		map({ "n", "v" }, "gsl", "gsl", { desc = "surround insert line", silent = true, noremap = true })
		map({ "n" }, "gsA", "gsA", { desc = "surround insert current", silent = true, noremap = true })
		map({ "n" }, "gsL", "gsL", { desc = "surround insert current line", silent = true, noremap = true })
		map({ "n" }, "gsd", "gsd", { desc = "surround delete", silent = true, noremap = true })
		map({ "n" }, "gsc", "gsc", { desc = "surround change", silent = true, noremap = true })
		map({ "n" }, "gsC", "gsC", { desc = "surround change line", silent = true, noremap = true })
	end,
}
return M
