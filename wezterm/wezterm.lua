local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide better error messages for configuration mistakes.
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Frappe"

-- config.font = wezterm.font_with_fallback({
-- 	"Berkeley Mono",
-- 	"nonicons",
-- })

config.font_size = 16.0
config.line_height = 1.28
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.audible_bell = "Disabled"
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
