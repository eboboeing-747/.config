hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.kill("activewindow"))

hl.bind("SUPER + ALT + L", hl.dsp.focus({ workspace = "m+1", on_current_monitor = true }))
hl.bind("SUPER + ALT + H", hl.dsp.focus({ workspace = "m-1", on_current_monitor = true }))

hl.bind("SUPER + M", hl.dsp.focus({ monitor = "+1" }))
hl.bind("SUPER + SHIFT + M", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind("SUPER + ALT + M", hl.dsp.window.move({ monitor = "+1" }))

hl.bind("SUPER + D", hl.dsp.focus({ workspace = "emptym" }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
