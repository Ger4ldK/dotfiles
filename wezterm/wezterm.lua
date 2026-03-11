local wt = require 'wezterm'
local homeDir = os.getenv("HOME")
local colorPath = homeDir .. "/.config/wezterm/colors/colors-wezterm.toml"

return {
    font = wt.font('FiraCode Nerd Font Mono', { weight = 'Regular' }),
    font_size = 12,
    animation_fps = 144,
    enable_tab_bar = false,
    cursor_blink_rate = 500,
	default_cursor_style = "BlinkingBlock",
    adjust_window_size_when_changing_font_size = true,
    initial_cols = 100,
    initial_rows = 40,
    window_padding = {
        left = "1.5cell",
        right = "1.5cell",
        top = "0.5cell",
        bottom = "0.5cell",
    },
    colors = wt.color.load_scheme(colorPath),
}

