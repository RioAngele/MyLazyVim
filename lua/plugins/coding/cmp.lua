local M_codeium = require("plugins.coding.codeium")
return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-emoji",
		"saadparwaiz1/cmp_luasnip",
		-- codeium
		{
			"Exafunction/codeium.nvim",
			cmd = "Codeium",
			build = ":Codeium Auth",
			opts = {},
		},
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),
			sources = cmp.config.sources({
				{ name = "codeium", group_index = 1, priority = 100 },
				{ require("clangd_extensions.cmp_scores") },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
                {name = "emoji"},
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					local icons = require("util.icons").kind
					-- if icons[item.kind] then
					-- 	item.kind = icons[item.kind] .. item.kind
					-- end

					-- This concatonates the icons without the name of the item kind
					-- item.kind = string.format("%s", icons[item.kind])
					-- This concatonates the icons with the name of the item kind
					item.kind = string.format("%s %s", icons[item.kind], item.kind)
					item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
						codeium = "[AI]",
                        emoji = "[Emoji]",
					})[entry.source.name]
					return item
				end,
			},
			experimental = {
				-- ghost_text = false,
				-- native_menu = false,
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
			-- confirm_opts = {
			-- 	behavior = cmp.ConfirmBehavior.Replace,
			-- 	select = false,
			-- },
			-- window = {
			-- 	documentation = {
			-- 		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			-- 	},
			-- },
			sorting = defaults.sorting,
		}
	end,

	---@param opts cmp.ConfigSchema
	config = function(_, opts)
		for _, source in ipairs(opts.sources) do
			source.group_index = source.group_index or 1
		end
		require("cmp").setup(opts)
	end,
}
