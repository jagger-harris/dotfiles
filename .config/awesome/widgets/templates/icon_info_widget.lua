local awful = require("awful")

local function icon_info_widget(args)
  local icon = args.icon or ""
  local suffix = args.suffix or ""
  local timeout = args.timeout or 0
  local round = args.round or false
  local command = args.command or ""

  local watch_widget = awful.widget.watch(command, timeout, function(widget, stdout)
    local info = stdout

    if round then
      info = math.floor(info + 0.5)
    end

    widget:set_text(icon .. " " .. tostring(info) .. suffix)
  end)

  return watch_widget
end

return icon_info_widget
