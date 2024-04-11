local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- defaults
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.default_cursor_style = 'SteadyBar'
config.font = wezterm.font { family = 'Fira Code', scale = 1.2 }
config.window_close_confirmation = 'AlwaysPrompt'
config.window_decorations = 'RESIZE'

-- tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  return { { Attribute = { Intensity = 'Bold' } }, { Text = ' ' .. tab.tab_index .. ' ' } }
end)

wezterm.on('update-right-status', function(window, pane)
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
config.leader = { key = 'Space', mods = 'CMD|SHIFT' }

config.keys = {
  { key = 't', mods = 'LEADER', action = act.ActivateKeyTable { name = 'tab' } },
  { key = 'w', mods = 'LEADER', action = act.ActivateKeyTable { name = 'workspace' } },
}

config.key_tables = {
  tab = {
    { key = 'n', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 's', action = act.ShowTabNavigator },
    {
      key = 'r',
      action = act.PromptInputLine {
        description = wezterm.format { { Text = 'Renaming tab title...' } },
        action = wezterm.action_callback(function(window, pane, line)
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
    { key = 'd', action = act.SwitchToWorkspace { name = 'default' } },
    {
      key = 'r',
      action = act.PromptInputLine {
        description = wezterm.format { { Text = 'Renaming workspace title...' } },
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
            wezterm.emit 'update-right-status'
          end
        end),
      },
    },
  },
}

-- mux
config.unix_domains = {
  { name = 'unix' },
}

config.default_gui_startup_args = { 'connect', 'unix' }

return config
