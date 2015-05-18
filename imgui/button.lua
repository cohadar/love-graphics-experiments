--- @module button

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )


-------------------------------------------------------------------------------
local function keyboardOn( id, uistate )
	if uistate.kbditem == 0 then
    	uistate.kbditem = id
    end		
	if uistate.kbditem == id then
		if uistate.keyentered == "tab" then
			uistate.keyentered = 0
			uistate.kbditem = 0
			if love.keyboard.isDown( "lshift" ) or love.keyboard.isDown( "rshift" ) then
				uistate.kbditem = uistate.lastwidget
			end
		elseif uistate.keyentered == "return" or uistate.keyentered == " " then
			uistate.keyentered = 0
			return true
		end
	end
	uistate.lastwidget = id;
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
button = function( x, y )
	local id, uistate = core.nextId()

	core.checkRegion( id, x, y, 64, 48 )

	style.drawButton( x, y, 64, 48, core.getMods( id ) )

	-- TODO: set active mod when button used via keyboard
	return keyboardOn( id, uistate ) or mouseReleasedOn( id, uistate )
end


-------------------------------------------------------------------------------
return button