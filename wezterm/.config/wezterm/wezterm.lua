local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'Hack'

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.default_cursor_style = "SteadyBar"

-- config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_padding = {
	left = '3cell',
	right = '3cell',
	top = '1.5cell',
	bottom = '1.5cell',
}

return config
