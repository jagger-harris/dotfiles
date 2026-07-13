-- Appearance

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = {
            top = 2,
            bottom = 2,
            left = 4,
            right = 4,
        },
        border_size = 2,
        col = {
            active_border = { colors = {"rgb(b2ceee)"} },
            inactive_border = { colors = {"rgb(011627)"} },
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
    },
    decoration = {
        rounding = 4,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0x011627aa,
        },
        blur = {
            enabled = true,
            size = 2,
            passes = 1,
            vibrancy = 0.1696,
        }, 
    },
    animations = {
        enabled = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})

hl.config({
    master = {
        new_status = "slave",
        mfact = 0.5,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
