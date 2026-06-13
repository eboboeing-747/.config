hl.config({
    general = {
        border_size = 2,
        gaps_in = 5,
        gaps_out = 10,
        col = {
            active_border = {
                colors = { "rgba(f39f6bee)", "rgba(a87c65ee)" },
                angle = 270
            },
            inactive_border = "rgba(595959aa)"
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
            color = "rgba(1a1a1aee)"
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
