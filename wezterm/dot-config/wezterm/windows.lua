local wezterm = require 'wezterm'
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
  for i = 1, 9 do
    table.insert(config.keys, { key = tostring(i), mods = 'ALT', action = act.ActivateTab(i - 1) })
  end
  config.default_domain = 'WSL:Arch'
end

return module
