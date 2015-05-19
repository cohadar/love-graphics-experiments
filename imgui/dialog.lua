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
function dialog.start( rect )
	local id, uistate = core.nextId()
	rect = core.fixRect( id, rect )
	rect.iteration = rect.iteration or 0
	core.push( rect )
	-- add border padding
	if rect.iteration == 2 then
		rect.x = rect.x - 5
		rect.y = rect.y - 5 
		rect.w = rect.w + 10
		rect.h = rect.h + 10
	end		
	style.drawDialog( rect, core.getMods( id ) )
end

-------------------------------------------------------------------------------
function dialog.stop()
	local rect = core.pop()
	if rect.iteration < 10 then
		rect.iteration = rect.iteration + 1
	end
	return rect
end

-------------------------------------------------------------------------------
return dialog

