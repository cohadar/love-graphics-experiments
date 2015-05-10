--- @module utils
local utils = {}

local conf = require "conf"
local rgb = require "rgb"

-------------------------------------------------------------------------------
function utils.setcolor( name )
	local color = rgb[ name ]
	if color then
		love.graphics.setColor( color.r, color.g, color.b )
	else
		error( "bad color name: " .. name )
	end
end

-------------------------------------------------------------------------------
function utils.drawLineH( y )
    love.graphics.line( 0, y, conf.SCREEN_WIDTH, y )	
end

-------------------------------------------------------------------------------
function utils.drawLineV( x )
    love.graphics.line( x, 0, x, conf.SCREEN_HEIGHT  )	
end

-------------------------------------------------------------------------------
function utils.hotkeyOffset( font, text, char )
	local a, b = string.find( text, char )
	local pretext = string.sub( text, 1, a )
	return font:getWidth( pretext ) - font:getWidth( char )
end

-------------------------------------------------------------------------------
function utils.alignOffset( box_width, text_width, align )
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
return utils
