local wezterm = require("wezterm")
local keymaps = require("keymaps")
local hyperlink = require("hyperlink-rule")

local config = wezterm.config_builder()

config = {
	-- check app update
	-- check_for_updates = true,
	-- default check update every 24Hrs
	-- check_for_updates_interval_seconds = 86400,

	-- color_scheme = "Catppuccin Mocha",
	color_scheme = "tokyonight",
	font = wezterm.font("JetBrains Mono", { weight = "Regular" }),
	font_size = 12.5,
	-- remove glyphs warning log
	warn_about_missing_glyphs = false,

	automatically_reload_config = true,
	-- enable_tab_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,

	default_cursor_style = "BlinkingBar",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 700,

	initial_cols = 110,
	initial_rows = 36,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},

	-- regular express rule
	hyperlink_rules = hyperlink.hyperlink_rule,
	quick_select_patterns = hyperlink.quick_select_patterns,

	-- key binding
	-- disable_default_key_bindings = false,
	keys = keymaps.keys,
	mouse_bindings = keymaps.mouse_bindings,
}

return config
