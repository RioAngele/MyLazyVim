return {
	"Wansmer/treesj",
	keys = { { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Toggle split join" } },
	cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
	opts = {
		use_default_keymaps = false,
	},
}
