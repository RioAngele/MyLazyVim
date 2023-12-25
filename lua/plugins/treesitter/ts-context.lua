return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	enabled = true,
	opts = { mode = "cursor", max_lines = 3 },
	keys = {
		{
			"<leader>ut",
			function()
				local inject = require("util.inject")
				local message = require("util.message")
				local tsc = require("treesitter-context")
				tsc.toggle()
				if inject.get_upvalue(tsc.toggle, "enabled") then
					message.info("Enabled Treesitter Context", { title = "Option" })
				else
					message.warn("Disabled Treesitter Context", { title = "Option" })
				end
			end,
			desc = "Toggle Treesitter Context",
		},
	},
}
