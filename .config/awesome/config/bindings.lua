local awful = require("awful")
local apps = require("config.apps")
local hotkeys_popup = require("awful.hotkeys_popup")
local modkey = "Mod4"

-- Mouse bindings
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),
		awful.button({ modkey }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ modkey }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)

-- Global keybindings
awful.keyboard.append_global_keybindings({
	-- AwesomeWM specific
	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	-- Tags
	awful.key({ modkey }, "h", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "l", awful.tag.viewnext, { description = "view next", group = "tag" }),

	-- Clients
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, ",", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey }, ".", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	-- Applications
	awful.key({ modkey }, "Return", function()
		awful.spawn(apps.terminal, false)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey }, "f", function()
		awful.spawn(apps.filemanager, false)
	end, { description = "open a file manager", group = "launcher" }),
	awful.key({ modkey }, "b", function()
		awful.spawn(apps.browser, false)
	end, { description = "open a browser", group = "launcher" }),
	awful.key({ modkey }, "p", function()
		awful.spawn(apps.run, false)
	end, { description = "open run app", group = "launcher" }),

	-- Tag switching
	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey, "Control", "Shift" },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { modkey },
		keygroup = "numpad",
		description = "select layout directly",
		group = "layout",
		on_press = function(index)
			local t = awful.screen.focused().selected_tag
			if t then
				t.layout = t.layouts[index] or t.layout
			end
		end,
	}),
})

-- Client keybindings
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		-- AwesomeWM related
		awful.key({ modkey, "Shift" }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),

		-- Misc
		awful.key({ modkey, "Shift" }, ".", function()
			if client.focus then
				local current_screen = client.focus.screen
				local prev_screen = current_screen.index - 1

				if prev_screen < 2 then
					client.focus:move_to_screen(screen[1])
				end
			end
		end, { description = "move to next screen", group = "client" }),
		awful.key({ modkey, "Shift" }, ",", function()
			if client.focus then
				local current_screen = client.focus.screen
				local next_screen = current_screen.index + 1

				if next_screen <= screen:count() then
					client.focus:move_to_screen(screen[next_screen])
				end
			end
		end, { description = "move to previous screen", group = "client" }),
	})
end)

return {
	modkey = modkey
}
