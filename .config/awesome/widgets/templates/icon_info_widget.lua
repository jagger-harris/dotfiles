local awful = require("awful")
local wibox = require("wibox")

local function icon_info_widget(args)
  local icon = args.icon or ""
  local suffix = args.suffix or ""
  local timeout = args.timeout or 0
  local command = args.command or ""

  local text_widget = wibox.widget {
    widget = wibox.widget.textbox,
    text = icon .. " 0" .. suffix,
    align = "center",
  }

  local function update_widget(stdout)
    local info = stdout or 0

    text_widget.text = icon .. " " .. math.floor(info) .. suffix
  end

  -- Update widget at the beginning of load
  awful.spawn.easy_async(command, function(stdout)
    update_widget(stdout)
  end)

  awful.widget.watch(command, timeout, function(_, stdout, _, _, _)
    update_widget(stdout)
  end)

  return text_widget
end

return icon_info_widget
