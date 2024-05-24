local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- defaults
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.default_cursor_style = 'SteadyBar'
config.font = wezterm.font 'Fira Code'
config.window_close_confirmation = 'AlwaysPrompt'
config.window_decorations = 'RESIZE'

-- tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

wezterm.on('format-tab-title', function(tab)
  return { { Attribute = { Intensity = 'Bold' } }, { Text = ' ' .. tab.tab_index + 1 .. ' ' } }
end)

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
  { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '/', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'f', mods = 'LEADER', action = act.TogglePaneZoomState },
  { key = 'q', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
  { key = 'p', mods = 'LEADER', action = act.PaneSelect },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false } },
}

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
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'H', mods = 'SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'J', mods = 'SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'K', mods = 'SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'L', mods = 'SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
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
