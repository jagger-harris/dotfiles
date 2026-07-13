-- Plugins

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload")
end)

local smw = hl.plugin.split_monitor_workspaces
smw.monitor_priority({ "DP-1", "DP-2" })

hl.config({
    plugin = {
        split_monitor_workspaces = {
            count = 9,
            keep_focused = 1,
            enable_notifications = 0,
            enable_persistent_workspaces = 1,
            enable_wrapping = 1,
            link_monitors = 0,
        },
    },
})
