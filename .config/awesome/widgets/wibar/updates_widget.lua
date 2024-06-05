local padded_widget = require("widgets.templates.padded_widget")
local icon_info_widget = require("widgets.templates.icon_info_widget")

local updates_widget = padded_widget({
  widgets = { icon_info_widget({
    icon = "",
    timeout = 1,
    command = [[sh -c "checkupdates | wc -l"]],
  }) }
})

return updates_widget;
