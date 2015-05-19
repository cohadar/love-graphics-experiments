--- @module dialog

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )
local dialog = {}

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
-- self.iteration is used by style.drawDialog for delayed resize & draw
-- that way dialog size can dynamically adjust to its content
-------------------------------------------------------------------------------
function dialog( self )
	local id, uistate = core.nextId()
	core.fixRect( self )
	self.iteration = self.iteration or 0	
	style.drawDialog( self, core.getMods( id ) )
	if self.iteration < 10 then
		self.iteration = self.iteration + 1
	end	
end

-------------------------------------------------------------------------------
return dialog

