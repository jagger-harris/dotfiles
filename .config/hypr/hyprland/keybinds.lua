-- Keybinds

local mod = "SUPER"

local terminal = "alacritty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local browser = "firefox"

hl.bind(mod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mod .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + V", hl.dsp.window.float({action = "toggle"}))

hl.bind(mod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region -z"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("hyprshot -m active -m output -z"))

local smw = hl.plugin.split_monitor_workspaces

for i = 1, 9 do
    local key = tostring(i)
    hl.bind(mod .. " + " .. key, function() return smw.workspace(i) end)
    hl.bind(mod .. " + SHIFT + " .. key, function() return smw.move_to_workspace_silent(i) end)
end

-- Scroll through using mouse
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
