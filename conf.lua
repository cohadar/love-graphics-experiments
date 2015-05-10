--- @module conf
local conf = {}

local rgb = require "rgb"

-- 13 • 73
-- 1920×1080

conf.SCREEN_WIDTH = 240 * 13--150
conf.SCREEN_HEIGHT = 16 * 949 / 13
conf.SCALE_GRAPHICS = 1.0 

-------------------------------------------------------------------------------
function love.conf(t)
    t.window.width = conf.SCREEN_WIDTH -- t.screen.width in 0.8.0 and earlier
    t.window.height = conf.SCREEN_HEIGHT -- t.screen.height in 0.8.0 and earlier
end

-------------------------------------------------------------------------------
return conf