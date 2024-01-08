local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font'

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.default_cursor_style = 'SteadyBar'

-- config.enable_tab_bar = false

config.window_decorations = 'RESIZE'

config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '1cell',
}

return config
