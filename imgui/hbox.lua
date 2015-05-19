--- @module hbox

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
function hbox( state )
	local id, uistate = core.nextId()

	core.fixRect( state )
	core.checkRect( id, state )

	style.hbox( state, core.getMods( id ) )
	return false
end

-------------------------------------------------------------------------------
return hbox
