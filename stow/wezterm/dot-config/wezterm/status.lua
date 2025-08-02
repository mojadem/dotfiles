local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	local key_table = window:active_key_table() or ""
	key_table = window:leader_is_active() and "leader" or key_table
	local cwd = pane:get_user_vars().cwd or ""
	local workspace = window:active_workspace()

	window:set_right_status(wezterm.format({
		{ Text = key_table .. " " },
		{ Text = cwd .. " " },
		"ResetAttributes",
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = "#a89984" } },
		{ Foreground = { Color = "#282828" } },
		{ Text = " " .. workspace .. " " },
	}))
end)
