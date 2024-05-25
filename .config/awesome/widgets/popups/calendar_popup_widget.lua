local awful = require("awful")
local beautiful = require("beautiful")

local rounded_rect = require("widgets.shapes.rounded_rect")

local function calendar_popup_widget(args)
  local attached_widget = args.attached_widget or nil
  local screen = args.screen or awful.screen.focused();

  local calendar_popup = awful.widget.calendar_popup.month({
    start_sunday = true,
    long_weekdays = true,
    screen = screen,
    margin = beautiful.useless_gap * 2,
    style_month = {
      border_color = beautiful.border_color_active,
      bg_color = beautiful.background_color_dark,
      padding = beautiful.widget_padding,
      shape = rounded_rect
    },
    style_header = {
      bg_color = beautiful.background_color,
      border_width = 0,
      shape = rounded_rect,
    },
    style_weekday = {
      bg_color = beautiful.background_color,
      border_width = 0,
      shape = rounded_rect,
    },
    style_weeknumber = {
      bg_color = beautiful.background_color,
      border_width = 0,
      shape = rounded_rect,
    },
    style_normal = {
      bg_color = beautiful.background_color,
      border_width = 0,
      shape = rounded_rect,
    },
    style_focus = {
      bg_color = beautiful.background_color_light;
      border_width = 0,
      shape = rounded_rect,
    },
  })

  if attached_widget then
    calendar_popup:attach(attached_widget, "tr")
  end
end

return calendar_popup_widget
