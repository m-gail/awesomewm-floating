local gears = require("gears")

local apps_keys = require("keys.global.apps")
local awesome_keys = require("keys.global.awesome")
local client_keys = require("keys.global.client")

root.keys(gears.table.join(
    apps_keys,
    awesome_keys,
    client_keys
))
