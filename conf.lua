--- @module conf
local conf = {}

local rgb = require "rgb"

-- 949 == 13 • 73
-- 949 == 2*13*14 +  3*13*15

conf.SCREEN_WIDTH = 800
conf.SCREEN_HEIGHT = 600
conf.SCALE_GRAPHICS = 4

-------------------------------------------------------------------------------
function love.conf(t)
    t.window.width = conf.SCREEN_WIDTH -- t.screen.width in 0.8.0 and earlier
    t.window.height = conf.SCREEN_HEIGHT -- t.screen.height in 0.8.0 and earlier
    t.window.resizable = true
end

-------------------------------------------------------------------------------
return conf