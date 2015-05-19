--- @module button

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
function button( state )
	local id, uistate = core.nextId()

	core.fixRect( state )
	core.checkRect( id, state )

	style.button( state, core.getMods( id ) )

	-- TODO: set active mod when button used via keyboard
	return keyboardOn( id, uistate ) or mouseReleasedOn( id, uistate )
end

-------------------------------------------------------------------------------
return button
