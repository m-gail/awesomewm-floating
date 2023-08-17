local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local colors = require("config.colors")

-- local battery = require('awesome-wm-widgets.battery-widget.battery') { enable_battery_warning = false }
local volume = require('awesome-wm-widgets.pactl-widget.volume') {
    widget_type = "horizontal_bar", tooltip = true,
    main_color = colors.text,
    mute_color = colors.muted,
    shape = "rounded_rect"
}
local date = wibox.widget.textclock("%d.%m.%Y")
local clock = wibox.widget.textclock("%H:%M")
local create_launcher = require("ui.bar.components.launcher")
local create_powermenu = require("ui.bar.components.powermenu")
local create_module = require("ui.bar.components.module")
local create_tasklist = require("ui.bar.components.tasklist")
local create_shortcuts = require("ui.bar.components.shortcuts")


awful.screen.connect_for_each_screen(function(s)
    s.systray = wibox.widget.systray()
    s.systray.visible = true
    create_tasklist(s)

    -- Create the wibox
    s.mywibox = awful.wibox({
        screen = s,
        width  = s.geometry.width,
        height = beautiful.wibar_height,
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.container.background,
        bg = colors.base,
        {
            layout = wibox.layout.align.horizontal,
            -- Left widgets
            {
                layout = wibox.container.constraint,
                strategy = "max",
                width = 1200,
                {
                    layout = wibox.layout.fixed.horizontal,
                    create_launcher(),
                    create_shortcuts(),
                    create_module(s.mytasklist),
                }
            },
            -- center widgets
            nil,
            -- Right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                create_module(s.systray),
                -- create_module(battery),
                create_module(volume, " ", colors.yellow),
                create_module(date, " ", colors.orange),
                create_module(clock, " ", colors.red),
                create_powermenu(),
            },
        }
    }
end)
