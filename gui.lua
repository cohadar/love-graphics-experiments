--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"
local font = require "font"


local value = 0
local buffer = "Default Text"

-------------------------------------------------------------------------------
function gui.draw()
	if imgui.button( 50, 50 ) then
		text.print( "a" )
	end
	if imgui.button( 120, 50 ) then
		text.print( "b" )
	end

	imgui.printState( 5, 180 )

	_, value =  imgui.slider( 200, 20, 20, 200, 256, value )

	_, buffer =  imgui.textfield( 230, 20, 200, 20, buffer )

	font.set( "default", 32 )
	love.graphics.print( value, 220, 100 )
end

-------------------------------------------------------------------------------
return gui
