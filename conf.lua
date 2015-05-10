--- @module conf
local conf = {}

conf.SCREEN_WIDTH = 400
conf.SCREEN_HEIGHT = 300
conf.SCALE_GRAPHICS = 1.0 

-------------------------------------------------------------------------------
function love.conf(t)
    t.window.width = conf.SCREEN_WIDTH -- t.screen.width in 0.8.0 and earlier
    t.window.height = conf.SCREEN_HEIGHT -- t.screen.height in 0.8.0 and earlier
end

-------------------------------------------------------------------------------
return conf