--- @module imgui
local BASE = (...) .. '.'
assert( not BASE:match( '%.init%.$' ), "Invalid require path `"..(...).."' (drop the `.init')." )

-------------------------------------------------------------------------------
imgui = {}

local core       = require( BASE .. "core" )
imgui.button     = require( BASE .. "button" )
imgui.slider     = require( BASE .. "slider" )
imgui.prepare    = core.prepare
imgui.finish     = core.finish
imgui.printState = core.printState
imgui.mousemoved = core.mousemoved
imgui.mousepressed = core.mousepressed
imgui.mousereleased = core.mousereleased

-------------------------------------------------------------------------------
return imgui
