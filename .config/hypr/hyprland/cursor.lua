-- Cursor

hl.on("hyprland.start", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'phinger-cursors-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size '24'")
end)

hl.env("XCURSOR_THEME", "phinger-cursors-dark")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
