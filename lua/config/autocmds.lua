local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf , desc = "Go to declaration"})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf , desc = "Go to definition"})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf ,desc = "References"})
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf ,desc = "Go to implementation"})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf ,desc = "Show Documentation"})
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf ,desc = "Show signature"})
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf ,desc = "Add workspace folder"})
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf , desc = "Remove workspace folder"})
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = ev.buf ,desc = "List workspace folders"})
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf ,desc = "Type definition"})
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = ev.buf ,desc = "Rename"})
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf ,desc = "Code action"})
		-- vim.keymap.set("n", "<space>f", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, { buffer = ev.buf })
	end,
})
