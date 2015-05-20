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
local function keyboardOn( self, id, uistate )
	if core.hasKeyboardFocus( id ) then
		if uistate.keyentered == "backspace" then
			uistate.keyentered = 0			
			self.text = string.sub( self.text, 1, string.len( self.text ) - 1 )
			return true
		elseif uistate.keychar ~= 0 then
			if string.len( self.text ) < self.max_text_len then
				self.text = self.text .. uistate.keychar
			else
				style.beep()
			end
			uistate.keychar = 0
			return true
		end
	end
	return false
end

-------------------------------------------------------------------------------
local function textfield( self )
	self.columns = self.columns or 30
	self.max_text_len = self.max_text_len or 60

	local id, uistate = core.nextId()

	core.fixRect( self )
	core.checkRect( id, self )

	style.textfield( self, core.getMods( id ) )

	if mouseReleasedOn( id, uistate ) then
		uistate.kbditem = id
	end

	return keyboardOn( self, id, uistate )
end


-------------------------------------------------------------------------------
return textfield