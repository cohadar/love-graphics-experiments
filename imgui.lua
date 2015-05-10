--- @module imgui
local imgui = {}

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
local function regionhit( x, y, w, h )
	if uistate.mousex < x or uistate.mousey < y then
		return false
	end
	if uistate.mousex >= x + w or uistate.mousey >= y + h then
		return false
	end
	return true
end

-------------------------------------------------------------------------------
function imgui.afterDraw()
	uistate.lastid = 0
end

-------------------------------------------------------------------------------
local function nextId()
	uistate.lastid = uistate.lastid + 1
	return uistate.lastid
end

-------------------------------------------------------------------------------
local function after()
	if uistate.mousedown == false then
		uistate.activeitem = 0
	end
end

-------------------------------------------------------------------------------
function imgui.button( x, y )
	local id = nextId()
	if regionhit( x, y, 64, 48 ) then
		uistate.hotitem = id
		if uistate.mousedown and uistate.activeitem == 0 then
      		uistate.activeitem = id
      	end
	end
	if uistate.hotitem == id then
		draw.rect( x, y, 64, 48, "light blue" )
	else
		draw.rect( x, y, 64, 48, "blue" )
	end
	if uistate.activeitem == id then
		draw.rect( x+10, y+10, 64-20, 48-20, "cyan" )
		--draw.border( x+1, y+1, 64+1, 48+1, "cyan" )
	end
	after()
end

-------------------------------------------------------------------------------
function imgui.printState( x, y )
	draw.fontSize( 12 )
	draw.rect( x - 5, y, 140, 120, "brown", 0x80 )
	draw.color "white"
	function p( x, y, name, value )
		draw.print( name .. " = " .. tostring( value ) , x, y )
	end
	p( x, y + 10, "mousex"    , uistate.mousex )
	p( x, y + 30, "mousey"    , uistate.mousey )
	p( x, y + 50, "mousedown" , uistate.mousedown )
	p( x, y + 70, "hotitem"   , uistate.hotitem )
	p( x, y + 90, "activeitem", uistate.activeitem )
end


-------------------------------------------------------------------------------
function imgui.mousepressed( x, y, button )
	uistate.mousex = x
	uistate.mousey = y
	uistate.mousedown = true
end

-------------------------------------------------------------------------------
function imgui.mousereleased( x, y, button )
	uistate.mousex = x
	uistate.mousey = y
	uistate.mousedown = false
end

-------------------------------------------------------------------------------
function imgui.mousemoved( x, y, dx, dy )
	uistate.mousex = x
	uistate.mousey = y
	uistate.hotitem = 0
end

-------------------------------------------------------------------------------
return imgui
