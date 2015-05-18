--- @module luatable

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
local function keyboardOn( id, uistate )
	if core.hasKeyboardFocus( id ) then
		if uistate.keyentered == "return" or uistate.keyentered == " " then
			uistate.keyentered = 0
			return true
		end
	end
	return false
end

-------------------------------------------------------------------------------
local function mouseReleasedOn( id, uistate )
	if uistate.mousedown == false and
		uistate.hotitem == id and 
		uistate.activeitem == id then
		return true
	end
	return false
end

-------------------------------------------------------------------------------
function luatable( rect, table )
	local id, uistate = core.nextId()
	table = table or uistate

	rect = { x = rect.x, y = rect.y, w = rect.w or 0, h = rect.h or 0 }
	core.checkRect2( id, rect )

	style.drawLuaTable( rect, core.getMods( id ), table )

	return false
end

-------------------------------------------------------------------------------
return luatable