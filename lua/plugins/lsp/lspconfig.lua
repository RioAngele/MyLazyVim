local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		{ "folke/neodev.nvim", opts = {} },
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	---@class PluginLspOpts
}

-- 定义函数设置 LSP 键盘映射
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

-- 设置 LSP 连接成功后的附加操作
M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
end

-- 设置通用的 LSP 客户端能力
function M.common_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	return capabilities
end

-- 主要的配置函数
function M.config()
	local lspconfig = require("lspconfig")
	local icons = require("util.icons")

	-- 配置要启用的 LSP 服务器
	local servers = {
		"lua_ls",
		"clangd",
		--"cssls",
		--"html",
		--"tsserver",
		--"astro",
		--"pyright",
		"bashls",
		--"jsonls",
		--"yamlls",
		"marksman",
		--"tailwindcss",
	}
	-- 默认的诊断配置
	local default_diagnostic_config = {
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			},
		},
		-- virtual_text = true,
		-- update_in_insert = false,
		-- underline = true,
		-- severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},

		underline = true,
		update_in_insert = false,
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = "●",
			-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
			-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
			-- prefix = "icons",
		},
		severity_sort = true,
	}
	local default_format = {
		formatting_options = nil,
		timeout_ms = nil,
	}

	-- 配置默认的诊断显示
	vim.diagnostic.config(default_diagnostic_config)

	-- 定义诊断的符号显示
	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- 配置悬浮窗口的样式
	--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	--vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	-- 遍历所有要启用的 LSP 服务器进行配置
	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
			format = default_format,
			inlay_hints = {
				enabled = false,
			},
		}

		-- 尝试加载用户自定义的 LSP 设置
		local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		-- 特殊处理 Lua LSP 服务器
		if server == "lua_ls" then
			require("neodev").setup({})
		end

		-- 使用 lspconfig 插件进行 LSP 服务器的设置
		lspconfig[server].setup(opts)
	end
end

return M
