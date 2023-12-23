local M = {
	"voldikss/vim-translator",
}

M.config = function()
    local map=vim.api.nvim_set_keymap
    map("n", "<leader>tr", "<cmd>TranslateW<cr>", {desc = "Translate word",noremap = true, silent = true})
end
return M
