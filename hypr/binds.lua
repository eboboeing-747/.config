local decl = require("decl")
local float_factor = 0.6

-- miscellaneous
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd(decl.lockscreen))
hl.bind("SUPER + SHIFT + CTRL + M", function()
    hl.timer(
        function()
            hl.dispatch(hl.dsp.dpms({ action = "toggle" }))
        end,
        { timeout = 500, type = "oneshot" }
    )
end)
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SUPER + UP", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("SUPER + DOWN", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
-- TODO: -- bind = $mainMod, left, exec, brightnessctl s 10%-
-- TODO: -- bind = $mainMod, right, exec, brightnessctl s +10%
-- TODO: -- bindl = , switch:on:Lid Switch, exec, hyprlock

-- spawn new | kill
hl.bind("SUPER + C", hl.dsp.window.close("activewindow"))
hl.bind("SUPER + T", hl.dsp.exec_cmd(decl.terminal))
hl.bind("SUPER + I", hl.dsp.exec_cmd(decl.terminal, {
    float = true,
    size = { "window_w * " .. float_factor, "window_l * " .. float_factor },
    center = true
}))
hl.bind("SUPER + R", hl.dsp.exec_cmd(decl.launcher))
hl.bind("SUPER + B", hl.dsp.exec_cmd(decl.browser))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- manipulate window props
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + V", function()
    local window = hl.get_active_window()
    local monitor = hl.get_active_monitor()
    if window == nil or monitor == nil then return end

    hl.dispatch(hl.dsp.window.float({
        action = "toggle",
        window = window
    }))

    if window.floating then
        hl.dispatch(hl.dsp.window.center(window))
        hl.dispatch(hl.dsp.window.resize({
            x = monitor.width * float_factor,
            y = monitor.height * float_factor,
            window = window
        }))
    end
end)
hl.bind("SUPER + M", hl.dsp.focus({ monitor = "+1" }))
hl.bind("SUPER + P", hl.dsp.window.pin())

-- manipulate window (focus | location)
hl.bind("SUPER + Y", hl.dsp.window.cycle_next())

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind("SUPER + ALT + M", hl.dsp.window.move({ monitor = "+1" }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- manipulate workspace (focus | location)
hl.bind("SUPER + D", hl.dsp.focus({ workspace = "emptym" }))
hl.bind("SUPER + SHIFT + M", hl.dsp.workspace.move({ monitor = "+1" }))

hl.bind("SUPER + ALT + L", hl.dsp.focus({ workspace = "m+1", on_current_monitor = true }))
hl.bind("SUPER + ALT + H", hl.dsp.focus({ workspace = "m-1", on_current_monitor = true }))

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
