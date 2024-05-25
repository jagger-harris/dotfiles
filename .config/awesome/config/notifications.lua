local awful = require("awful")
local naughty = require("naughty")
local ruled = require("ruled")
local beautiful = require("beautiful")

-- Rules
ruled.notification.connect_signal("request::rules", function()
  ruled.notification.append_rule({
    rule = {},
    properties = {
      margin = beautiful.widget_margin,
      border_width = beautiful.border_width,
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    },
  })
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box({ notification = n })
end)
