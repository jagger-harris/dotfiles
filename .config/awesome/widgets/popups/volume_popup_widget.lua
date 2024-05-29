local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local rounded_rect = require("widgets.shapes.rounded_rect")

local function volume_popup_widget(args)
  local attached_widget = args.attached_widget or nil
  local screen = args.screen

  local volume_slider_widget = wibox.widget.slider {
    handle_shape = rounded_rect,
    handle_color = beautiful.foreground_color_light,
    bar_shape = gears.shape.rounded_rect,
    bar_height = dpi(4),
    bar_color = beautiful.foreground_color_dark,
    bar_active_color = beautiful.foreground_color,
  }

  -- Set slider value
  awful.spawn.easy_async([[sh -c "sleep 1; amixer get Master | grep -oE '[0-9]{1,3}%' | head -n1"]], function(stdout)
    local volume = stdout:gsub("%%", "")

    volume_slider_widget.value = tonumber(volume)
  end)

  volume_slider_widget:connect_signal("property::value", function(_, new_value)
    awful.spawn.easy_async("amixer sset Master " .. new_value .. "%")
  end)

  local volume_widget = wibox.widget {
    widget = wibox.container.background,
    forced_height = dpi(28),
    forced_width = dpi(256),
    border_width = beautiful.border_width,
    border_color = beautiful.border_color,
    bg = beautiful.background_color_dark,
    wibox.widget {
      widget = wibox.container.margin,
      margins = beautiful.widget_margin,
      wibox.widget {
        widget = volume_slider_widget
      }
    },
  }

  local popup = awful.popup {
    widget = volume_widget,
    screen = screen,
    visible = false,
    ontop = true,
  }

  local hide_timer = gears.timer {
    timeout = 0.5,
    autostart = false,
    single_shot = true,
    callback = function()
      popup.visible = false
    end
  }

  popup:connect_signal("mouse::enter", function()
    popup.visible = true
    hide_timer:stop()
  end)

  popup:connect_signal("mouse::leave", function()
    hide_timer:start()
  end)

  if attached_widget then
    popup:bind_to_widget(attached_widget)

    attached_widget:connect_signal("mouse::leave", function()
      hide_timer:start()
    end)
  end

  return popup
end

return volume_popup_widget
