local Util = {}

--- print warning
---@param message string
---@param options table
function Util.warn(message, options)
	options = options or {}
	local title = options.title or "Warning"
	vim.api.nvim_out_write(string.format("[%-1s] %s\n", title, message))
end

--- print info
---@param message string
---@param options table
function Util.info(message, options)
	options = options or {}
	local title = options.title or "Info"
	vim.api.nvim_out_write(string.format("[%-1s] %s\n", title, message))
end

return Util
