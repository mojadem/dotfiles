local wezterm = require("wezterm")
local act = wezterm.action

local utils = require("utils")
local workspace_switcher = require("workspace_switcher")

local M = {}

-- use same keybinds for switching pane in wezterm and helix
local function activate_pane_direction(window, pane, direction)
	local process = pane:get_foreground_process_name()

	-- sometimes the foreground process is null (e.g. when output is piped to a pager)
	if
		process
		and utils.basename(pane:get_foreground_process_name()) == "hx"
	then
		window:perform_action(
			act.SendKey({ key = direction .. "Arrow", mods = "ALT" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(direction), pane)
	end
end

function M.apply_to_config(config)
	config.leader = { key = " ", mods = "CTRL" }
	config.keys = {
		{
			key = "t",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "n",
			mods = "LEADER",
			action = act.SwitchToWorkspace({
				spawn = { cwd = "~" },
			}),
		},
		{
			key = "r",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Rename Workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(
							wezterm.mux.get_active_workspace(),
							line
						)
					end
				end),
			}),
		},
		{
			key = "f",
			mods = "LEADER",
			action = wezterm.action_callback(workspace_switcher),
		},
		{
			key = "i",
			mods = "LEADER",
			action = wezterm.action_callback(function(window, pane)
				wezterm.log_info(window)
				wezterm.log_info(pane)
				wezterm.log_info(pane:get_user_vars())
			end),
		},
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
			{
				key = "LeftArrow",
				action = act.Multiple({
					act.MoveTabRelative(-1),
					act.ActivateKeyTable({ name = "window" }),
				}),
			},
			{
				key = "RightArrow",
				action = act.Multiple({
					act.MoveTabRelative(1),
					act.ActivateKeyTable({ name = "window" }),
				}),
			},
		},
	}

	for i = 1, 9 do
		table.insert(
			config.keys,
			{ key = tostring(i), mods = "ALT", action = act.ActivateTab(i - 1) }
		)
	end
end

return M
