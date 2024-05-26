--   _____                              _   _____ _____ 
--  |_   _|                            | | |  _  /  ___|
--    | | ___ _ __ ___  _ __   ___  ___| |_| | | \ `--. 
--    | |/ _ \ '_ ` _ \| '_ \ / _ \/ __| __| | | |`--. \
--    | |  __/ | | | | | |_) |  __/\__ \ |_\ \_/ /\__/ /
--    \_/\___|_| |_| |_| .__/ \___||___/\__|\___/\____/ 
--                     | |                              
--                     |_|                              
--                                                      
-- Blue Fury Theme
-- Wallpapers licensed under CC BY-SA 4.0
-- (https://creativecommons.org/licenses/by-sa/4.0/)

local dpi = require("beautiful.xresources").apply_dpi
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/blue_fury/"
local theme = {}

-- Font
theme.font = "JetBrainsMonoNL Nerd Font 12"

-- Wallpaper
theme.wallpaper = themes_path .. "wallpapers/blue_fury.png"

-- Theme colors
theme.foreground_color_white = "#ffffff"
theme.foreground_color_light = "#d6deeb"
theme.foreground_color = "#82aaff"
theme.foreground_color_dark = "#335e87"
theme.background_color_light = theme.foreground_color_dark
theme.background_color = "#0b2942"
theme.background_color_dark = "#011627"
theme.transparent = "#00000000"

-- General colors
theme.fg_normal = theme.foreground_color_light
theme.bg_normal = theme.background_color_dark

-- General
theme.bar_height = dpi(32)
theme.widget_margin = dpi(4)
theme.widget_padding = dpi(4)
theme.rounded_corners = dpi(4)
theme.useless_gap = dpi(4)

-- Border
theme.border_width = dpi(2)
theme.border_color_normal = theme.transparent
theme.border_color_active = theme.foreground_color_light

-- Notifications
theme.notification_fg = theme.foreground_color_light
theme.notification_bg = theme.background_color_dark
theme.notification_margin = dpi(4)

-- Layout icons
theme.layout_fairh = themes_path .. "layouts/fairhw.png"
theme.layout_fairv = themes_path .. "layouts/fairvw.png"
theme.layout_floating = themes_path .. "layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "layouts/magnifierw.png"
theme.layout_max = themes_path .. "layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "layouts/tileleftw.png"
theme.layout_tile = themes_path .. "layouts/tilew.png"
theme.layout_tiletop = themes_path .. "layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "layouts/cornersew.png"

-- Systray
theme.systray_icon_spacing = dpi(1)
theme.bg_systray = theme.background_color

-- Application icons
theme.icon_theme = nil

-- Useless menus (but required)
theme.menu_height = dpi(55)
theme.menu_width = dpi(100)

return theme
