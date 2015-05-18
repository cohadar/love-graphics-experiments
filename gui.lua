--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"
local font = require "font"


local value = 0
local size = 256
local buffer = "Default Text"

-------------------------------------------------------------------------------
function gui.draw()

	imgui.dialog.start( "Dialog Title" )

	if imgui.button( "Hello", { x = 50, y = 50, w = 50, h = 24 } ) then
		text.print( "a" )
	end
	if imgui.button( "World", { x = 120, y = 50, w = 50, h = 24 } ) then
		text.print( "b" )
	end

	local dialog_rect = imgui.dialog.stop()
	imgui.luatable( { x = 500, y = 20 }, dialog_rect )

	imgui.printState{ x = 5, y = 180 }

	_, value =  imgui.slider( value, size, { x = 200, y = 20, w = 20, h = 200 } )

	_, buffer =  imgui.textfield( buffer, { x = 230, y = 20, w = 200, h = 20 } )

	font.set( "default", 32 )
	love.graphics.print( value, 220, 100 )
end

-------------------------------------------------------------------------------
return gui
