--- @module junk
local junk = {}

local draw = require "draw"

-------------------------------------------------------------------------------
function junk.drawText()
	local Font = love.graphics.getFont()

	draw.color "brown"
	love.graphics.polygon('fill', 0, 0, 200, 100, 150, 200)

	local text = "Hello World"
	local box_width = 350
	local text_width = Font:getWidth( text )
	
	draw.color "white"

	draw.vline( box_width )

	local align = "center"
    love.graphics.printf( text, 0, 0, box_width, align )
	draw.color "gold"
    love.graphics.print( "o", draw.hotkeyOffset( Font, text, "o" ) + draw.alignOffset( box_width, text_width, align ), 0 )
    
	draw.color "green"
    draw.hline( Font:getBaseline() )
    draw.color "red"
    draw.hline( Font:getHeight() - Font:getBaseline() )
	draw.color "yellow"
    draw.hline( Font:getHeight() )
    draw.vline( Font:getWidth( text ) )
end

-------------------------------------------------------------------------------
return junk
