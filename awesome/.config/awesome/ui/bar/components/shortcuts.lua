local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local create_module = require("ui.bar.components.module")

local function create_shortcut(icon, program)
    return wibox.widget {
        image = "/usr/share/icons/hicolor/128x128/apps/" .. icon .. ".png",
        widget = wibox.widget.imagebox,
        resize = true,
        buttons = gears.table.join(
            awful.button({}, 1, function() awful.spawn.with_shell(program) end)
        )
    }
end

local function create_shortcuts()
    return create_module(
        {
            {
                create_shortcut("firefox-esr", "firefox"),
                create_shortcut("org.xfce.thunar", "thunar"),
                create_shortcut("libreoffice-writer", "libreoffice --writer"),
                spacing = beautiful.shortcuts_spacing,
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.container.margin,
            margins = beautiful.shortcuts_margin,
        }
    )
end

return create_shortcuts
