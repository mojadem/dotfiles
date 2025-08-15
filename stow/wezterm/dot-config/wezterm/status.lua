local wezterm = require("wezterm")

local function format_status(strings)
	local valid_strings = {}
	for _, s in ipairs(strings) do
		if #s > 0 then
			table.insert(valid_strings, s)
		end
	end

	return table.concat(valid_strings, " ")
end

wezterm.on("update-status", function(window, pane)
	local key_table = window:active_key_table() or ""
	key_table = window:leader_is_active() and "leader" or key_table

	local title = pane:get_title()

	local cwd = pane:get_user_vars().cwd or ""
	cwd = cwd:gsub(os.getenv("HOME") or "", "~")

	local workspace = window:active_workspace()

	window:set_right_status(wezterm.format({
		{ Text = format_status({ key_table, title, cwd }) .. " " },
		"ResetAttributes",
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = "#a89984" } },
		{ Foreground = { Color = "#282828" } },
		{ Text = " " .. workspace .. " " },
	}))
end)
