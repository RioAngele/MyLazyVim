require "config.options"
require "config.autocmds"
require "config.launch"
require "config.keymaps"

spec "plugins.ui.Colorscheme"
spec "plugins.ui.which-key"
spec "plugins.ui.dressing"
spec "plugins.ui.neo-tree"
spec "plugins.ui.lualine"
spec "plugins.ui.noice"
spec "plugins.ui.bufferline"
spec "plugins.ui.indent-blankline"
spec "plugins.ui.mini-indentscope"

spec "plugins.confirm"

spec "plugins.lsp.mason"
spec "plugins.lsp.lspconfig"
spec "plugins.lsp.lint"

spec "plugins.lang.markdown"
spec "plugins.lang.clang"

spec "plugins.coding.luasnip"
spec "plugins.coding.cmp"
spec "plugins.coding.mini-pairs"
spec "plugins.coding.mini-surround"
spec "plugins.coding.ts-context-commentstring"
spec "plugins.coding.mini-comment"

spec "plugins.treesitter.treesitter"
spec "plugins.treesitter.ts-context"
spec "plugins.treesitter.ts-tag"

spec "plugins.util.start-time"
spec "plugins.util.persistence"
spec "plugins.util.trees-hypr"


spec "plugins.editor.spectre"
spec "plugins.editor.gitsigns"
spec "plugins.editor.flash"
spec "plugins.editor.illuminate"
spec "plugins.editor.mini-bufremove"
spec "plugins.editor.trouble"
spec "plugins.editor.todo-comments"
spec "plugins.editor.telescope"

require "config.lazy"
--vim.cmd[[colorscheme tokyonight-moon]]

