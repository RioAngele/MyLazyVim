local M = {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({})
			end,
			mode = { "n", "v" },
			desc = "Format Langs",
		},
	},
	opts = {
		format = {
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
		},
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			python = { "black" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			c_sharp = { "clang_format" },
			scss = { "prettier" },
			less = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			graphql = { "prettier" },
			handlebars = { "prettier" },
			rust = { "rustfmt" },
			go = { "goimports", "gofumpt" },
		},
		formatters = {
			injected = { options = { ignore_errors = true } },
		},
	},
}

M.config = function(_, opts)
	--format on save
	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	pattern = "*",
	-- 	callback = function(args)
	-- 		require("conform").format({ bufnr = args.buf })
	-- 	end,
	-- })

	local conform = require("conform")
	conform.setup(opts)
	conform.formatters["google-java-format"] = {
		prepend_args = { "-a" },
	}
end

return M
