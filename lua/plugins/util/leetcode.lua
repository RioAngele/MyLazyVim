local M = {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- telescope 所需
		"MunifTanjim/nui.nvim",

		-- 可选
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- 配置放在这里
		lang = "c",

		cn = { -- leetcode.cn
			enabled = true, ---@type boolean
			translator = true, ---@type boolean
			translate_problems = true, ---@type boolean
		},
		---@type string
		directory = vim.fn.stdpath("data") .. "/leetcode/",
	},
}
M.config = function(_, opts)
    local map=vim.api.nvim_set_keymap
    map("n","<leader>ulc","<cmd>Leet console<cr>",{desc="leetcode console"})
    map("n","<leader>ult","<cmd>Leet test<cr>",{desc="leetcode test"})
    map("n","<leader>uls","<cmd>Leet submit<cr>",{desc="leetcode submit"})
    map("n","<leader>uld","<cmd>Leet desc<cr>",{desc="leetcode desc"})
    require("leetcode").setup(opts)
end

return M
