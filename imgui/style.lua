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
function style.drawSlider( x, y, w, h, hot, active, percent )
	assert( percent >= 0 and percent <= 1 )
	-- calculate draw constants
	local HEAD_SIZE = w
	local SPINE_WIDTH = HEAD_SIZE * 3 / 5
	local HEAD_DX = ( HEAD_SIZE - SPINE_WIDTH ) / 2
	-- draw slider spine
	draw.rect( x, y, SPINE_WIDTH, h, "mushroom" )
	draw.border( x, y, SPINE_WIDTH, h, "off white" )
	-- draw slider head
	local dy = ( h - HEAD_SIZE ) * percent
  	if active or hot then
		draw.rect( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE, "purple brown" )
  	else
    	draw.rect( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE, "dark taupe" )
    end
    draw.border( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE, "pale" )
end

-------------------------------------------------------------------------------
return style