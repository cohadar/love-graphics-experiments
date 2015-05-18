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
	active_text = "black",
	focus_border = "orange",
}

-------------------------------------------------------------------------------
local function setWidgetColor( mod )
	if mod.active then
		draw.color( colors.active_widget )
	elseif mod.hot then
		draw.color( colors.hot_widget )
	else
		draw.color( colors.widget )
	end
end

-------------------------------------------------------------------------------
local function setBorderColor( mod )
	if mod.active then
		draw.color( colors.active_border )
	elseif mod.hot then
		draw.color( colors.hot_border )
	else
		draw.color( colors.border )
	end
end

-------------------------------------------------------------------------------
local function setTextColor( mod )
	if mod.active then
		draw.color( colors.active_text )
	elseif mod.hot then
		draw.color( colors.hot_text )
	else
		draw.color( colors.text )
	end
end

-------------------------------------------------------------------------------
local function drawFocus( x, y, w, h )
	draw.color( colors.focus_border )
	draw.border( x - 1, y - 1, w + 2, h + 2 )
	draw.border( x - 2, y - 2, w + 4, h + 4 )
end

-------------------------------------------------------------------------------
function style.drawButton( x, y, w, h, mod )
	setWidgetColor( mod )
	draw.rect( x, y, w, h )
	setBorderColor( mod )
	draw.border( x, y, w, h )
	if mod.focus then
		drawFocus( x, y, w, h )
	end	
end

-------------------------------------------------------------------------------
function style.drawTextField( x, y, w, h, mod, text )
	setWidgetColor( mod )
	draw.rect( x, y, w, h )
	setBorderColor( mod )
	draw.border( x, y, w, h )	
	if mod.focus then
		drawFocus( x, y, w, h )
	end	
	setTextColor( mod )
	draw.setInputFont( h - 4 )
	draw.print( text, x + 2, y + 2 )
end

-------------------------------------------------------------------------------
function style.drawSlider( x, y, w, h, mod, percent )
	assert( percent >= 0 and percent <= 1 )
	-- calculate draw constants
	local HEAD_SIZE = w
	local SPINE_WIDTH = HEAD_SIZE * 3 / 5
	local DX = ( HEAD_SIZE - SPINE_WIDTH ) / 2
	-- draw slider spine
	setWidgetColor( mod )
	draw.rect( x + DX, y, SPINE_WIDTH, h )
	setBorderColor( mod )
	draw.border( x + DX, y, SPINE_WIDTH, h )
	if mod.focus then
		drawFocus( x + DX, y, SPINE_WIDTH, h )
	end	
	-- draw slider head
	local dy = ( h - HEAD_SIZE ) * percent
	setWidgetColor( mod )
	draw.rect( x, y + dy, HEAD_SIZE, HEAD_SIZE )
	setBorderColor( mod )
	draw.border( x, y + dy, HEAD_SIZE, HEAD_SIZE )
	if mod.focus then
		drawFocus( x, y + dy, HEAD_SIZE, HEAD_SIZE )
	end		
end

-------------------------------------------------------------------------------
return style
