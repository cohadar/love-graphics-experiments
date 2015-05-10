--- @module imgui
local imgui = {}

local draw = require "draw"

-------------------------------------------------------------------------------
local state = {
	mouse_x = 0,
	mouse_y = 0,
	mouse_down = false,
	hot_item_id = 0,
	active_item_id = 0
}

-------------------------------------------------------------------------------
function imgui.printState( x, y )
	draw.fontSize( 12 )
	draw.rect( x - 5, y, 140, 120, "brown", 0x80 )
	draw.color "white"
	function p( x, y, name, value )
		draw.print( name .. " = " .. tostring( value ) , x, y )
	end
	p( x, y + 10, "mouse_x"       , state.mouse_x )
	p( x, y + 30, "mouse_y"       , state.mouse_y )
	p( x, y + 50, "mouse_down"    , state.mouse_down )
	p( x, y + 70, "hot_item_id"   , state.hot_item_id )
	p( x, y + 90, "active_item_id", state.active_item_id )
end


-------------------------------------------------------------------------------
function imgui.mousepressed( x, y, button )
	state.mouse_x = x
	state.mouse_y = y
	state.mouse_down = true
end

-------------------------------------------------------------------------------
function imgui.mousereleased( x, y, button )
	state.mouse_x = x
	state.mouse_y = y
	state.mouse_down = false
end

-------------------------------------------------------------------------------
function imgui.mousemoved( x, y, dx, dy )
	state.mouse_x = x
	state.mouse_y = y
end

-------------------------------------------------------------------------------
return imgui
