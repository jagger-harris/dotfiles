-- Awesome libraries
local awful = require("awful")
local ruled = require("ruled")

-- Client rules
ruled.client.connect_signal("request::rules", function()
  ruled.client.append_rule({
    id = "global",
    rule = {},
    properties = {
      titlebars_enabled = false,
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  })

  ruled.client.append_rule({
    id = "floating",
    rule = {},
    properties = {
      placement = awful.placement.centered,
    }
  })

  ruled.client.append_rule({
    id = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick", "Kruler",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer",
      },
      name = { "Event Tester" },
      role = { "AlarmWindow", "ConfigManager", "pop-up" },
    },
    properties = { floating = true },
  })
end)
