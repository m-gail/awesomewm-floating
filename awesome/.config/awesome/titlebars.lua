local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local custom_titlewidget = require("ui.titlewidget")

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, { size = beautiful.titlebar_size }):setup {
        { -- Left
            {
                awful.titlebar.widget.iconwidget(c),
                margins = beautiful.titlebar_gap,
                layout = wibox.container.margin,
            },
            custom_titlewidget(c),
            buttons = buttons,
            spacing = beautiful.titlebar_gap,
            layout  = wibox.layout.fixed.horizontal
        },
        {
            layout = wibox.layout.fixed.horizontal,
            buttons = buttons
        },
        { -- Right
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)
