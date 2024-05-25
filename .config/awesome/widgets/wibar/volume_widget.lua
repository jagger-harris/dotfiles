local awful = require("awful")

local padded_widget = require("widgets.templates.padded_widget")
local icon_info_widget = require("widgets.templates.icon_info_widget")

local volume_popup_widget = require("widgets.popups.volume_popup_widget")

local function volume_widget(args)
  local screen = args.screen or screen(0)
  local get_volume_command =
  [[sh -c "pactl get-sink-volume $(pactl info | grep 'Default Sink' | awk '{print $3}') | awk '{print $5}' | cut -d '%' -f1"]]

  local volume_text_widget = padded_widget({
    widgets = { icon_info_widget({
      icon = "",
      suffix = "%",
      timeout = 0.1,
      command = get_volume_command,
    }) }
  })

  volume_popup_widget({
    attached_widget = volume_text_widget,
    screen = screen,
    command = get_volume_command,
  })

  return volume_text_widget
end

return volume_widget
