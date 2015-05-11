--- @module button

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
button = function( x, y )
	local id = core.nextId()

	core.checkRegion( id, x, y, 64, 48 )

	style.drawButton( x, y, 64, 48, core.isHot( id ), core.isActive( id ) )

	return core.mouseReleasedOn( id )
end


-------------------------------------------------------------------------------
return button