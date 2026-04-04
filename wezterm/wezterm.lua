local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder and wezterm.config_builder() or {}

----------------------------------------------------
-- OS 判定
----------------------------------------------------
local target = wezterm.target_triple or ""

local function is_windows()
	return target:find("windows") ~= nil
end

----------------------------------------------------
-- General
----------------------------------------------------
config.automatically_reload_config = true
config.use_ime = true
config.xim_im_name = "fcitx"
config.ime_preedit_rendering = "Builtin"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16
config.color_scheme = "Kanagawa (Gogh)"

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.window_background_opacity = 0.85

----------------------------------------------------
-- Tab / Window decorations
----------------------------------------------------
config.enable_tab_bar = true
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.window_background_gradient = { colors = { "#000000" } }

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

----------------------------------------------------
-- Tab title custom
----------------------------------------------------
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

----------------------------------------------------
-- Windows only
----------------------------------------------------
if is_windows() then
	config.default_domain = "WSL:Ubuntu"
	config.default_cwd = "~"
end

----------------------------------------------------
-- Keybinds
----------------------------------------------------
config.keys = {
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "t", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },
}

return config
