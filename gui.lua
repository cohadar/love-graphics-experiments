--- @module gui
local gui = {}

local imgui = require "imgui"
local text = require "text"
local font = require "font"


local slider_a = { value = 0, size = 256, x = 200, y = 20, w = 20, h = 200 }

local textfiled_a = { text = "Default Text", x = 230, y = 20 }

local dialog_title = { 
	text = "Dialog Title", 
}
local button_a = { 
	text = "Hello", 
}
local button_b = { 
	text = "World", 
}
local button_c = { 
	text = "Kukuruz Bre", 
}

local dialog_abc = {
	elements = { dialog_title, button_a, button_b, button_c }
}

local flatt = {
	x = 500, y = 20, 
	flattable = dialog_abc
}

-------------------------------------------------------------------------------
function gui.draw()
	imgui.dialog( dialog_abc )
	imgui.label( dialog_title )
	--imgui.vline( vline )
	if imgui.button( button_a ) then
		text.print( "a" )
	end
	if imgui.button( button_b ) then
		text.print( "b" )
	end
	if imgui.button( button_c ) then
		text.print( "c" )
	end
	-- making of centered dialog
	imgui.group.v_align( dialog_abc.elements, "center" )
	imgui.group.v_distribute( dialog_abc.elements, 5 )
	imgui.group.stretch_w( dialog_abc.elements )
	imgui.group.center_on_screen( dialog_abc.elements )

	imgui.flattable( flatt )
	imgui.printState{ x = 5, y = 180 }
	imgui.slider( slider_a )
	imgui.textfield( textfiled_a )

	font.set( "default", 32 )
	love.graphics.print( slider_a.value, 220, 100 )
	love.graphics.print( "M…W…M…W", 220, 200 )
end

-------------------------------------------------------------------------------
return gui
