--- @module core
-------------------------------------------------------------------------------
-- private methods used by other imgui modules
-------------------------------------------------------------------------------
local core = {}
local draw = require "draw"

-------------------------------------------------------------------------------
local uistate = {
	mousex = 0,
	mousey = 0,
	mousedown = false,
	hotitem = 0,
	activeitem = 0,
	lastid = 0
}

-------------------------------------------------------------------------------
-- Check whether current mouse position is within a rectangle
-------------------------------------------------------------------------------
function core.regionhit( x, y, w, h )
	if uistate.mousex < x or uistate.mousey < y then
		return false
	end
	if uistate.mousex >= x + w or uistate.mousey >= y + h then
		return false
	end
	return true
end

-------------------------------------------------------------------------------
function core.checkRegion( id, x, y, w, h )
	if core.regionhit( x, y, w, h ) then
		uistate.hotitem = id
		if uistate.mousedown and uistate.activeitem == 0 then
	  		uistate.activeitem = id
	  	end
	end
end 

-------------------------------------------------------------------------------
function core.mouseReleasedOn( id )
	if uistate.mousedown == false and
		uistate.hotitem == id and 
		uistate.activeitem == id then
		return true
	end
	return false
end

-------------------------------------------------------------------------------
function core.isHot( id )
	return uistate.hotitem == id
end

-------------------------------------------------------------------------------
function core.isActive( id )
	return uistate.activeitem == id
end

-------------------------------------------------------------------------------
function core.nextId()
	uistate.lastid = uistate.lastid + 1
	return uistate.lastid
end

-------------------------------------------------------------------------------
function core.prepare()
	uistate.hotitem = 0
	uistate.lastid = 0
end

-------------------------------------------------------------------------------
function core.finish()
	if uistate.mousedown == false then
		uistate.activeitem = 0
	elseif uistate.activeitem == 0 then
		uistate.activeitem = -1
	end
end

-------------------------------------------------------------------------------
function core.printState( x, y )
	draw.setDefaultFont( 12 )
	draw.rect( x, y, 140, 120, "brown", 0x80 )
	draw.color "white"
	function p( x, y, name, value )
		draw.print( name .. " = " .. tostring( value ) , x + 5, y )
	end
	p( x, y + 10, "mousex"    , uistate.mousex )
	p( x, y + 30, "mousey"    , uistate.mousey )
	p( x, y + 50, "mousedown" , uistate.mousedown )
	p( x, y + 70, "hotitem"   , uistate.hotitem )
	p( x, y + 90, "activeitem", uistate.activeitem )
end

-------------------------------------------------------------------------------
function core.mousepressed( x, y, button )
	uistate.mousex = x
	uistate.mousey = y
	if button == 'l' then
		uistate.mousedown = true
	end
end

-------------------------------------------------------------------------------
function core.mousereleased( x, y, button )
	uistate.mousex = x
	uistate.mousey = y
	if button == 'l' then
		uistate.mousedown = false
	end
end

-------------------------------------------------------------------------------
function core.mousemoved( x, y, dx, dy )
	uistate.mousex = x
	uistate.mousey = y
end

-------------------------------------------------------------------------------
return core
