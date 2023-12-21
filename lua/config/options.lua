vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true }) --短消息
local opts = {
	autowrite = true, -- 启用自动写入
	clipboard = "unnamedplus", -- 与系统剪贴板同步
	completeopt = "menu,menuone,noselect", -- 补全选项
	conceallevel = 3, -- 隐藏*标记，用于粗体和斜体
	confirm = true, -- 在退出修改的缓冲区之前确认保存更改
	cursorline = true, -- 启用当前行高亮
	expandtab = true, -- 使用空格而不是制表符
	formatoptions = "jcroqlnt", -- 格式选项
	grepformat = "%f:%l:%c:%m", -- grep 格式
	grepprg = "rg --vimgrep", -- grep 程序
	ignorecase = true, -- 忽略大小写
	inccommand = "nosplit", -- 预览增量替换
	laststatus = 3, -- 全局状态行
	list = true, -- 显示一些不可见字符（制表符等）
	mouse = "a", -- 启用鼠标模式
	number = true, -- 显示行号
	pumblend = 10, -- 弹出窗口混合
	pumheight = 10, -- 弹出窗口中的最大条目数
	relativenumber = true, -- 相对行号
	scrolloff = 4, -- 上下文行数
	sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }, -- 会话选项
	shiftround = true, -- 四舍五入缩进
	shiftwidth = 4, -- 缩进大小
	showmode = false, -- 不显示模式，因为有状态栏
	sidescrolloff = 8, -- 上下文列数
	signcolumn = "yes", -- 始终显示标志列，否则每次都会移动文本
	smartcase = true, -- 不忽略大写
	smartindent = true, -- 自动插入缩进
	spelllang = { "en" }, -- 拼写语言
	splitbelow = true, -- 将新窗口放在当前窗口下方
	splitkeep = "screen", -- 保持分屏状态
	splitright = true, -- 将新窗口放在当前窗口右侧
	tabstop = 4, -- 制表符的空格数
	termguicolors = true, -- 真彩色支持
	timeoutlen = 300, -- 超时长度
	undofile = true, -- 启用撤销文件
	undolevels = 10000, -- 撤销历史数
	updatetime = 200, -- 保存交换文件并触发光标保持
	virtualedit = "block", -- 允许光标在可视块模式中没有文本的地方移动
	wildmode = "longest:full,full", -- 命令行完成模式
	winminwidth = 5, -- 窗口的最小宽度
	wrap = false, -- 禁用换行
	fillchars = {
		foldopen = "",
		foldclose = "",
		-- fold = "⸱",
		fold = " ",
		foldsep = " ",
		diff = "╱",
		eob = " ",
	}, -- 填充字符
}
for k, v in pairs(opts) do
	vim.opt[k] = v
end

if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
--vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"

--if vim.fn.has("nvim-0.9.0") == 1 then
--  vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
--end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
else
	vim.opt.foldmethod = "indent"
end

vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- neovide config
vim.g.neovide_transparency = 1 --透明度
vim.o.guifont = "JetBrainsMono Nerd Font:h16" --字体
vim.g.neovide_scale_factor = 1 --规模
