local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

-- trim trailing .local on mac
local hostname = string.gsub(wezterm.hostname(), "%..*", "")

function M.apply_to_config(config)
	if hostname == "diamond" then
		local host_keys = {
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
		}

		for _, item in ipairs(host_keys) do
			table.insert(config.keys, item)
		end
	end
end

return M
