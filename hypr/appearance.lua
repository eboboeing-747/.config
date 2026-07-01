local decl = require("decl")

hl.config({
    general = {
        border_size = 2,
        gaps_in = 5,
        gaps_out = 10,
        col = {
            active_border = decl.border_active,
            inactive_border = decl.border_inactive,
        }
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 4,
            passes = 1,
            vibrancy = 0.1696
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = decl.shadow,
        }
    }
})

hl.curve("overshot", {
    type = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } }
})

hl.curve("smoothOut", {
    type = "bezier",
    points = { { 0.36, 0 }, { 0.66, -0.56 } }
})

hl.curve("smoothIn", {
    type = "bezier",
    points = { { 0.25, 1 }, { 0.5, 1 } }
})

local speed = 3

hl.animation({
    enabled = true,
    leaf = "windowsIn",
    speed = speed,
    bezier = "smoothIn",
    style = "gnomed"
})

hl.animation({
    enabled = true,
    leaf = "windowsOut",
    speed = speed,
    bezier = "smoothIn",
    style = "gnomed"
})

hl.animation({
    enabled = true,
    leaf = "windowsMove",
    speed = speed,
    bezier = "default"
})

hl.animation({
    enabled = true,
    leaf = "fade",
    speed = speed,
    bezier = "smoothIn"
})

hl.animation({
    enabled = false,
    leaf = "border",
    speed = speed,
    bezier = "default"
})

hl.animation({
    enabled = true,
    leaf = "fadeDim",
    speed = speed,
    bezier = "smoothIn"
})

hl.animation({
    enabled = true,
    leaf = "workspaces",
    speed = speed,
    bezier = "smoothIn",
    style = "slide"
})

hl.animation({
    enabled = true,
    leaf = "specialWorkspaceIn",
    speed = speed,
    bezier = "overshot",
    style = "slidevert"
})

hl.animation({
    enabled = true,
    leaf = "specialWorkspaceOut",
    speed = speed,
    bezier = "smoothIn",
    style = "slidevert"
})

hl.layer_rule({
    name = "statusbar",
    match = { initial_class = "waybar" },
    blur = true,
    ignore_alpha = 0
})

hl.layer_rule({
    name = "notification-center",
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0
})

hl.layer_rule({
    name = "notification-window",
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0
})

hl.window_rule({
    name = "pip",
    match = {
        initial_title = "^(Picture-in-Picture)$"
    },
    float = true,
    pin = true,
    move = { "monitor_w * 0.65", "monitor_h * 0.65" },
    size = { "monitor_w * 0.3", "monitor_h * 0.3" }
})
