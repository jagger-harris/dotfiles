local icon_info_widget = require("widgets.templates.icon_info_widget")

local memory_widget = icon_info_widget({
  icon = "",
  suffix = "%",
  timeout = 1,
  round = true,
  command = [[sh -c "free | grep Mem | awk '{print int($3/$2 * 100)}'"]],
})

return memory_widget
