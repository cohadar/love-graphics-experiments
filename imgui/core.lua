--- @module core
-------------------------------------------------------------------------------
-- private methods used by other imgui modules
-------------------------------------------------------------------------------
local core = {}

-------------------------------------------------------------------------------
-- user interface state
-------------------------------------------------------------------------------
local _ui = {
	mousex = 0,
	mousey = 0,
	mousedown = false,
	mousewheel = 0,
	mousewheelacc = 0,

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
local _FPS = 60

-------------------------------------------------------------------------------
function core.isAlignTick()
	return _tick == 2
end

-------------------------------------------------------------------------------
function core.isAfterAlignTick()
	return _tick == 3
end

-------------------------------------------------------------------------------
-- Returns widget id and current _ui, call in every widget
-------------------------------------------------------------------------------
function core.nextId()
	_lastid = _lastid + 1
	return _lastid, _ui
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
	return rect
end

-------------------------------------------------------------------------------
-- Check whether current mouse position is within a rectangle
-------------------------------------------------------------------------------
local function isRectHot( x, y, w, h )
	if _ui.mousex < x or _ui.mousey < y then
		return false
	end
	if _ui.mousex >= x + w or _ui.mousey >= y + h then
		return false
	end
	return true
end

-------------------------------------------------------------------------------
-- check if widget is hot and active, call in every ( square ) widget
-------------------------------------------------------------------------------
function core.checkRect( id, rect )
	if isRectHot( rect.x, rect.y, rect.w, rect.h ) then
		_ui.hotitem = id
		if _ui.mousedown and _ui.activeitem == 0 then
	  		_ui.activeitem = id
	  	end
	end
end 

-------------------------------------------------------------------------------
-- handles keyboard focus and tab-cycling
-------------------------------------------------------------------------------
function core.hasKeyboardFocus( id )
	if _ui.kbditem == 0 then
    	_ui.kbditem = id
    end		
	if _ui.kbditem == id then
		if _ui.keyentered == "tab" then
			_ui.keyentered = 0
			_ui.kbditem = 0
			if love.keyboard.isDown( "lshift" ) or love.keyboard.isDown( "rshift" ) then
				_ui.kbditem = _ui.lastwidget
			end
		end
	end
	_ui.lastwidget = id;
	return _ui.kbditem == id
end

-------------------------------------------------------------------------------
-- states passed to stile draw functions
-------------------------------------------------------------------------------
function core.getMods( id )
	return {
		hot    = ( _ui.hotitem == id ),
		active = ( _ui.activeitem == id ),
		focus  = ( _ui.kbditem == id ),
		tick   = _tick,
	}
end

-------------------------------------------------------------------------------
-- call before all other imgui draw functions
-------------------------------------------------------------------------------
function core.prepare()
	_ui.hotitem = 0
	_lastid = 0
	_tick = _tick + 1
	if _tick > _FPS then
		_tick = 1
	end
end

-------------------------------------------------------------------------------
-- call after all other imgui draw functions
-------------------------------------------------------------------------------
function core.finish()
	if _ui.mousedown == false then
		_ui.activeitem = 0
	elseif _ui.activeitem == 0 then
		_ui.activeitem = -1
	end
	_ui.mousewheel = 0
	if _tick % 10 == 0 then
		if math.abs( _ui.mousewheelacc ) > 1 then
			_ui.mousewheel = _ui.mousewheelacc
		end	 
		_ui.mousewheelacc = 0
	end 

 	-- if no widget grabbed tab, clear focus
  	if _ui.keyentered == "tab" then
    	_ui.kbditem = 0
    end
  	-- clear the entered key
  	_ui.keyentered = 0
  	-- clear the entered text
  	_ui.keychar = 0
end

-------------------------------------------------------------------------------
function core.keypressed( key, isrepeat )
	_ui.keyentered = key
end

-------------------------------------------------------------------------------
function core.keyreleased( key )
end

-------------------------------------------------------------------------------
function core.textinput( text )
	_ui.keychar = text 
end

-------------------------------------------------------------------------------
function core.mousepressed( x, y, button )
	_ui.mousex = x
	_ui.mousey = y
	if button == 'l' then
		_ui.mousedown = true
	end
	if button == "wu" then
		_ui.mousewheel = _ui.mousewheel - 1
		_ui.mousewheelacc = _ui.mousewheelacc - 1
	elseif button == "wd" then
		_ui.mousewheel = _ui.mousewheel + 1
		_ui.mousewheelacc = _ui.mousewheelacc + 1
	end
end

-------------------------------------------------------------------------------
function core.mousereleased( x, y, button )
	_ui.mousex = x
	_ui.mousey = y
	if button == 'l' then
		_ui.mousedown = false
	end
end

-------------------------------------------------------------------------------
function core.mousemoved( x, y, dx, dy )
	_ui.mousex = x
	_ui.mousey = y
end

-------------------------------------------------------------------------------
return core
