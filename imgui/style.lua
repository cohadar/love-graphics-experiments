-------------------------------------------------------------------------------
-- This is the only module that is game specific.
-- It intentionally does not depend on anything else in imgui
-------------------------------------------------------------------------------
--- @module style
local style = {}

local draw = require "draw"

-------------------------------------------------------------------------------
function style.drawButton( x, y, w, h, hot, active )
	if hot then
		draw.rect( x, y, w, h, "light blue" )
	else
		draw.rect( x, y, w, h, "blue" )
	end
	if active then
		draw.rect( x + 10, y + 10, w - 20, h - 20, "cyan" )
	end	
end

-------------------------------------------------------------------------------
return style