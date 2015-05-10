--- @module junk
local junk = {}

local utils = require "utils"

local setcolor = utils.setcolor
local drawLineV = utils.drawLineV
local drawLineH = utils.drawLineH
local hotkeyOffset = utils.hotkeyOffset
local alignOffset = utils.alignOffset

-------------------------------------------------------------------------------
function junk.drawText()
	local Font = love.graphics.getFont()

	setcolor "brown"
	love.graphics.polygon('fill', 0, 0, 200, 100, 150, 200)

	local text = "Hello iwiwiw"
	local box_width = 350
	local text_width = Font:getWidth( text )
	
	setcolor "white"

	drawLineV( box_width )

	local align = "center"
    love.graphics.printf( text, 0, 0, box_width, align )
    setcolor "gold"
    love.graphics.print( "w", hotkeyOffset( Font, text, "w" ) + alignOffset( box_width, text_width, align ), 0 )
    
    setcolor "green"
    drawLineH( Font:getBaseline() )
    setcolor "red"
    drawLineH( Font:getHeight() - Font:getBaseline() )
    setcolor "yellow"
    drawLineH( Font:getHeight() )
    drawLineV( Font:getWidth( text ) )
end

-------------------------------------------------------------------------------
return junk
