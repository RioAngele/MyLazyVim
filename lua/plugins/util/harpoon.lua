local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

M.config = function()
	local harpoon = require("harpoon")
	require("telescope").load_extension("harpoon")
	harpoon.setup()
	vim.keymap.set("n", "<leader>aa", function()
		harpoon:list():append()
	end, { desc = "Add to harpoon list" })


	vim.keymap.set("n", "<leader>ac", function()
		harpoon:list():clear()
	end, { desc = "clear harpoon list" })

	vim.keymap.set("n", "<leader>ar", function()
		harpoon:list():remove()
	end, { desc = "remove from harpoon list" })

	vim.keymap.set("n", "<leader>ae", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "toggle harpoon menu" })

	vim.keymap.set("n", "<leader>fh", "<cmd>Telescope harpoon marks<CR>", { desc = "toggle harpoon telescope" })

	vim.keymap.set("n", "<leader>ah", function()
		harpoon:list():select(1)
	end, { desc = "go to harpoon 1" })

	vim.keymap.set("n", "<leader>aj", function()
		harpoon:list():select(2)
	end, { desc = "go to harpoon 2" })

	vim.keymap.set("n", "<leader>ak", function()
		harpoon:list():select(3)
	end, { desc = "go to harpoon 3" })

	vim.keymap.set("n", "<leader>al", function()
		harpoon:list():select(4)
	end, { desc = "go to harpoon 4" })

	vim.keymap.set("n", "<leader>ap", function()
		harpoon:list():prev()
	end, { desc = "go to harpoon prev" })

	vim.keymap.set("n", "<leader>an", function()
		harpoon:list():next()
	end, { desc = "go to harpoon next" })
end

return M
