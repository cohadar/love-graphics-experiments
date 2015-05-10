--- @module draw
local draw = {}

local conf = require "conf"
local rgb = require "rgb"

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
	draw.color( color, alpha )
	love.graphics.rectangle( "fill", x, y, width, height )
end

-------------------------------------------------------------------------------
function draw.fontSize( size )
	if _fontCache[ size ] then
		love.graphics.setFont( _fontCache[ size ] ) 
	else
		local font = love.graphics.setNewFont( size ) 
		_fontCache[ size ] = font
	end
end

-------------------------------------------------------------------------------
return draw
