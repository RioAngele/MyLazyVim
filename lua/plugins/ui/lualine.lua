local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
}

function M.config()
	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn" },
		symbols = { error = " ", warn = " " },
		colored = false,
		update_in_insert = false,
		always_visible = true,
	}
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end
	local diff = {
		"diff",
		colored = false,
		symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
		cond = hide_in_width,
	}

	local mode = {
		"mode",
		fmt = function(str)
			return "-- " .. str .. " --"
		end,
	}

	local filetype = {
		"filetype",
		icons_enabled = false,
		icon = nil,
	}

	local branch = {
		"branch",
		icons_enabled = true,
		icon = "",
	}

	local location = {
		"location",
		padding = 0,
	}

	-- cool function for progress
	local progress = function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end

	local spaces = function()
		return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
	end

	require("lualine").setup({
		-- options = {
		-- 	-- icons_enabled = true,
		-- -- 	component_separators = { left = "", right = "" },
		-- -- 	section_separators = { left = "", right = "" },
		-- 	-- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		-- -- 	always_divide_middle = true,
		-- },
		globalstatus = true,
		theme = "tokyonight",
		sections = {
			-- lualine_a = { "mode" },
			-- lualine_b = { "branch" },
			lualine_a = { branch, diagnostics },
			lualine_b = { mode },
			lualine_c = {},
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_x = { diff, "fileformat", "encoding", filetype },
			-- lualine_y = { location },
			-- lualine_z = { progress },
			lualine_y = {
				{ "progress", separator = " ", padding = { left = 1, right = 0 } },
				{ "location", padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},
		-- inactive_sections = {
		-- 	lualine_a = {},
		-- 	lualine_b = {},
		-- 	lualine_c = { "filename" },
		-- 	lualine_x = { "location" },
		-- 	lualine_y = {},
		-- 	lualine_z = {},
		-- },
		extensions = { "neo-tree", "lazy" },
	})
end
return M
