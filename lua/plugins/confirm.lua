return {
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
			--fish = { "fish_indent" },
			sh = { "shfmt" },
			-- Conform will run multiple formatters sequentially
			python = { "black" },
			["javascript"] = { "prettier" },
			["javascriptreact"] = { "prettier" },
			["typescript"] = { "prettier" },
			["typescriptreact"] = { "prettier" },
			["vue"] = { "prettier" },
			["css"] = { "prettier" },
            c = {"clang_format"},
            cpp = {"clang_format"},
			["scss"] = { "prettier" },
			["less"] = { "prettier" },
			["html"] = { "prettier" },
			["json"] = { "prettier" },
			["jsonc"] = { "prettier" },
			["yaml"] = { "prettier" },
			["markdown"] = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			["graphql"] = { "prettier" },
			["handlebars"] = { "prettier" },
			-- Use a sub-list to run only the first available formatter
			--javascript = { { "prettierd", "prettier" } },
		},
		formatters = {
			injected = { options = { ignore_errors = true } },
			-- # Example of using dprint only when a dprint.json file is present
			-- dprint = {
			--   condition = function(ctx)
			--     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
			--   end,
			-- },
			--
			-- # Example of using shfmt with extra args
			-- shfmt = {
			--   prepend_args = { "-i", "2", "-ci" },
			-- },
		},
	},
}
