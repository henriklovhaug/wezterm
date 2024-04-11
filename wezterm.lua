-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

-- This is where you actually apply your config choices

-- local scheme = "Catppuccin Frappe"
local scheme = "Catppuccin Mocha"

config.color_scheme = scheme

config.font = wezterm.font("Hack Nerd Font Mono")

config.font_size = 14.0

config.audible_bell = "Disabled"

local act = wezterm.action

config.keys = {
	{
		key = ",",
		mods = "CMD",
		action = act.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				"/opt/homebrew/bin/nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
	{ key = "t", mods = "CMD|SHIFT", action = act.ShowTabNavigator },
	{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "D", mods = "CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "ø", mods = "CMD", action = act.TogglePaneZoomState },
	{ key = "a", mods = "CMD", action = act.TogglePaneZoomState },
	{ key = "s", mods = "CMD", action = act.PaneSelect },
}
-- and finally, return the configuration to wezterm

-- The art is a bit too bright and colorful to be useful as a backdrop
-- for text, so we're going to dim it down to 10% of its normal brightness
local dimmer = { brightness = 0.08 }

-- config.enable_scroll_bar = true
-- config.min_scroll_bar_height = "2cell"
-- config.colors = {
-- 	scrollbar_thumb = "white",
-- }
config.background = {
	-- This is the deepest/back-most layer. It will be rendered first
	{
		source = {
			-- File = "./Alien_Ship_bg_vert_images/Backgrounds/spaceship_bg_1.png",
			File = "/Users/henrik/.config/wezterm/20231107_0085-hdr.jpg",
		},
		-- The texture tiles vertically but not horizontally.
		-- When we repeat it, mirror it so that it appears "more seamless".
		-- An alternative to this is to set `width = "100%"` and have
		-- it stretch across the display
		width = "100%",
		-- repeat_x = "Mirror",
		hsb = dimmer,
	},
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.native_macos_fullscreen_mode = true

return config
