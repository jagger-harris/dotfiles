local icon_info_widget = require("widgets.templates.icon_info_widget")

local temperature_widget = icon_info_widget({
  icon = "",
  suffix = "°C ",
  timeout = 1,
  command = [[sh -c "sensors | grep 'CPU Temperature' | awk '{print $3}' | tr -d '+°C'"]],
})

return temperature_widget
