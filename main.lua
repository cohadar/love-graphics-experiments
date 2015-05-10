
local Font = nil

local rgb = require "rgb"
local conf = require "conf"
local imgui = require "imgui"
local gui = require "gui"

local OFFSET_X = 50
local OFFSET_Y = 50

-------------------------------------------------------------------------------
local function rescale()
	love.window.setMode( 
		conf.SCREEN_WIDTH * conf.SCALE_GRAPHICS, 
		conf.SCREEN_HEIGHT * conf.SCALE_GRAPHICS, 
		{ vsync = true, resizable = false } 
	)	
	love.window.setTitle( string.format( "%d x %d, scale=%.2f", conf.SCREEN_WIDTH, conf.SCREEN_HEIGHT, conf.SCALE_GRAPHICS ) )
end

-------------------------------------------------------------------------------
function love.load()
	--Font = love.graphics.newFont( "OpenSans-Regular.ttf", 50 )
	Font = love.graphics.newFont( "Crimson-Bold.ttf", 50 )
	Font:setLineHeight( 0.6 )
	love.graphics.setFont( Font )
	rescale()
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
function drawLineH( y, color )
    setColor( color )
    love.graphics.line( 0, y, conf.SCREEN_WIDTH, y )	
end

-------------------------------------------------------------------------------
function drawLineV( x, color )
    setColor( color )
    love.graphics.line( x, 0, x, conf.SCREEN_HEIGHT  )	
end


-------------------------------------------------------------------------------
function hotkeyOffset( font, text, char )
	local a, b = string.find( text, char )
	local pretext = string.sub( text, 1, a )
	return Font:getWidth( pretext ) - Font:getWidth( char )
end

-------------------------------------------------------------------------------
function alignOffset( box_width, text_width, align )
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
function love.draw()
	love.graphics.scale( conf.SCALE_GRAPHICS )
	love.graphics.translate( OFFSET_X, OFFSET_Y )

	setColor "brown"
	love.graphics.polygon('fill', 0, 0, 200, 100, 150, 200)

	local text = "Hello iwiwiw"
	local box_width = 350
	local text_width = Font:getWidth( text )
	drawLineV( box_width, "white" )
	local align = "center"
    love.graphics.printf( text, 0, 0, box_width, align )
    setColor "gold"
    love.graphics.print( "w", hotkeyOffset(Font, text, "w") + alignOffset( box_width, text_width, align ), 0 )
    
    drawLineH( Font:getBaseline(), "green" )
    drawLineH( Font:getHeight() - Font:getBaseline(), "red" )
    drawLineH( Font:getHeight(), "yellow" )
    drawLineV( Font:getWidth( text ), "yellow" )
end

-------------------------------------------------------------------------------
function love.keypressed( key )
	if key == "escape" then
		love.event.quit()
	elseif key == "up" or key == "w" then
		if conf.SCALE_GRAPHICS < 1 then
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS * 2
		else
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS + 1
		end
		rescale()
	elseif key == "down" or key == "s" then
		if conf.SCALE_GRAPHICS > 1 then
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS - 1
		else
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS / 2
		end
		rescale()
	end
end