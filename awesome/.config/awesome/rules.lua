local awful = require("awful")
local beautiful = require("beautiful")

local clientkeys = require("keys.client.keys")
local clientbuttons = require("keys.client.buttons")

awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen + awful.placement.centered,
            titlebars_enabled = true,
            floating = true
        }
    },
}

