local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- defaults
config.color_scheme = 'GruvboxDark'
config.default_cursor_style = 'SteadyBar'
config.font = wezterm.font 'Monaspace Neon'
config.harfbuzz_features = { 'calt', 'ss01', 'ss02', 'ss03', 'ss06', 'ss07', 'ss09', 'liga' }
config.window_close_confirmation = 'AlwaysPrompt'
config.window_decorations = 'RESIZE'

-- tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 40

config.colors = {
  tab_bar = {
    background = '#1d2021',

    active_tab = {
      bg_color = '#282828',
      fg_color = '#ebdbb2',
      intensity = 'Bold',
    },

    inactive_tab = {
      bg_color = '#1d2021',
      fg_color = '#a89984',
    },
  },
}

wezterm.on('update-right-status', function(window)
  local status = window:active_workspace()

  if window:active_key_table() then
    status = window:active_key_table()
  end

  if window:leader_is_active() then
    status = '<leader>'
  end

  window:set_right_status(wezterm.format { { Text = status .. ' ' } })
end)

-- keys
config.leader = { key = 'a', mods = 'CTRL' }

config.keys = {
  { key = 't', mods = 'LEADER', action = act.ActivateKeyTable { name = 'tab' } },
  { key = 'w', mods = 'LEADER', action = act.ActivateKeyTable { name = 'workspace' } },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false } },
  { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '|', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'f', mods = 'LEADER', action = act.TogglePaneZoomState },
  { key = 'q', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
  { key = 'p', mods = 'LEADER', action = act.PaneSelect },
  { key = 'LeftArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
}

for i = 1, 9 do
  table.insert(config.keys, { key = tostring(i), mods = 'SUPER', action = act.ActivateTab(i - 1) })
end

config.key_tables = {
  tab = {
    { key = 'n', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 's', action = act.ShowLauncherArgs { flags = 'TABS|FUZZY' } },
    {
      key = 'r',
      action = act.PromptInputLine {
        description = wezterm.format { { Text = 'Renaming tab title...' } },
        action = wezterm.action_callback(function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },
    { key = 'LeftArrow', action = act.MoveTabRelative(-1) },
    { key = 'RightArrow', action = act.MoveTabRelative(1) },
  },
  workspace = {
    { key = 'n', action = act.SwitchToWorkspace { spawn = { cwd = '~' } } },
    { key = 's', action = act.ShowLauncherArgs { flags = 'WORKSPACES|FUZZY' } },
    {
      key = 'r',
      action = act.PromptInputLine {
        description = wezterm.format { { Text = 'Renaming workspace title...' } },
        action = wezterm.action_callback(function(_, _, line)
          if line then
            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
            wezterm.emit 'update-right-status'
          end
        end),
      },
    },
  },
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'LeftArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'DownArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'UpArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'RightArrow', mods = 'SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter', action = 'PopKeyTable' },
  },
}

-- platforms
if wezterm.target_triple:find 'darwin' then
  local mac = require 'mac'
  mac.apply_to_config(config)
end

if wezterm.target_triple:find 'windows' then
  local windows = require 'windows'
  windows.apply_to_config(config)
end

return config
