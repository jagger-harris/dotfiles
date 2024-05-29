local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local rounded_rect = require("widgets.shapes.rounded_rect")

local function volume_popup_widget(args)
  local attached_widget = args.attached_widget
  local screen = args.screen
  local command = args.command

  local volume_slider_widget = wibox.widget.slider {
    handle_shape = rounded_rect,
    handle_color = beautiful.foreground_color_light,
    bar_shape = gears.shape.rounded_rect,
    bar_height = dpi(4),
    bar_color = beautiful.foreground_color_dark,
    bar_active_color = beautiful.foreground_color,
  }

  local function update_slider_value()
    awful.spawn.easy_async(command, function(stdout)
      local volume = stdout:gsub("%%", "")

      volume_slider_widget.value = tonumber(volume)
    end)
  end

  volume_slider_widget:connect_signal("property::value", function(_, new_value)
    awful.spawn.easy_async("amixer sset Master " .. new_value .. "%")
  end)

  local volume_widget = wibox.widget {
    widget = wibox.container.background,
    border_width = beautiful.border_width,
    border_color = beautiful.border_color,
    bg = beautiful.background_color_dark,
    forced_height = dpi(28),
    forced_width = dpi(256),
    wibox.widget {
      widget = wibox.container.margin,
      margins = beautiful.widget_padding,
      volume_slider_widget,
    }
  }

  local popup_widget = awful.popup {
    widget = volume_widget,
    screen = screen,
    visible = false,
    ontop = true,
    preferred_anchors = "middle",
  }

  local hide_timer = gears.timer {
    timeout = 0.25,
    autostart = false,
    single_shot = true,
    callback = function()
      popup_widget.visible = false
    end
  }

  local function show_popup()
    update_slider_value()
    popup_widget.visible = true
    hide_timer:stop()
  end

  local function hide_popup(delay)
    hide_timer.timeout = delay
    hide_timer:start()
  end

  popup_widget:connect_signal("mouse::enter", function()
    show_popup()
  end)

  popup_widget:connect_signal("mouse::leave", function()
    hide_popup(0.25)
  end)

  if attached_widget then
    attached_widget:connect_signal("mouse::enter", function()
      popup_widget:move_next_to(mouse.current_widget_geometry)
      show_popup()
    end)

    attached_widget:connect_signal("mouse::leave", function()
      hide_popup(0.5)
    end)
  end

  return popup_widget
end

return volume_popup_widget
