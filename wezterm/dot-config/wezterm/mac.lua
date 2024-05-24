local module = {}

function module.apply_to_config(config)
  config.font_size = 14.0

  config.unix_domains = {
    { name = 'unix' },
  }

  config.default_gui_startup_args = { 'connect', 'unix' }
end

return module
