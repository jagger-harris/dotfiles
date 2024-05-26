local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local themes_path = os.getenv("HOME") .. "/.config/awesome/themes"

-- Init theme
beautiful.init(string.format("%s/blue_fury/theme.lua", themes_path))

-- Wallpaper
screen.connect_signal("request::wallpaper", function(s)
  awful.wallpaper({
    screen = s,
    widget = {
      {
        image = beautiful.wallpaper,
        upscale = true,
        downscale = true,
        widget = wibox.widget.imagebox,
      },
      valign = "center",
      halign = "center",
      tiled = false,
      widget = wibox.container.tile,
    },
  })
end)
