local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Storm"
-- config.color_scheme = "Catppuccin Macchiato"
-- config.font_size = 16.0
-- config.line_height = 1.16
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.enable_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
