local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

local function create_tasklist(s)
    s.mytasklist = awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = tasklist_buttons,
        layout          = {
            spacing        = 10,
            spacing_widget = {
                {
                    forced_width = 5,
                    shape        = gears.shape.circle,
                    widget       = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            layout         = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 4,
                        widget  = wibox.container.margin,
                    },
                    {
                        id           = 'text_role',
                        widget       = wibox.widget.textbox,
                        forced_width = 80
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left   = 5,
                right  = 5,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }
end

return create_tasklist
