local awful = require("awful")
local gears = require("gears")
local apps = require("config.apps")

return gears.table.join(
    awful.key(
        { modkey }, "Return",
        function() awful.spawn(apps.terminal) end,
        {
            description = "open a terminal",
            group = "launcher"
        }
    ),

    awful.key(
        { modkey, "Shift" }, "q",
        function() awful.spawn.with_shell(apps.lockscreen) end,
        {
            description = "lock the screen" .. apps.lockscreen,
            group = "launcher"
        }
    ),

    awful.key(
        { modkey }, "r",
        function() awful.spawn.with_shell(apps.launcher) end,
        {
            description = "run prompt",
            group = "launcher"
        }
    )
)
