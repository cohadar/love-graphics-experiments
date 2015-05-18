--- @module dialog

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )
local dialog = {}

-------------------------------------------------------------------------------
local function push()
end

-------------------------------------------------------------------------------
local function pop()
end

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
function dialog.start( title, rect )
	local id, uistate = core.nextId()

	style.drawDialog( rect, core.getMods( id ), title )

	push( rect )
end

-------------------------------------------------------------------------------
function dialog.stop()
	return pop()
end

-------------------------------------------------------------------------------
return dialog

