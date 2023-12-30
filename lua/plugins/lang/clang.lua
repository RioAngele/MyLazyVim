return {
	"p00f/clangd_extensions.nvim",
	lazy = true,
	opts = {
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(
				"Makefile",
				"configure.ac",
				"configure.in",
				"config.h.in",
				"meson.build",
				"meson_options.txt",
				"build.ninja"
			)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
				"lspconfig.util"
			).find_git_ancestor(fname)
		end,
		capabilities = {
			offsetEncoding = { "utf-16" },
		},
		init_options = {
			usePlaceholders = true,
			completeUnimported = true,
			clangdFileStatus = true,
		},
		inlay_hints = {
			inline = false,
		},
		ast = {
			--These require codicons (https://github.com/microsoft/vscode-codicons)
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},
			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},
		},
	},
	config = function(_, opts)
		local map = vim.keymap.set
		map("n", "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
		map({ "n", "v" }, "<leader>cA", "<cmd>ClangdAST<cr>", { desc = "ast" })
		map("n", "<leader>ct", "<cmd>ClangdToggleInlayHints<cr>", { desc = "Toggle Inlay Hints" })
		require("clangd_extensions").setup(opts)
	end,
}
