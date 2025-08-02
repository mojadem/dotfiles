local wezterm = require("wezterm")

local M = {}

wezterm.on("format-tab-title", function(tab)
	local i = tab.tab_index + 1
	local title = tab.active_pane.title

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
