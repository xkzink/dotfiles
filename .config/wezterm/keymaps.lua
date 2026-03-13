local wezterm = require("wezterm")
local act = wezterm.action

return {
	keys = {
		-- disable
		-- mac window hide/minimize
		{ key = "m", mods = "SUPER", action = act.DisableDefaultAssignment },
		{ key = "h", mods = "SUPER", action = act.DisableDefaultAssignment },
		-- IncreaseFontSize
		{ key = [[=]], mods = "SUPER", action = act.DisableDefaultAssignment },

		-- window split
		{ key = "d", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "SUPER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = [[-]], mods = "SUPER", action = act.CloseCurrentPane({ confirm = true }) },

		-- panes: zoom+close pane
		{ key = "z", mods = "SUPER|CTRL", action = act.TogglePaneZoomState },
		{ key = "w", mods = "SUPER", action = act.CloseCurrentPane({ confirm = false }) },

		-- panes: navigation
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

		-- panes: resize
		{ key = "UpArrow", mods = "SUPER|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", mods = "SUPER|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "LeftArrow", mods = "SUPER|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "SUPER|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },

		-- fonts: resize
		{ key = "UpArrow", mods = "SUPER", action = act.IncreaseFontSize },
		{ key = "DownArrow", mods = "SUPER", action = act.DecreaseFontSize },
		{ key = "r", mods = "SUPER", action = act.ResetFontSize },

		-- arrow key, \x1b is the escape key
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = act({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = act({ SendString = "\x1bf" }) },
		-- Make CMD-Left equivalent to CTRL-a; move cursor to the start of cmd line
		{ key = "LeftArrow", mods = "SUPER", action = act({ SendString = "\x01" }) },
		-- Make CMD-Right equivalent to CTRL-e; move cursor to the end of cmd line
		{ key = "RightArrow", mods = "SUPER", action = act({ SendString = "\x05" }) },
		-- Make CMD-Delete quivalent to CTRL-u; clear line
		{ key = "Backspace", mods = "SUPER", action = act.SendKey({ key = "u", mods = "CTRL" }) },
	},

	mouse_bindings = {
		-- Disable the default click behavior
		-- {
		-- 	event = { Up = { streak = 1, button = "Left" } },
		-- 	mods = "NONE",
		-- 	action = wezterm.action.DisableDefaultAssignment,
		-- },
		-- Copy on Selction, chaning the default click behavior
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = wezterm.action({ CompleteSelection = "Clipboard" }),
			-- NOTE: the default action is:
			-- action=wezterm.action{CompleteSelectionOrOpenLinkAtMouseCursor="PrimarySelection"},
		},
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "SUPER",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
		-- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
		{
			event = { Down = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.Nop,
		},
	},
}
