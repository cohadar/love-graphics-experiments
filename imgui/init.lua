--- @module imgui
local BASE = (...) .. '.'
assert( not BASE:match( '%.init%.$' ), "Invalid require path `"..(...).."' (drop the `.init')." )

-------------------------------------------------------------------------------
imgui = {}

local core       = require( BASE .. "core" )
imgui.button     = require( BASE .. "button" )
imgui.slider     = require( BASE .. "slider" )
imgui.textfield  = require( BASE .. "textfield" )
imgui.prepare    = core.prepare
imgui.finish     = core.finish
imgui.printState = core.printState
imgui.mousemoved = core.mousemoved
imgui.mousepressed  = core.mousepressed
imgui.mousereleased = core.mousereleased
imgui.keypressed    = core.keypressed
imgui.keyreleased   = core.keyreleased
imgui.textinput     = core.textinput

-------------------------------------------------------------------------------
imgui.init = function()
	love.keyboard.setKeyRepeat( true )
end

-------------------------------------------------------------------------------
return imgui
