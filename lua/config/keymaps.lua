-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local map = vim.keymap.set

local opts = { noremap = true, silent = true }
--map("n", "<Space>", "<leader>", opts)
map("i", "jk", "<Esc>", opts)
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" , silent = true})
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" , silent = true})
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" , silent = true})
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" , silent = true})

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" , silent = true})
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" , silent = true})
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" , silent = true})
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" , silent = true})
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" , silent = true})
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" , silent = true})

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer", silent = true })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" , silent = true})
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" , silent = true})

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / clear hlsearch / diff update" , silent = true}
)

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", '"_dP', opts)

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
