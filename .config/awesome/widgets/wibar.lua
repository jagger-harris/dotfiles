local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local modkey = require("config.bindings").modkey

local padded_widget = require("widgets.templates.padded_widget")
local calendar_popup_widget = require("widgets.popups.calendar_popup_widget")

local systray_widget = require("widgets.wibar.systray_widget")
local cpu_widget = require("widgets.wibar.cpu_widget")
local memory_widget = require("widgets.wibar.memory_widget")
local temperature_widget = require("widgets.wibar.temperature_widget")
local update_widget = require("widgets.wibar.update_widget")
local volume_widget = require("widgets.wibar.volume_widget")

screen.connect_signal("request::desktop_decoration", function(s)
  -- Tags
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -- Layout widget
  s.mylayoutbox = awful.widget.layoutbox({
    screen = s,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(1)
      end),
    },
  })
  s.mylayoutbox = wibox.container.margin(s.mylayoutbox, beautiful.widget_margin, beautiful.widget_margin,
    beautiful.widget_margin, beautiful.widget_margin)

  -- Taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    style = {
      fg_urgent = beautiful.foreground_color_white,
      fg_empty = beautiful.foreground_color_dark,
      fg_occupied = beautiful.foreground_color,
      fg_focus = beautiful.foreground_color_light,
      bg_urgent = beautiful.transparent,
      bg_occupied = beautiful.transparent,
      bg_empty = beautiful.transparent,
      bg_focus = beautiful.transparent,
    },
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
  })

  -- Calendar widgets
  local calendar_widget = wibox.widget.textclock(" %a %b %d %Y")
  calendar_popup_widget({
    screen = s,
    attached_widget = calendar_widget
  })

  -- Create the wibar
  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    height = beautiful.bar_height,
    bg = beautiful.background_color_dark,
  })

  s.mywibox:setup(
    {
      widget = wibox.container.background,
      bg = beautiful.background_color_dark,
      {
        widget = wibox.container.margin,
        margins = {left = beautiful.widget_margin, top = beautiful.widget_margin, bottom = beautiful.widget_margin},
        {
          expand = "none",
          layout = wibox.layout.align.horizontal,
          { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.widget_margin,
            padded_widget({ widgets = { s.mytaglist } }),
            padded_widget({ widgets = { s.mylayoutbox } }),
          },
          { -- Middle widgets
            layout = wibox.layout.align.horizontal,
            padded_widget({ widgets = { wibox.widget.textclock(" %I:%M %p", 0.5) } }),
          },
          { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.widget_margin,
            padded_widget({ widgets = { temperature_widget, cpu_widget, memory_widget } }),
            update_widget,
            volume_widget({ screen = s }),
            systray_widget,
            padded_widget({ widgets = { calendar_widget } }),
          },
        }
      }
    })
end)
