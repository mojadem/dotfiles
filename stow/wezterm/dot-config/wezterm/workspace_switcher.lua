local wezterm = require("wezterm")
local act = wezterm.action

local utils = require("utils")

local function switch_workspace(window, pane, id, label)
	if not id and not label then
		return
	end

	wezterm.log_info(utils.basename(label))

	if string.find(label, "workspace") then
		window:perform_action(act.SwitchToWorkspace({ name = id }), pane)
	elseif string.find(label, "repo") then
		window:perform_action(
			act.SwitchToWorkspace({
				name = utils.basename(label),
				spawn = { cwd = id },
			}),
			pane
		)
	else
		wezterm.log_error("[workspace-switcher] bad label: " .. label)
	end
end

local function workspace_switcher(window, pane)
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
		wezterm.log_error("[Workspace Switcher] failed to run fd: " .. stderr)
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
			title = "Workspaces",
			action = wezterm.action_callback(switch_workspace),
			fuzzy = true,
			choices = choices,
		}),
		pane
	)
end

return workspace_switcher
