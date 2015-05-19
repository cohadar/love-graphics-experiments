--- @module label

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
local function label( state )
	local id, uistate = core.nextId()
	core.fixRect( state )
	core.checkRect( id, state )
	style.label( state, core.getMods( id ) )
end

-------------------------------------------------------------------------------
return label
