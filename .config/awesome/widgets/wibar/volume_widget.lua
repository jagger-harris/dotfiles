local padded_widget = require("widgets.templates.padded_widget")
local icon_info_widget = require("widgets.templates.icon_info_widget")

local volume_popup_widget = require("widgets.popups.volume_popup_widget")

local function volume_widget(args)
  local screen = args.screen or screen(0)

  local volume_text_widget = padded_widget({
    widgets = { icon_info_widget({
      icon = "",
      suffix = "%",
      timeout = 0.1,
      command = [[sh -c "amixer get Master | grep -oE '[0-9]{1,3}%' | head -n1"]],
    }) }
  })

  volume_popup_widget({
    attached_widget = volume_text_widget,
    screen = screen,
  })

  return volume_text_widget
end

return volume_widget
