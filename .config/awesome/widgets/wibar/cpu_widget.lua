local icon_info_widget = require("widgets.templates.icon_info_widget")

local cpu_widget = icon_info_widget({
  icon = "",
  suffix = "% ",
  timeout = 1,
  command = [[sh -c "top -bn2 | grep Cpu | tail -n1 | sed -e 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print 100-$1}'"]],
})

return cpu_widget
