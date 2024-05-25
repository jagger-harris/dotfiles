local beautiful = require("beautiful")
local gears = require("gears")

local function rounded_rect(cr, width, height)
  gears.shape.rounded_rect(cr, width, height, beautiful.rounded_corners)
end

return rounded_rect
