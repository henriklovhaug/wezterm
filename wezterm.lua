-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Darcula (base16)"
config.color_scheme = 'Catppuccin Frappe'
-- config.color_scheme = 'Catppuccin Frappé (Gogh)'
-- config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'CGA'
-- config.color_scheme = 'GitHub Dark'

config.font = wezterm.font("Hack Nerd Font")

config.font_size = 14.0
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

return config
