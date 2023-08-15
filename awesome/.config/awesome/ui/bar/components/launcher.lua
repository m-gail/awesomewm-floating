local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local apps = require("config.apps")
local colors = require("config.colors")
local create_module = require("ui.bar.components.module")

local function create_launcher()
    return create_module(
        wibox.widget.textbox("Start"),
        " ",
        colors.yellow,
        gears.table.join(
            awful.button({}, 1, function() awful.spawn.with_shell(apps.launcher) end, nil)
        )
    )
end

return create_launcher
