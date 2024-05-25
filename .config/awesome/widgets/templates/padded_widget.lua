local beautiful = require("beautiful")
local wibox = require("wibox")

local rounded_rect = require("widgets.shapes.rounded_rect")

local function padded_widget(args)
  local widgets = args.widgets or {}
  local layout_type = args.layout_type or wibox.layout.fixed.horizontal

  local widget_layout = {
    layout = layout_type,
  }

  for _, widget in ipairs(widgets) do
    table.insert(widget_layout, widget)
  end

  return wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.background_color,
    shape = rounded_rect,
    {
      widget = wibox.container.margin,
      left = beautiful.widget_padding,
      right = beautiful.widget_padding,
      widget_layout,
    }
  }
end

return padded_widget
