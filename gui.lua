--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"
local font = require "font"


local value = 0
local size = 256
local buffer = "Default Text"

local dialog_rect = {}
local rect_l = { x = 50, y = 20, parent = dialog_rect }
local rect_a = { x = 50, y = 50, parent = dialog_rect }
local rect_b = { x = 90, y = 80, parent = dialog_rect }
local rect_c = { x = 100, y = 130, parent = dialog_rect }

-------------------------------------------------------------------------------
function gui.draw()
	imgui.dialog( dialog_rect )
	imgui.label( "Dialog Title", rect_l )
	if imgui.button( "Hello", rect_a ) then
		text.print( "a" )
	end
	if imgui.button( "World", rect_b ) then
		text.print( "b" )
	end
	if imgui.button( "Bre Kukuruz", rect_c ) then
		text.print( "c" )
	end

	imgui.luatable( { x = 500, y = 20 }, dialog_rect )
	imgui.printState{ x = 5, y = 180 }
	_, value =  imgui.slider( value, size, { x = 200, y = 20, w = 20, h = 200 } )
	_, buffer =  imgui.textfield( buffer, { x = 230, y = 20, w = 200, h = 20 } )

	font.set( "default", 32 )
	love.graphics.print( value, 220, 100 )
end

-------------------------------------------------------------------------------
return gui
