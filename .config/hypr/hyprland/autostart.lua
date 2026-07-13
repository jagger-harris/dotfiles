-- Autostart

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- nm-applet")
    hl.exec_cmd("uwsm app -- blueman-applet")
    hl.exec_cmd("uwsm app -- waybar")
    hl.exec_cmd("uwsm app -- hyprpaper")
    hl.exec_cmd("uwsm app -- hypridle")
    hl.exec_cmd("uwsm app -- dunst")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
