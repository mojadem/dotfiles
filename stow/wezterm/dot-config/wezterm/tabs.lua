local wezterm = require("wezterm")

local utils = require("utils")

local M = {}

wezterm.on("format-tab-title", function(tab)
	local i = tab.tab_index + 1
	local pane = tab.active_pane

	local title = pane.title

	local cwd = pane.user_vars.cwd
	if cwd and #cwd > 0 then
		title = utils.basename(cwd) .. "/"
	end

	local command = pane.user_vars.command
	if command and #command > 0 then
		title = command:match("^%S+")
	end

	return {
		{ Text = " " .. i .. ":" .. title },
	}
end)

function M.apply_to_config(config)
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.tab_max_width = 40

	config.colors = {
		tab_bar = {
			background = "#282828",

			active_tab = {
				bg_color = "#282828",
				fg_color = "#ebdbb2",
			},

			inactive_tab = {
				bg_color = "#282828",
				fg_color = "#a89984",
			},
		},
	}
end

return M
