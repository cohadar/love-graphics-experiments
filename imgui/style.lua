-------------------------------------------------------------------------------
-- This is the only modsule that is game specific.
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
local function setWidgetColor( mods )
	if mods.active then
		draw.color( colors.active_widget )
	elseif mods.hot then
		draw.color( colors.hot_widget )
	else
		draw.color( colors.widget )
	end
end

-------------------------------------------------------------------------------
local function setBorderColor( mods )
	if mods.active then
		draw.color( colors.active_border )
	elseif mods.hot then
		draw.color( colors.hot_border )
	else
		draw.color( colors.border )
	end
end

-------------------------------------------------------------------------------
local function setTextColor( mods )
	if mods.active then
		draw.color( colors.active_text )
	elseif mods.hot then
		draw.color( colors.hot_text )
	else
		draw.color( colors.text )
	end
end

-------------------------------------------------------------------------------
local function drawFocus( x, y, w, h )
	if type( x ) == "table" then
		x, y, w, h = x.x, x.y, x.w, x.h
	end 	
	draw.color( colors.focus_border )
	draw.border( x - 1, y - 1, w + 2, h + 2 )
	draw.border( x - 2, y - 2, w + 4, h + 4 )
end

-------------------------------------------------------------------------------
function style.drawButton( state, mods )	
	-- draw background
	setWidgetColor( mods )
	draw.rect( state )
	-- draw border
	setBorderColor( mods )
	draw.border( state )
	if mods.focus then
		drawFocus( state )
	end	
	-- adjust sizes
	local X_PADDING = 4
	local Y_PADDING = 2
	draw.setDefaultFont()
	if state.adjust_w then
		state.adjust_w = false
		state.w = draw.getTextWidth( state.text ) + X_PADDING * 2
	end
	if state.adjust_h then
		state.adjust_h = false
		state.h = draw.getFontHeight( state.text ) + Y_PADDING * 2
	end	
	-- draw text
	setTextColor( mods )
	draw.print( state.text, state.x + X_PADDING, state.y + Y_PADDING )
end

-------------------------------------------------------------------------------
function style.drawLabel( state, mods )
	draw.setDefaultFont()
	draw.color( colors.text )
	draw.print( state.text, state.x + 4, state.y + 2 )
end

-------------------------------------------------------------------------------
function style.drawDialog( rect, mods )
	-- add border padding
	if rect.iteration == 2 then
		rect.x = rect.x - 5
		rect.y = rect.y - 5 
		rect.w = rect.w + 10
		rect.h = rect.h + 10
	end			
	-- draw background	
	draw.setDefaultFont()
	setWidgetColor( mods )
	draw.rect( rect )
	setBorderColor( mods )
	draw.border( rect )
end

-------------------------------------------------------------------------------
function style.drawTextField( self, mods )
	setWidgetColor( mods )
	draw.rect( self )
	setBorderColor( mods )
	draw.border( self )	
	if mods.focus then
		drawFocus( self )
	end	
	setTextColor( mods )
	draw.setInputFont( self.h - 4 )
	local char_width = draw.getFontEm()
	draw.print( self.text, self.x + 2, self.y + 2 )
	-- render cursor if we have keyboard focus
	local len = string.len( self.text )
  	if mods.focus and mods.tick > 30 then
    	draw.print( "_", self.x + len * char_width, self.y )
    end
end

-------------------------------------------------------------------------------
function style.drawSlider( self, mods )
	assert( self.percent >= 0 and self.percent <= 1 )
	-- calculate draw constants
	local HEAD_SIZE = self.w
	local SPINE_WIDTH = HEAD_SIZE * 3 / 5
	local DX = ( HEAD_SIZE - SPINE_WIDTH ) / 2
	-- draw slider spine
	setWidgetColor( mods )
	draw.rect( self.x + DX, self.y, SPINE_WIDTH, self.h )
	setBorderColor( mods )
	draw.border( self.x + DX, self.y, SPINE_WIDTH, self.h )
	if mods.focus then
		drawFocus( self.x + DX, self.y, SPINE_WIDTH, self.h )
	end	
	-- draw slider head
	local dy = ( self.h - HEAD_SIZE ) * self.percent
	setWidgetColor( mods )
	draw.rect( self.x, self.y + dy, HEAD_SIZE, HEAD_SIZE )
	setBorderColor( mods )
	draw.border( self.x, self.y + dy, HEAD_SIZE, HEAD_SIZE )
	if mods.focus then
		drawFocus( self.x, self.y + dy, HEAD_SIZE, HEAD_SIZE )
	end		
end

-------------------------------------------------------------------------------
function style.drawFlatTable( self, mods )
	draw.setDefaultFont()
	local count = 0
	local maxlen = 0
	for key, value in pairs( self.flattable ) do
		count = count + 1
		local lineLen = draw.getTextWidth( key .. " = " .. tostring( value ) )
		maxlen = math.max( maxlen, lineLen )
	end		
	local fontHeight = draw.getFontHeight()
	self.w = math.max( self.w, maxlen + 10 )
	self.h = math.max( self.h, count * fontHeight )
	setWidgetColor( mods )
	draw.rect( self )
	setBorderColor( mods )
	draw.border( self )	
	setTextColor( mods )
	function p( x, y, key, value )
		draw.print( key .. " = " .. tostring( value ) , x + 5, y )
	end
	y = self.y
	for key, value in pairs( self.flattable ) do
		p( self.x, y, key, value )
		y = y + fontHeight
	end	
end

-------------------------------------------------------------------------------
return style
