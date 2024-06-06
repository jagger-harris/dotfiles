local padded_widget = require("widgets.templates.padded_widget")
local icon_info_widget = require("widgets.templates.icon_info_widget")

local function volume_widget(args)
  local command = [[sh -c "amixer get Master | grep -oE '[0-9]{1,3}%' | head -n1"]]

  return padded_widget({
    widgets = { icon_info_widget({
      icon = "",
      suffix = "%",
      timeout = 0.1,
      command = command,
    }) }
  })
end

return volume_widget
