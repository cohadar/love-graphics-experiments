--- @module imgui
local BASE = (...) .. '.'
assert( not BASE:match( '%.init%.$' ), "Invalid require path `"..(...).."' (drop the `.init')." )

-------------------------------------------------------------------------------
imgui = {}

local core       = require( BASE .. "core" )
imgui.label      = require( BASE .. "label" )
imgui.button     = require( BASE .. "button" )
imgui.slider     = require( BASE .. "slider" )
imgui.textfield  = require( BASE .. "textfield" )
imgui.flattable  = require( BASE .. "flattable" )
imgui.dialog     = require( BASE .. "dialog" )
imgui.prepare    = core.prepare
imgui.finish     = core.finish
imgui.mousemoved = core.mousemoved
imgui.mousepressed  = core.mousepressed
imgui.mousereleased = core.mousereleased
imgui.keypressed    = core.keypressed
imgui.keyreleased   = core.keyreleased
imgui.textinput     = core.textinput

-------------------------------------------------------------------------------
function imgui.printState( rect )
	-- if no table is specified it defaults to uistate
	return imgui.flattable( rect )
end

-------------------------------------------------------------------------------
function imgui.init()
	love.keyboard.setKeyRepeat( true )
end

-------------------------------------------------------------------------------
return imgui
