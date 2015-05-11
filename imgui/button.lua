--- @module button

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local draw = require "draw"

-------------------------------------------------------------------------------
button = function( x, y )
	local id = core.nextId()

	core.checkRegion( id, x, y, 64, 48 )

	if core.isHot( id ) then
		draw.rect( x, y, 64, 48, "light blue" )
	else
		draw.rect( x, y, 64, 48, "blue" )
	end
	if core.isActive( id ) then
		draw.rect( x+10, y+10, 64-20, 48-20, "cyan" )
	end
	return core.mouseReleasedOn( id )
end


-------------------------------------------------------------------------------
return button