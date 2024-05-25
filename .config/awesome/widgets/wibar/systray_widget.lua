local awful = require("awful")
local wibox = require("wibox")

local padded_widget = require("widgets.templates.padded_widget")

local function systray_widget()
  local systray = wibox.widget.systray()
  local starting_entries, _ = awesome.systray()
  local systray_container = awful.widget.only_on_screen({
    widget = padded_widget({
      widgets = { systray },
    }),
    screen = screen.primary,
  })

  -- Redraw wibox, fixes empty box if there are no entries
  systray_container.visible = starting_entries > 0

  -- Connect signal to handle layout changes
  systray:connect_signal("widget::layout_changed", function()
    local entries, _ = awesome.systray()
    systray_container.visible = entries > 0
  end)

  return systray_container
end

return wibox.widget {
  widget = systray_widget
}
