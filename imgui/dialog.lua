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
-- rect.iteration is used by style.drawDialog for delayed resize & draw
-- that way dialog size can dynamically adjust to its content
-------------------------------------------------------------------------------
function dialog( rect )
	local id, uistate = core.nextId()
	core.fixRect( rect )
	rect.iteration = rect.iteration or 0	
	style.drawDialog( rect, core.getMods( id ) )
	if rect.iteration < 10 then
		rect.iteration = rect.iteration + 1
	end	
end

-------------------------------------------------------------------------------
return dialog

