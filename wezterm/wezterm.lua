local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
	'JetBrainsMono Nerd Font',
	'nonicons',
}

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.audible_bell = "Disabled"
config.font_size = 16.0
config.adjust_window_size_when_changing_font_size = false
config.color_scheme = 'Catppuccin Frappe'
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.tab_bar_at_bottom = true

return config
