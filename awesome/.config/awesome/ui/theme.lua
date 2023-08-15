local xresources = require("beautiful.xresources")
local filesystem = require("gears.filesystem")
local gears = require("gears")
local dpi = xresources.apply_dpi
local colors = require("config.colors")
local theme_dir = filesystem.get_themes_dir()
local gtable = require("gears.table")
local dofile = dofile
local protected_call = require("gears.protected_call")

local default_theme = protected_call(dofile, theme_dir .. "default/theme.lua")
local theme = {}

gtable.crush(theme, default_theme)

theme.wallpaper = "~/Pictures/Wallpapers/pexels-benjamin-farren-15180548.jpg"
theme.useless_gap = dpi(6)
theme.border_width = dpi(2)
theme.border_normal = colors.surface_alt
theme.border_focus = colors.yellow
theme.font = "JetBrains Mono Nerd Font 14"
theme.wibar_height = dpi(40)
theme.taglist_font = "JetBrains Mono Nerd Font 14"
theme.bg_systray = colors.surface
theme.systray_icon_spacing = dpi(8)
theme.module_outer_margin = dpi(6)
theme.module_inner_margin = dpi(12)

-- Hotkeys
theme.hotkeys_bg = colors.base
theme.hotkeys_border_color = colors.yellow
theme.hotkeys_font = "JetBrains Mono Nerd Font 12"
theme.hotkeys_description_font = "JetBrains Mono Nerd Font 12"
theme.hotkeys_group_margin = dpi(16)
theme.hotkeys_label_bg = colors.yellow
theme.hotkeys_label_fg = colors.text
theme.hotkeys_fg = colors.text
theme.hotkeys_modifiers_fg = colors.orange

-- Titlebar
theme.titlebar_fg_normal = colors.text
theme.titlebar_bg_normal = colors.base
theme.titlebar_fg = colors.text
theme.titlebar_bg = colors.base
theme.titlebar_gap = dpi(4)
theme.titlebar_size = dpi(28)
theme.titlebar_font = "JetBrains Mono Nerd Font 12"

-- Tasklist
theme.tasklist_font = "JetBrains Mono Nerd Font 12"
theme.tasklist_bg_normal = colors.surface
theme.tasklist_fg_normal = colors.text
theme.tasklist_bg_focus = colors.surface
theme.tasklist_fg_focus = colors.yellow
theme.tasklist_bg_minimize = colors.surface_alt
theme.tasklist_fg_minimize = colors.muted
theme.tasklist_spacing = dpi(8)
theme.tasklist_shape = gears.shape.rounded_rect
theme.tasklist_plain_task_name = true

-- Menu
theme.menu_font = "JetBrains Mono Nerd Font 12"
theme.menu_bg_normal = colors.base
theme.menu_border_color = colors.surface_alt
theme.menu_bg_focus = colors.surface
theme.menu_border_color = colors.surface_alt

-- Snap
theme.snap_border_width = dpi(6)
theme.snap_shape = gears.shape.rectangle
theme.snap_bg = colors.orange

-- Shortcuts
theme.shortcuts_spacing = dpi(6)
theme.shortcuts_margin = dpi(4)

return theme
