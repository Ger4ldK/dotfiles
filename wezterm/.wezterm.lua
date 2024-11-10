local wt = require 'wezterm'
local config = wt.config_builder()

config.color_scheme = 'Atelier Forest (base16)'
config.font = wt.font('FiraCode Nerd Font')
config.font_size = 15
config.freetype_load_flags = 'NO_HINTING'

return config
