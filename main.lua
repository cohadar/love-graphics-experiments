
local Font = nil

local rgb = require "rgb"

local OFFSET_X = 100
local OFFSET_Y = 100
local BASELINE = 0

-------------------------------------------------------------------------------
function love.load()
	--Font = love.graphics.newFont( "OpenSans-Regular.ttf", 100 )
	Font = love.graphics.newFont( "Crimson-Bold.ttf", 100 )
	love.graphics.setFont( Font )
	BASELINE = OFFSET_Y + Font:getBaseline()
end

-------------------------------------------------------------------------------
local function setColor( name )
	local color = rgb[ name ]
	if color then
		love.graphics.setColor( color.r, color.g, color.b )
	else
		error( "bad color name: " .. name )
	end
end

-------------------------------------------------------------------------------
function drawLine( y, color )
    setColor( color )
    love.graphics.line( 0, BASELINE - y, 800, BASELINE - y )	
end

-------------------------------------------------------------------------------
function love.draw()
	setColor "white"

    love.graphics.print( "Hello ypqjg", OFFSET_X, OFFSET_Y )
    
    drawLine( Font:getAscent(), "red" )
    drawLine( 0, "green" )
    drawLine( Font:getDescent(), "blue" )
    drawLine( Font:getHeight(), "yellow" )
end

-------------------------------------------------------------------------------
function love.keypressed( key )
	if key == "escape" then
		love.event.quit()
	end
end