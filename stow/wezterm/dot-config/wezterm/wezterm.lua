local wezterm = require("wezterm")

local hosts = require("hosts")
local keys = require("keys")
local tabs = require("tabs")

require("status")

local config = wezterm.config_builder()

config.color_scheme = "GruvboxDark"
config.font = wezterm.font("Monaspace Neon")
config.font_size = 14
config.window_decorations = "RESIZE"

config.unix_domains = {
	{
		name = "unix",
	},
}

keys.apply_to_config(config)
tabs.apply_to_config(config)

-- apply host-specific configurations last
hosts.apply_to_config(config)

return config
