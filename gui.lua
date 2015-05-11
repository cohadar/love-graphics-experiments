--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"

-------------------------------------------------------------------------------
function gui.draw()
	if imgui.button( 50, 50 ) then
		text.print( "a" )
	end
	if imgui.button( 120, 50 ) then
		text.print( "b" )
	end
	imgui.printState( 5, 180 )
end

-------------------------------------------------------------------------------
return gui
