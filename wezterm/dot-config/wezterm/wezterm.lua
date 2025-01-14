local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- utils

-- equivalent to POSIX basename(3)
-- given "/foo/bar" returns "bar"
local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

-- defaults
config.color_scheme = "GruvboxDark"
config.default_cursor_style = "SteadyBar"
config.font = wezterm.font("Monaspace Neon")
config.window_close_confirmation = "AlwaysPrompt"
config.window_decorations = "RESIZE"

-- tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 40

config.colors = {
	tab_bar = {
		background = "#1d2021",

		active_tab = {
			bg_color = "#282828",
			fg_color = "#ebdbb2",
		},

		inactive_tab = {
			bg_color = "#1d2021",
			fg_color = "#a89984",
		},
	},
}

wezterm.on("update-right-status", function(window)
	local status = window:active_workspace()

	if window:active_key_table() then
		status = window:active_key_table()
	end

	if window:leader_is_active() then
		status = "<leader>"
	end

	window:set_right_status(wezterm.format({ { Text = status .. " " } }))
end)

-- keys
config.leader = { key = " ", mods = "CTRL" }

-- use same keybinds for switching pane in wezterm and helix
local function activate_pane_direction(window, pane, direction)
	local process = pane:get_foreground_process_name()

	-- sometimes the foreground process is null (e.g. when output is piped to a pager)
	if process and basename(pane:get_foreground_process_name()) == "hx" then
		window:perform_action(act.SendKey({ key = direction .. "Arrow", mods = "ALT" }), pane)
	else
		window:perform_action(act.ActivatePaneDirection(direction), pane)
	end
end

config.keys = {
	{
		key = "LeftArrow",
		mods = "ALT",
		action = wezterm.action_callback(function(window, pane)
			activate_pane_direction(window, pane, "Left")
		end),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = wezterm.action_callback(function(window, pane)
			activate_pane_direction(window, pane, "Right")
		end),
	},
	{
		key = "UpArrow",
		mods = "ALT",
		action = wezterm.action_callback(function(window, pane)
			activate_pane_direction(window, pane, "Up")
		end),
	},
	{
		key = "DownArrow",
		mods = "ALT",
		action = wezterm.action_callback(function(window, pane)
			activate_pane_direction(window, pane, "Down")
		end),
	},
	-- forced pane switching with shift for when one pane is helix and the other isn't
	{
		key = "LeftArrow",
		mods = "ALT|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{ key = "t", mods = "LEADER", action = act.ActivateKeyTable({ name = "tab", one_shot = false }) },
	{ key = "p", mods = "LEADER", action = act.ActivateKeyTable({ name = "pane" }) },
	{ key = "w", mods = "LEADER", action = act.ActivateKeyTable({ name = "workspace" }) },
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
}

for i = 1, 9 do
	table.insert(config.keys, { key = tostring(i), mods = "ALT", action = act.ActivateTab(i - 1) })
end

config.key_tables = {
	tab = {
		{ key = "n", action = act.Multiple({ act.SpawnTab("CurrentPaneDomain"), act.PopKeyTable }) },
		{ key = "q", action = act.Multiple({ act.CloseCurrentTab({ confirm = false }), act.PopKeyTable }) },
		{ key = "LeftArrow", action = act.ActivateTabRelative(-1) },
		{ key = "RightArrow", action = act.ActivateTabRelative(1) },
		{ key = "LeftArrow", mods = "SHIFT", action = act.MoveTabRelative(-1) },
		{ key = "RightArrow", mods = "SHIFT", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = act.PopKeyTable },
		{ key = "Enter", action = act.PopKeyTable },
	},
	pane = {
		{ key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "q", action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "f", action = act.TogglePaneZoomState },
	},
	workspace = {
		{ key = "n", action = act.SwitchToWorkspace({ spawn = { cwd = "~" } }) },
		{ key = "s", action = act.ShowLauncherArgs({ flags = "WORKSPACES|FUZZY" }) },
		{
			key = "r",
			action = act.PromptInputLine({
				description = wezterm.format({ { Text = "Renaming workspace title..." } }),
				action = wezterm.action_callback(function(_, _, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
						wezterm.emit("update-right-status")
					end
				end),
			}),
		},
	},
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "LeftArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "RightArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "UpArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "DownArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- platforms
if wezterm.target_triple:find("darwin") then
	config.font_size = 14.0
end

return config
