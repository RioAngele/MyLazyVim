return {
	"luckasRanarison/tree-sitter-hypr",
	-- enabled = function()
	--   return have("hypr")
	-- end,
	event = "BufRead */hypr/*.conf",
	config = function()
		-- Fix ft detection for hyprland
		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})
		-- vim.filetype.add({
		-- 	pattern = { [".*/hypr/.*%.conf"] = "hypr" },
		-- })
	end,
}
