--- @module textfield

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

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
local function keyboardOn( id, uistate, buffer )
	if core.hasKeyboardFocus( id ) then
		if uistate.keyentered == "backspace" then
			uistate.keyentered = 0			
			return true, string.sub( buffer, 1, string.len( buffer ) - 1 )
		elseif uistate.keychar ~= 0 then
			buffer = buffer .. uistate.keychar
			uistate.keychar = 0
			return true, buffer
		end
	end
	return false, buffer
end

-------------------------------------------------------------------------------
function textfield( buffer, rect )
	local id, uistate = core.nextId()

	core.checkRect2( id, rect )

	style.drawTextField( rect, core.getMods( id ), buffer )

	if mouseReleasedOn( id, uistate ) then
		uistate.kbditem = id
	end

	return keyboardOn( id, uistate, buffer )
end


-------------------------------------------------------------------------------
return textfield