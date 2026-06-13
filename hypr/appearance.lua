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
