--- @module dialog

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )
local dialog = {}

local rects = {}

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

	if rect == nil then
		if rects[ id ] == nil then
			rects[ id ] = { x = -1, y = -1, w = -1, h = -1 }
		end
		rect = rects[ id ]
	end
	core.push( rect )
	style.drawDialog( rect, core.getMods( id ), title )
end

-------------------------------------------------------------------------------
function dialog.stop()
	local rect = core.pop()
	if rect.adjusted ~= true then
		rect.adjusted = true
		rect.x = rect.x - 5
		rect.y = rect.y - 5 - 20
		rect.w = rect.w + 10
		rect.h = rect.h + 10 + 20
	end
	return rect
end

-------------------------------------------------------------------------------
return dialog

