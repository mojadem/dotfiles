local module = {}

function module.apply_to_config(config)
  config.default_domain = 'WSL:Arch'
end

return module
