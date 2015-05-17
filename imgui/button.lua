--- @module button

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
button = function( x, y )
	local id = core.nextId()

	core.checkRegion( id, x, y, 64, 48 )

	style.drawButton( x, y, 64, 48, core.getMods( id ) )

	-- TODO: set active mod when button used via keyboard
	return core.keyboardOn( id ) or core.mouseReleasedOn( id )
end


-------------------------------------------------------------------------------
return button