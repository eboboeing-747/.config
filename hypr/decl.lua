require("parser.parser")

local decl = {
    terminal = "kitty",
    browser = "firefox-developer-edition",
    launcher = "wofi",
    lockscreen = "hyprlock",
    idledaemon = "hypridle",
    statusbar = "waybar",
    wputil = "hyprpaper",
    ncdaemon = "swaync",
}

local parser = Parser:new(".config/hypr/colors.conf")
local result = parser:parse()

if not result.success then
    for _, message in pairs(result.errors) do
        hl.notification.create({
            text = message,
            timeout = 10000,
            icon = 'error',
            font_size = 16,
        })
    end

    return decl
end

local values = result.values
decl.border_active = values.border_active
decl.border_inactive = values.border_inactive
decl.shadow = values.shadow

return decl

