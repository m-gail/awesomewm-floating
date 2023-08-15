local awful = require("awful")
local beautiful = require("beautiful")

local function custom_titlewidget(c)
    local titlewidget = awful.titlebar.widget.titlewidget(c)
    titlewidget.font = beautiful.titlebar_font
    return titlewidget
end

return custom_titlewidget
