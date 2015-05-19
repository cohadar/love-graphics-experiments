--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"
local font = require "font"


local slider_a = { value = 0, size = 256, x = 200, y = 20, w = 20, h = 200 }

local textfiled_a = { text = "Default Text", x = 230, y = 20, w = 200, h = 20 }

local dialog_abc = {}
local dialog_title = { 
	text = "Dialog Title", 
	x = 50, y = 20, 
	parent = dialog_abc 
}
local button_a = { 
	text = "Hello", 
	x = 50, y = 50, 
	parent = dialog_abc 
}
local button_b = { 
	text = "World", 
	x = 90, y = 80, 
	parent = dialog_abc 
}
local button_c = { 
	text = "Kukuruz Bre", 
	x = 100, y = 130, 
	parent = dialog_abc 
}
local flatt = {
	x = 500, y = 20, 
	flattable = dialog_abc
}

-------------------------------------------------------------------------------
function gui.draw()
	imgui.dialog( dialog_abc )
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

	imgui.flattable( flatt )
	imgui.printState{ x = 5, y = 180 }
	imgui.slider( slider_a )
	imgui.textfield( textfiled_a )

	font.set( "default", 32 )
	love.graphics.print( slider_a.value, 220, 100 )
end

-------------------------------------------------------------------------------
return gui
