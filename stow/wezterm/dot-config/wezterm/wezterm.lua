local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

config.color_scheme = "Gruvbox dark, medium (base16)"
config.font = wezterm.font("Monaspace Neon")
config.font_size = 14
config.window_decorations = "RESIZE"

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

-- use same keybinds for switching pane in wezterm and helix
local function activate_pane_direction(window, pane, direction)
	local process = pane:get_foreground_process_name()

	-- sometimes the foreground process is null (e.g. when output is piped to a pager)
	if process and basename(pane:get_foreground_process_name()) == "hx" then
		window:perform_action(
			act.SendKey({ key = direction .. "Arrow", mods = "ALT" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(direction), pane)
	end
end

config.leader = { key = " ", mods = "CTRL" }
config.keys = {
	{
		key = "w",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "window" }),
	},
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
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local success, stdout, stderr = wezterm.run_child_process({
				os.getenv("SHELL"),
				"-c",
				wezterm.shell_join_args({
					"fd",
					"--type",
					"directory",
					"--hidden",
					"--no-ignore",
					"--max-depth",
					"4",
					"--format",
					"{//}",
					"--glob",
					".git",
					os.getenv("HOME") .. "/dev",
				}),
			})

			if not success then
				wezterm.log_error(
					"[workspace-switcher] failed to run fd: " .. stderr
				)
				return
			end

			local choices = {}

			local workspaces = wezterm.mux.get_workspace_names()
			for _, workspace in ipairs(workspaces) do
				table.insert(
					choices,
					{ id = workspace, label = "workspace: " .. workspace }
				)
			end

			for repo in stdout:gmatch("([^\n]*)\n?") do
				table.insert(choices, { id = repo, label = "repo: " .. repo })
			end

			window:perform_action(
				act.InputSelector({
					action = wezterm.action_callback(
						function(window, pane, id, label)
							if not id and not label then
								return
							end

							if string.find(label, "workspace") then
								window:perform_action(
									act.SwitchToWorkspace({ name = id }),
									pane
								)
							elseif string.find(label, "repo") then
								window:perform_action(
									act.SwitchToWorkspace({
										name = basename(label),
										spawn = { cwd = id },
									}),
									pane
								)
							else
								wezterm.log_error(
									"[workspace-switcher] bad label: " .. label
								)
							end
						end
					),
					fuzzy = true,
					choices = choices,
					title = "Workspace Switcher",
				}),
				pane
			)
		end),
	},
}

config.key_tables = {
	window = {
		{
			key = "s",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "v",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
	},
}

for i = 1, 9 do
	table.insert(
		config.keys,
		{ key = tostring(i), mods = "ALT", action = act.ActivateTab(i - 1) }
	)
end

wezterm.on("format-tab-title", function(tab)
	local i = tab.tab_index + 1
	local title = tab.active_pane.title
	local process = title:match("^%S+")

	return {
		{ Text = " " .. i .. ":" .. process },
	}
end)

wezterm.on("update-right-status", function(window, pane)
	local key_table = window:active_key_table() or ""
	key_table = window:leader_is_active() and "leader" or key_table
	local title = pane:get_title()
	local workspace = window:active_workspace()

	window:set_right_status(wezterm.format({
		{ Text = key_table .. " " },
		{ Text = title .. " " },
		"ResetAttributes",
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = "#a89984" } },
		{ Foreground = { Color = "#282828" } },
		{ Text = " " .. workspace .. " " },
	}))
end)

config.unix_domains = {
	{
		name = "unix",
	},
}

return config
