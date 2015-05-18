--- @module draw
local draw = {}

local conf = require "conf"
local rgb = require "rgb"
local font = require "font"

-------------------------------------------------------------------------------
_fontCache = {}

-------------------------------------------------------------------------------
draw.print = love.graphics.print

-------------------------------------------------------------------------------
function draw.color( name, alpha )
	local color = rgb[ name ]
	if color then
		love.graphics.setColor( color.r, color.g, color.b, alpha )
	else
		error( "bad color name: " .. name )
	end
end

-------------------------------------------------------------------------------
function draw.hline( y )
    love.graphics.line( 0, y, conf.SCREEN_WIDTH, y )	
end

-------------------------------------------------------------------------------
function draw.vline( x )
    love.graphics.line( x, 0, x, conf.SCREEN_HEIGHT  )	
end

-------------------------------------------------------------------------------
function draw.hotkeyOffset( font, text, char )
	local a, b = string.find( text, char )
	local pretext = string.sub( text, 1, a )
	return font:getWidth( pretext ) - font:getWidth( char )
end

-------------------------------------------------------------------------------
function draw.alignOffset( box_width, text_width, align )
	if align == "left" then 
		return 0
	elseif align == "right" then
		return box_width - text_width
	elseif align == "center" then
		return ( box_width - text_width ) / 2
	else
		error( "unsupported align mode:" .. align )
	end
end

-------------------------------------------------------------------------------
function draw.rect( x, y, width, height, color, alpha )
	assert( color == nil )
	love.graphics.rectangle( "fill", x, y, width, height )
end

function draw.border( x, y, width, height, color, alpha )
	assert( color == nil )
	love.graphics.rectangle( "line", x+0.5, y+0.5, width, height )
end

-------------------------------------------------------------------------------
function draw.setDefaultFont( optional_size )
	font.set( "default", optional_size )
end

-------------------------------------------------------------------------------
function draw.setInputFont( optional_size )
	font.set( "input", optional_size )
end

-------------------------------------------------------------------------------
return draw
