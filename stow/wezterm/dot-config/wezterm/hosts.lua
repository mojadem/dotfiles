local wezterm = require("wezterm")
local act = wezterm.action

local utils = require("utils")

local M = {}

local host_configs = {
	club = {
		font_size = 10,
	},
	diamond = {
		keys = {
			{
				key = "1",
				mods = "ALT|CTRL",
				action = act.SwitchToWorkspace({
					name = "webapp",
					spawn = {
						cwd = os.getenv("HOME") .. "/dev/khan/webapp",
					},
				}),
			},
			{
				key = "2",
				mods = "ALT|CTRL",
				action = act.SwitchToWorkspace({
					name = "frontend",
					spawn = {
						cwd = os.getenv("HOME") .. "/dev/khan/frontend",
					},
				}),
			},
		},
	},
}

function M.apply_to_config(config)
	-- trim trailing .local on mac
	local hostname = string.gsub(wezterm.hostname(), "%..*", "")

	if host_configs[hostname] == nil then
		return
	end

	utils.merge_tables(config, host_configs[hostname])
end

return M
