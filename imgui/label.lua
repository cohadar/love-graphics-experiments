--- @module label

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
function label( text, rect )
	local id, uistate = core.nextId()
	core.fixRect( rect )
	core.checkRect( id, rect )
	style.drawLabel( rect, core.getMods( id ), text )
end

-------------------------------------------------------------------------------
return label
