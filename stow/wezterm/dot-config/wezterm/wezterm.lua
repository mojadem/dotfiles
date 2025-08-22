local wezterm = require("wezterm")

local hosts = require("hosts")
local keys = require("keys")
local platforms = require("platforms")
local tabs = require("tabs")

require("status")

local config = wezterm.config_builder()

config.color_scheme = "GruvboxDark"
config.default_cursor_style = "SteadyBar"
config.font = wezterm.font("Monaspace Neon")
config.quick_select_alphabet = "arstneioqwfpluyzxcdhgbvmjk"
config.window_decorations = "RESIZE"

config.unix_domains = {
	{
		name = "unix",
	},
}

keys.apply_to_config(config)
tabs.apply_to_config(config)

-- apply platform and host specific configurations last
platforms.apply_to_config(config)
hosts.apply_to_config(config)

return config
