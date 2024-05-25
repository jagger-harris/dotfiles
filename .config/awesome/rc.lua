--   _____                              _   _____ _____ 
--  |_   _|                            | | |  _  /  ___|
--    | | ___ _ __ ___  _ __   ___  ___| |_| | | \ `--. 
--    | |/ _ \ '_ ` _ \| '_ \ / _ \/ __| __| | | |`--. \
--    | |  __/ | | | | | |_) |  __/\__ \ |_\ \_/ /\__/ /
--    \_/\___|_| |_| |_| .__/ \___||___/\__|\___/\____/ 
--                     | |                              
--                     |_|                              
--                                                      
-- AwesomeWM config
-- Last updated on 5/23/2024
-- Jagger Harris

-- Luarocks
pcall(require, "luarocks.loader")

-- Error handling
require("config.error_handling")

-- Clients
require("config.clients")

-- Theme
require("config.theme")

-- Layouts
require("config.layouts")

-- Wibar
require("widgets.wibar")

-- Mouse and keybindings
require("config.bindings")

-- Rules
require("config.rules")

-- Notifications
require("config.notifications")
