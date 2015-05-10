--- @module imgui
local imgui = {}

local draw = require "draw"

-------------------------------------------------------------------------------
local state = {
	mouse_x = 0,
	mouse_y = 0,
	mouse_down = 0,
	hot_item_id = 0,
	active_item_id = 0
}

-------------------------------------------------------------------------------
function imgui.printState()
	draw.fontSize( 12 )
	local x = 0
	local y = 0
	draw.rect( x - 5, y, 120, 120, "brown" )
	draw.color "white"
	function p( x, y, name, value )
		draw.print( name .. " = " .. value , x, y )
	end
	p( x, y + 10, "mouse_x"       , state.mouse_x )
	p( x, y + 30, "mouse_y"       , state.mouse_y )
	p( x, y + 50, "mouse_down"    , state.mouse_down )
	p( x, y + 70, "hot_item_id"   , state.hot_item_id )
	p( x, y + 90, "active_item_id", state.active_item_id )
end


-------------------------------------------------------------------------------
function imgui.mousepressed( x, y, button )
end

-------------------------------------------------------------------------------
function imgui.mousereleased( x, y, button )
end

-------------------------------------------------------------------------------
function imgui.mousemoved( x, y, dx, dy )
end

-------------------------------------------------------------------------------
return imgui
