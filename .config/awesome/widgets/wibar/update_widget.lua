local padded_widget = require("widgets.templates.padded_widget")
local icon_info_widget = require("widgets.templates.icon_info_widget")

local update_widget = padded_widget({
  widgets = { icon_info_widget({
    icon = "",
    timeout = 60,
    command = [[sh -c "checkupdates | wc -l"]],
  }) }
})

return update_widget;
