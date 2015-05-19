--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"
local font = require "font"


local slider_a = { value = 0, size = 256, x = 200, y = 20, w = 20, h = 200 }

local buffer = "Default Text"

local dialog_rect = {}
local dialog_title = { 
	text = "Dialog Title", 
	x = 50, y = 20, 
	parent = dialog_rect 
}
local button_a = { 
	text = "Hello", 
	x = 50, y = 50, 
	parent = dialog_rect 
}
local button_b = { 
	text = "World", 
	x = 90, y = 80, 
	parent = dialog_rect 
}
local button_c = { 
	text = "Kukuruz Bre", 
	x = 100, y = 130, 
	parent = dialog_rect 
}

-------------------------------------------------------------------------------
function gui.draw()
	imgui.dialog( dialog_rect )
	imgui.label( dialog_title )
	if imgui.button( button_a ) then
		text.print( "a" )
	end
	if imgui.button( button_b ) then
		text.print( "b" )
	end
	if imgui.button( button_c ) then
		text.print( "c" )
	end

	imgui.luatable( { x = 500, y = 20 }, dialog_rect )
	imgui.printState{ x = 5, y = 180 }
	imgui.slider( slider_a )
	_, buffer =  imgui.textfield( buffer, { x = 230, y = 20, w = 200, h = 20 } )

	font.set( "default", 32 )
	love.graphics.print( slider_a.value, 220, 100 )
end

-------------------------------------------------------------------------------
return gui
