require("config.options")
require("config.autocmds")
require("config.launch")
require("config.keymaps")

spec("plugins.ui.Colorscheme")
spec("plugins.ui.which-key")
spec("plugins.ui.dressing")
spec("plugins.ui.neo-tree")
spec("plugins.ui.lualine")
spec("plugins.ui.noice")
spec("plugins.ui.notify")
spec("plugins.ui.bufferline")
spec("plugins.ui.indent-blankline")
spec("plugins.ui.mini-indentscope")

spec("plugins.confirm")

spec("plugins.lsp.mason")
spec("plugins.lsp.lspconfig")
spec("plugins.lsp.lint")
spec("plugins.lsp.none-ls")
-- spec "plugins.lsp.lsp_signature"

spec("plugins.lang.markdown")
spec("plugins.lang.clang")
spec("plugins.lang.java")

spec("plugins.debug.debug")

spec("plugins.test.neotest")

spec("plugins.coding.luasnip")
spec("plugins.coding.cmp")
spec("plugins.coding.mini-pairs")
spec("plugins.coding.neogen")
spec("plugins.coding.surround")
spec("plugins.coding.ts-context-commentstring")
spec("plugins.coding.treesj")
spec("plugins.coding.mini-comment")

spec("plugins.treesitter.treesitter")
spec("plugins.treesitter.ts-context")
spec("plugins.treesitter.ts-tag")

spec("plugins.util.start-time")
spec("plugins.util.persistence")
spec("plugins.util.trees-hypr")
spec("plugins.util.project")
spec("plugins.util.mini-hipatternts")
spec("plugins.util.toggleterm")
-- spec("plugins.util.leetcode")
spec("plugins.util.harpoon")
-- spec("plugins.util.image")
-- spec "plugins.util.translator"

spec("plugins.editor.spectre")
spec("plugins.editor.gitsigns")
spec("plugins.editor.flash")
spec("plugins.editor.illuminate")
spec("plugins.editor.mini-bufremove")
spec("plugins.editor.trouble")
spec("plugins.editor.todo-comments")
spec("plugins.editor.telescope")

require("config.lazy")
