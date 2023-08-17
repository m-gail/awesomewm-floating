local colors = require("config.colors")

return {
    terminal = "kitty",
    launcher = "rofi -show drun",
    lockscreen = "i3lock -c '" .. colors.surface .. "'",
    powermenu = "eww open --toggle powermenu",
}
