--- @module hline

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
local function alignElements( y, align, elements )
	if align == "top" then
		for _, rect in ipairs( elements ) do 
			rect.y = y
		end
	elseif align == "bottom" then
		for _, rect in ipairs( elements ) do 
			rect.y = y - rect.h
		end
	elseif align == "center" then
		for _, rect in ipairs( elements ) do 
			rect.y = y - rect.h / 2 
		end
	else
		error( "hline invalid align: " .. tostring( align ) )
	end	
end

-------------------------------------------------------------------------------
function hline( self )
	assert( self.y, "hline must specify y" )
	self.x = 0
	self.w = 1000
	self.h = 1
	if self.align and self.elements and core.getTick() == 3 then
		alignElements( self.y, self.align, self.elements )
	end
	local id, uistate = core.nextId()
	core.fixRect( self )
	style.hline( self )
	return false
end

-------------------------------------------------------------------------------
return hline
