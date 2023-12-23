local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
}

M.config = function()
	local harpoon = require("harpoon")
	require("telescope").load_extension("harpoon")
	harpoon.setup()
	vim.keymap.set("n", "<leader>ha", function()
		harpoon:list():append()
	end, { desc = "Add to harpoon list" })


	vim.keymap.set("n", "<leader>hc", function()
		harpoon:list():clear()
	end, { desc = "clear harpoon list" })

	vim.keymap.set("n", "<leader>hr", function()
		harpoon:list():remove()
	end, { desc = "remove from harpoon list" })

	vim.keymap.set("n", "<leader>he", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "toggle harpoon menu" })

	vim.keymap.set("n", "<leader>fh", "<cmd>Telescope harpoon marks<CR>", { desc = "toggle harpoon telescope" })

	vim.keymap.set("n", "<leader>hh", function()
		harpoon:list():select(1)
	end, { desc = "go to harpoon 1" })

	vim.keymap.set("n", "<leader>hj", function()
		harpoon:list():select(2)
	end, { desc = "go to harpoon 2" })

	vim.keymap.set("n", "<leader>hk", function()
		harpoon:list():select(3)
	end, { desc = "go to harpoon 3" })

	vim.keymap.set("n", "<leader>hl", function()
		harpoon:list():select(4)
	end, { desc = "go to harpoon 4" })

	vim.keymap.set("n", "<leader>hp", function()
		harpoon:list():prev()
	end, { desc = "go to harpoon prev" })

	vim.keymap.set("n", "<leader>hn", function()
		harpoon:list():next()
	end, { desc = "go to harpoon next" })
end

return M
