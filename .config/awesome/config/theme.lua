local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- Init theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

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
