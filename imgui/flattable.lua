--- @module flattable

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
function flattable( self )
	local id, uistate = core.nextId()
	self.flattable = self.flattable or uistate

	self.w = self.w or 0
	self.h = self.h or 0
	core.checkRect( id, self )

	style.flattable( self, core.getMods( id ) )

	return false
end

-------------------------------------------------------------------------------
return flattable