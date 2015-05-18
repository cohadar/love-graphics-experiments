--- @module imgui
local BASE = (...) .. '.'
assert( not BASE:match( '%.init%.$' ), "Invalid require path `"..(...).."' (drop the `.init')." )

-------------------------------------------------------------------------------
imgui = {}

local core       = require( BASE .. "core" )
imgui.button     = require( BASE .. "button" )
imgui.slider     = require( BASE .. "slider" )
imgui.textfield  = require( BASE .. "textfield" )
imgui.luatable   = require( BASE .. "luatable" )
imgui.prepare    = core.prepare
imgui.finish     = core.finish
imgui.mousemoved = core.mousemoved
imgui.mousepressed  = core.mousepressed
imgui.mousereleased = core.mousereleased
imgui.keypressed    = core.keypressed
imgui.keyreleased   = core.keyreleased
imgui.textinput     = core.textinput

-------------------------------------------------------------------------------
function imgui.printState( x, y, w, h )
	-- if no table is specified it defaults to uistate
	return imgui.luatable( x, y, w, h )
end

-------------------------------------------------------------------------------
function imgui.init()
	love.keyboard.setKeyRepeat( true )
end

-------------------------------------------------------------------------------
return imgui
