-------------------------------------------------------------------------------
-- This is the only module that is game specific.
-- It intentionally does not depend on anything else in imgui
-------------------------------------------------------------------------------
--- @module style
local style = {}

local draw = require "draw"

-------------------------------------------------------------------------------
local colors = {
	background = "light grey",
	widget = "light royal blue",
	border = "aqua marine",
	text = "straw",
	hot_widget = "primary blue",
	hot_border = "yellow",
	hot_text = "pale",
	active_widget = "red",
	active_border = "yellow",
	active_text = "light blue",
	focus_border = "orange",
}

-------------------------------------------------------------------------------
function style.drawButton( x, y, w, h, mod )
	if mod.active then
		draw.color( colors.active_widget )
		draw.rect( x, y, w, h )
		draw.color( colors.active_border )
		draw.border( x, y, w, h )
	elseif mod.hot then
		draw.color( colors.hot_widget )
		draw.rect( x, y, w, h )
		draw.color( colors.hot_border )
		draw.border( x, y, w, h )		
	else
		draw.color( colors.widget )
		draw.rect( x, y, w, h )
		draw.color( colors.border )
		draw.border( x, y, w, h )
	end	
	if mod.focus then
		draw.color( colors.focus_border )
		draw.border( x - 1, y - 1, w + 2, h + 2 )
		draw.border( x - 2, y - 2, w + 4, h + 4 )
	end	
end

-------------------------------------------------------------------------------
function style.drawSlider( x, y, w, h, mod, percent )
	assert( percent >= 0 and percent <= 1 )
	-- calculate draw constants
	local HEAD_SIZE = w
	local SPINE_WIDTH = HEAD_SIZE * 3 / 5
	local HEAD_DX = ( HEAD_SIZE - SPINE_WIDTH ) / 2
	-- draw slider spine
	draw.color( colors.widget )
	draw.rect( x, y, SPINE_WIDTH, h )
	if mod.focus then
		draw.color( colors.focus_border )
		draw.border( x - 1, y - 1, SPINE_WIDTH + 2, h + 2 )
		draw.border( x - 2, y - 2, SPINE_WIDTH + 4, h + 4 )
	elseif mod.active or mod.hot then
		draw.color( colors.hot_border )
		draw.border( x, y, SPINE_WIDTH, h )
	else
		draw.color( colors.border )
		draw.border( x, y, SPINE_WIDTH, h )
	end
	-- draw slider head
	local dy = ( h - HEAD_SIZE ) * percent
  	if mod.active or mod.hot then
  		draw.color( colors.hot_widget )
		draw.rect( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE )
	    draw.color( colors.hot_border )
    	draw.border( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE )
  	else
  		draw.color( colors.widget )
    	draw.rect( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE )
	    draw.color( colors.border )
    	draw.border( x - HEAD_DX, y + dy, HEAD_SIZE, HEAD_SIZE )
    end   
end

-------------------------------------------------------------------------------
return style