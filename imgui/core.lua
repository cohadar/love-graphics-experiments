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
	mousewheel = 0,
	mousewheel_acc = 0,

	hotitem = 0,
	activeitem = 0,
	kbditem = 0,
	keychar = 0,

  	keyentered = nil,
  	lastwidget = 0,	
}

-------------------------------------------------------------------------------
local _lastid = 0
local _tick = 0
local FPS = 60

-------------------------------------------------------------------------------
function core.getTick()
	return _tick
end

-------------------------------------------------------------------------------
-- Returns widget id and current uistate, call in every widget
-------------------------------------------------------------------------------
function core.nextId()
	_lastid = _lastid + 1
	return _lastid, uistate
end

-------------------------------------------------------------------------------
local function fixParentRect( parent, child )
	if parent.adjust_x then
		parent.adjust_x = false
		parent.x = child.x
	end
	if parent.adjust_y then
		parent.adjust_y = false
		parent.y = child.y
	end
	if parent.adjust_w then
		parent.adjust_w = false
		parent.w = child.w
	end
	if parent.adjust_h then
		parent.adjust_h = false
		parent.h = child.h
	end
	if child.x < parent.x then
		parent.x = child.x
	end
	if child.y < parent.y then
		parent.y = child.y
	end
	if child.x + child.w > parent.x + parent.w then
		parent.w = child.x + child.w - parent.x
	end
	if child.y + child.h > parent.y + parent.h then
		parent.h = child.y + child.h - parent.y
	end
	if parent.adjust_child then
		parent.adjust_child( parent, child )
	end
end

-------------------------------------------------------------------------------
function core.fixRect( rect ) 
	if rect.x == nil then
		rect.x = 0
		rect.adjust_x = true
	end
	if rect.y == nil then
		rect.y = 0
		rect.adjust_y = true
	end		
	if rect.w == nil then
		rect.w = 0
		rect.adjust_w = true
	end
	if rect.h == nil then
		rect.h = 0
		rect.adjust_h = true
	end	
	if rect.parent then
		fixParentRect( rect.parent, rect )
	end
end

-------------------------------------------------------------------------------
-- Check whether current mouse position is within a rectangle
-------------------------------------------------------------------------------
local function isRectHot( x, y, w, h )
	if uistate.mousex < x or uistate.mousey < y then
		return false
	end
	if uistate.mousex >= x + w or uistate.mousey >= y + h then
		return false
	end
	return true
end

-------------------------------------------------------------------------------
-- check if widget is hot and active, call in every ( square ) widget
-------------------------------------------------------------------------------
function core.checkRect( id, rect )
	if isRectHot( rect.x, rect.y, rect.w, rect.h ) then
		uistate.hotitem = id
		if uistate.mousedown and uistate.activeitem == 0 then
	  		uistate.activeitem = id
	  	end
	end
end 

-------------------------------------------------------------------------------
-- handles keyboard focus and tab-cycling
-------------------------------------------------------------------------------
function core.hasKeyboardFocus( id )
	if uistate.kbditem == 0 then
    	uistate.kbditem = id
    end		
	if uistate.kbditem == id then
		if uistate.keyentered == "tab" then
			uistate.keyentered = 0
			uistate.kbditem = 0
			if love.keyboard.isDown( "lshift" ) or love.keyboard.isDown( "rshift" ) then
				uistate.kbditem = uistate.lastwidget
			end
		end
	end
	uistate.lastwidget = id;
	return uistate.kbditem == id
end

-------------------------------------------------------------------------------
-- states passed to stile draw functions
-------------------------------------------------------------------------------
function core.getMods( id )
	return {
		hot    = ( uistate.hotitem == id ),
		active = ( uistate.activeitem == id ),
		focus  = ( uistate.kbditem == id ),
		tick   = _tick,
	}
end

-------------------------------------------------------------------------------
-- call before all other imgui draw functions
-------------------------------------------------------------------------------
function core.prepare()
	uistate.hotitem = 0
	_lastid = 0
	_tick = _tick + 1
	if _tick > FPS then
		_tick = 1
	end
end

-------------------------------------------------------------------------------
-- call after all other imgui draw functions
-------------------------------------------------------------------------------
function core.finish()
	if uistate.mousedown == false then
		uistate.activeitem = 0
	elseif uistate.activeitem == 0 then
		uistate.activeitem = -1
	end
	uistate.mousewheel = 0
	if _tick % 10 == 0 then
		if math.abs( uistate.mousewheel_acc ) > 1 then
			uistate.mousewheel = uistate.mousewheel_acc
		end	 
		uistate.mousewheel_acc = 0
	end 

 	-- if no widget grabbed tab, clear focus
  	if uistate.keyentered == "tab" then
    	uistate.kbditem = 0
    end
  	-- clear the entered key
  	uistate.keyentered = 0
  	-- clear the entered text
  	uistate.keychar = 0
end

-------------------------------------------------------------------------------
function core.keypressed( key, isrepeat )
	uistate.keyentered = key
end

-------------------------------------------------------------------------------
function core.keyreleased( key )
end

-------------------------------------------------------------------------------
function core.textinput( text )
	uistate.keychar = text 
end

-------------------------------------------------------------------------------
function core.mousepressed( x, y, button )
	uistate.mousex = x
	uistate.mousey = y
	if button == 'l' then
		uistate.mousedown = true
	end
	if button == "wu" then
		uistate.mousewheel = uistate.mousewheel - 1
		uistate.mousewheel_acc = uistate.mousewheel_acc - 1
	elseif button == "wd" then
		uistate.mousewheel = uistate.mousewheel + 1
		uistate.mousewheel_acc = uistate.mousewheel_acc + 1
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
