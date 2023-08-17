local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local apps = require("config.apps")
local colors = require("config.colors")
local create_module = require("ui.bar.components.module")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local function create_powermenu()
    return create_module(
        wibox.widget.textbox(""),
        "󰤆",
        colors.yellow,
        gears.table.join(
            awful.button({}, 1, function() awful.spawn.with_shell(apps.powermenu) end, nil)
        ),
        dpi(14)
    )
end

return create_powermenu
