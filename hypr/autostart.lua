local decl = require("decl")

hl.on("hyprland.start", function ()
    hl.exec_cmd(decl.lockscreen)
    hl.exec_cmd(decl.idledaemon)
    hl.exec_cmd(decl.statusbar)
    hl.exec_cmd(decl.wputil)
    hl.exec_cmd(decl.ncdaemon)
end)
