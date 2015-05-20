--- @module junk
local junk = {}

local draw = require "draw"
local font = require "font"

-------------------------------------------------------------------------------
function junk.drawText()
	-- main text
	local Font = font.set( "input", 60 )
	Font:setLineHeight(1.2)
	local box_width = 300	
	local text = "Hylgo World trla baba lan da joj prodje dan"
	local text_width = Font:getWidth( text )
	local align = "center"
	draw.color "white"
    love.graphics.printf( text, 0, 0, box_width, align )
    -- hotkey
	draw.color "gold"
    love.graphics.print( "o", draw.hotkeyOffset( Font, text, "o" ) + draw.alignOffset( box_width, text_width, align ), 0 )

    -- box
    font.set( "default", 14 )
    draw.color "red"
	draw.vline( box_width )
	draw.print( "box_width: " .. box_width, box_width + 5, 500 )

    local baseline = Font:getBaseline()
	draw.color "green"
    draw.hline( baseline )
    draw.print( "baseline: " .. baseline, box_width + 5, baseline - 18 )

    local baseline2 = baseline + Font:getHeight() * Font:getLineHeight()
	draw.color "green"
    draw.hline( baseline2 )
    draw.print( "baseline2 = baseline + Font:getHeight() * Font:getLineHeight()", box_width + 5, baseline2 - 18 )

    print( "ascent " .. Font:getAscent() )
    print( "baseline " .. Font:getBaseline() )
    print( "descent " .. Font:getDescent() )
    print( "height " .. Font:getHeight() )
    print( "line_height " .. Font:getLineHeight() )
    print( "em " .. Font:getWidth( "M" ) )
end

-------------------------------------------------------------------------------
return junk
