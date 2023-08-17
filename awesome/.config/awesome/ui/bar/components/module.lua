local wibox = require("wibox")
local beautiful = require("beautiful")
local colors = require("config.colors")
local gears = require("gears")

local function create_module(child, icon, icon_color, buttons, forced_icon_width)
    local content = {
        layout = wibox.layout.fixed.horizontal,
    }

    if icon ~= nil then
        local textbox = wibox.widget.textbox(icon)
        textbox.forced_width = forced_icon_width
        table.insert(content, {
            layout = wibox.widget.background,
            fg = icon_color,
            textbox
        })
    end
    table.insert(content, child)

    return {
        layout = wibox.container.margin,
        margins = beautiful.module_outer_margin,
        buttons = buttons,
        {
            layout = wibox.container.background,
            bg = colors.surface,
            fg = colors.text,
            shape = gears.shape.rounded_rect,
            {
                layout = wibox.container.margin,
                left = beautiful.module_inner_margin,
                right = beautiful.module_inner_margin,
                content
            }
        }
    }
end

return create_module
