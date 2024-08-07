local awful = require("awful")

-- Autofocusing
require("awful.autofocus")

client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

-- DWM keep master stack
client.connect_signal("manage", function(c)
	if not awesome.startup then
		awful.client.setslave(c)
	end
end)

--- Mouse sloppy focus ----
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

-- Disable minimized and maximized windows
client.connect_signal("property::minimized", function(c)
	c.minimized = false
end)

client.connect_signal("property::maximized", function(c)
	c.maximized = false
end)
