-------------------------------------------------------------------------------
-- This is the only modsule that is game specific.
-- It intentionally does not depend on anything else in imgui
-------------------------------------------------------------------------------
--- @module style
local style = {}
local font = require "font"
local rgb = require "rgb"

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
function style.getfont( state )
	return font.get( state.font or "default", state.font_size ) 	
end

-------------------------------------------------------------------------------
function style.setfont( state )
	return font.set( state.font or "default", state.font_size ) 	
end

-------------------------------------------------------------------------------
function style.color( name, alpha )
	local color = rgb[ name ]
	if color then
		love.graphics.setColor( color.r, color.g, color.b, alpha )
	else
		error( "bad color name: " .. name )
	end
end

-------------------------------------------------------------------------------
local function setWidgetColor( mods )
	if mods.active then
		style.color( colors.active_widget )
	elseif mods.hot then
		style.color( colors.hot_widget )
	else
		style.color( colors.widget )
	end
end

-------------------------------------------------------------------------------
local function setBorderColor( mods )
	if mods.active then
		style.color( colors.active_border )
	elseif mods.hot then
		style.color( colors.hot_border )
	else
		style.color( colors.border )
	end
end

-------------------------------------------------------------------------------
local function setTextColor( mods )
	if mods.active then
		style.color( colors.active_text )
	elseif mods.hot then
		style.color( colors.hot_text )
	else
		style.color( colors.text )
	end
end

-------------------------------------------------------------------------------
local function drawRect( x, y, w, h )
	if type( x ) == "table" then
		x, y, w, h = x.x, x.y, x.w, x.h
	end 
	love.graphics.rectangle( "fill", x, y, w, h )
end

-------------------------------------------------------------------------------
local function drawBorder( x, y, w, h )
	if type( x ) == "table" then
		x, y, w, h = x.x, x.y, x.w, x.h
	end 
	-- we add 0.5 for pixel centering
	love.graphics.rectangle( "line", x + 0.5, y + 0.5, w, h )
end

-------------------------------------------------------------------------------
local function drawFocus( x, y, w, h )
	if type( x ) == "table" then
		x, y, w, h = x.x, x.y, x.w, x.h
	end 	
	style.color( colors.focus_border )
	drawBorder( x - 1, y - 1, w + 2, h + 2 )
	drawBorder( x - 2, y - 2, w + 4, h + 4 )
end

-------------------------------------------------------------------------------
function style.button( state, mods )	
	-- draw background
	setWidgetColor( mods )
	drawRect( state )
	-- draw border
	setBorderColor( mods )
	drawBorder( state )
	if mods.focus then
		drawFocus( state )
	end	
	-- adjust sizes
	local X_PADDING = 4
	local Y_PADDING = 2
	local f = style.setfont( state )
	if state.adjust_w then
		state.adjust_w = false
		state.w = f:getWidth( state.text ) + X_PADDING * 2
	end
	if state.adjust_h then
		state.adjust_h = false
		state.h = f:getHeight( state.text ) + Y_PADDING * 2
	end	
	-- draw text
	setTextColor( mods )
	love.graphics.print( state.text, state.x + X_PADDING, state.y + Y_PADDING )
end

-------------------------------------------------------------------------------
function style.getCenterX()	
	return love.graphics.getWidth() / 2
end

-------------------------------------------------------------------------------
function style.getCenterY()	
	return love.graphics.getHeight() / 2
end

-------------------------------------------------------------------------------
function style.label( state, mods )
	local f = style.setfont( state )
	-- adjust sizes
	local X_PADDING = 4
	local Y_PADDING = 2
	if state.adjust_w then
		state.adjust_w = false
		state.w = f:getWidth( state.text ) + X_PADDING * 2
	end
	if state.adjust_h then
		state.adjust_h = false
		state.h = f:getHeight( state.text ) + Y_PADDING * 2
	end	
	-- draw label	
	style.color( colors.text )
	love.graphics.print( state.text, state.x + 4, state.y + 2 )
end

-------------------------------------------------------------------------------
function style.dialog( rect, mods )	
	style.setfont( rect )
	setWidgetColor( mods )
	drawRect( rect )
	setBorderColor( mods )
	drawBorder( rect )
end

-------------------------------------------------------------------------------
function style.textfield( self, mods )
	-- adjust sizes
	local X_PADDING = 4
	local Y_PADDING = 2
	local f = style.setfont( self )
	local em = f:getWidth( "M" )
	if self.adjust_w then
		self.adjust_w = false
		self.w = self.columns * em + X_PADDING * 2
	end
	if self.adjust_h then
		self.adjust_h = false
		self.h = f:getHeight() + Y_PADDING * 2
	end	
	-- draw background
	setWidgetColor( mods )
	drawRect( self )
	setBorderColor( mods )
	drawBorder( self )	
	if mods.focus then
		drawFocus( self )
	end	
	-- draw text
	local len = string.len( self.text )
	setTextColor( mods )
	local displaytext = self.text
	if len > self.columns then
		displaytext = "…" .. string.sub( self.text, len - self.columns + 2, len )
	end
	love.graphics.print( displaytext, self.x + 2, self.y + 2 )
	-- render cursor if we have keyboard focus
  	if mods.focus and mods.tick > 30 then
    	love.graphics.print( "|", self.x + math.min( len, self.columns ) * em, self.y )
    end	
end

-------------------------------------------------------------------------------
function style.slider( self, mods )
	assert( self.percent >= 0 and self.percent <= 1 )
	-- calculate draw constants
	local HEAD_SIZE = self.w
	local SPINE_WIDTH = HEAD_SIZE * 3 / 5
	local DX = ( HEAD_SIZE - SPINE_WIDTH ) / 2
	-- draw slider spine
	setWidgetColor( mods )
	drawRect( self.x + DX, self.y, SPINE_WIDTH, self.h )
	setBorderColor( mods )
	drawBorder( self.x + DX, self.y, SPINE_WIDTH, self.h )
	if mods.focus then
		drawFocus( self.x + DX, self.y, SPINE_WIDTH, self.h )
	end	
	-- draw slider head
	local dy = ( self.h - HEAD_SIZE ) * self.percent
	setWidgetColor( mods )
	drawRect( self.x, self.y + dy, HEAD_SIZE, HEAD_SIZE )
	setBorderColor( mods )
	drawBorder( self.x, self.y + dy, HEAD_SIZE, HEAD_SIZE )
	if mods.focus then
		drawFocus( self.x, self.y + dy, HEAD_SIZE, HEAD_SIZE )
	end		
end

-------------------------------------------------------------------------------
function style.flattable( self, mods )
	local f = style.setfont( self )
	local count = 0
	local maxlen = 0
	for key, value in pairs( self.flattable ) do
		count = count + 1
		local lineLen = f:getWidth( key .. " = " .. tostring( value ) )
		maxlen = math.max( maxlen, lineLen )
	end		
	local fontHeight = f:getHeight()
	self.w = math.max( self.w, maxlen + 10 )
	self.h = math.max( self.h, count * fontHeight )
	setWidgetColor( mods )
	drawRect( self )
	setBorderColor( mods )
	drawBorder( self )	
	setTextColor( mods )
	function p( x, y, key, value )
		love.graphics.print( key .. " = " .. tostring( value ) , x + 5, y )
	end
	y = self.y
	for key, value in pairs( self.flattable ) do
		p( self.x, y, key, value )
		y = y + fontHeight
	end	
end

-------------------------------------------------------------------------------
function style.beep()
end

-------------------------------------------------------------------------------
return style
