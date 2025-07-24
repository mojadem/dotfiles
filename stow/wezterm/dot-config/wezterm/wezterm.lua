local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox dark, medium (base16)"
config.font = wezterm.font("Monaspace Neon")
config.font_size = 14
config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

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

return config
