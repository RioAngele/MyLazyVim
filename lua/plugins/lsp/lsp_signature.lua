return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {},
	-- config = function(_, opts)
	-- 	require("lspconfig").gopls.setup()
	-- 	require("lsp_signature").setup({
	-- 		bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- 		handler_opts = {
	-- 			border = "rounded",
	-- 		},
	-- 	})
	-- 	vim.keymap.set({ "n" }, "<leader>kk", function()
	-- 		require("lsp_signature").toggle_float_win()
	-- 	end, { silent = true, noremap = true, desc = "toggle signature" })
	--
	-- 	vim.keymap.set({ "n" }, "<Leader>ka", function()
	-- 		vim.lsp.buf.signature_help()
	-- 	end, { silent = true, noremap = true, desc = "toggle signature" })
	-- end,
}
