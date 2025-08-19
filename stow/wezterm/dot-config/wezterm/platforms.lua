local wezterm = require("wezterm")

local utils = require("utils")

local M = {}

local platform_configs = {
	darwin = {
		font_size = 14,
	},
}

function M.apply_to_config(config)
	if wezterm.target_triple:find("darwin") then
		utils.merge_tables(config, platform_configs.darwin)
	end
end

return M
