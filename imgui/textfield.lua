--- @module textfield

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
textfield = function( x, y, w, h, buffer )
	local id, uistate = core.nextId()

	core.checkRegion( id, x, y, w, h )

	style.drawTextField( x, y, w, h, core.getMods( id ), buffer )

	if mouseReleasedOn( id, uistate ) then
		uistate.kbditem = id
	end

	
	local changed = false	

	keyboardOn( id, uistate )

	return false, buffer
end


-------------------------------------------------------------------------------
return textfield