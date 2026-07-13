--   _____                              _   _____ _____
--  |_   _|                            | | |  _  /  ___|
--    | | ___ _ __ ___  _ __   ___  ___| |_| | | \ `--.
--    | |/ _ \ '_ ` _ \| '_ \ / _ \/ __| __| | | |`--. \
--    | |  __/ | | | | | |_) |  __/\__ \ |_\ \_/ /\__/ /
--    \_/\___|_| |_| |_| .__/ \___||___/\__|\___/\____/
--                     | |
--                     |_|
--
-- Neovim config

-- Faster loading times
vim.loader.enable()

require("config.options")
require("config.lsp")
require("config.lazy")
