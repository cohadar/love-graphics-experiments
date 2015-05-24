
local Font = nil

local rgb = require "rgb"
local conf = require "conf"
local imgui = require "imgui"
local gui = require "gui"
local utils = require "utils"
local junk = require "junk"
local draw = require "draw"
local text = require "text"
local font = require "font"

local OFFSET_X = 50
local OFFSET_Y = 50

-------------------------------------------------------------------------------
local function rescale( old_width, old_height )
	love.window.setMode( 
		old_width * conf.SCALE_GRAPHICS, 
		old_height * conf.SCALE_GRAPHICS, 
		{ vsync = true, resizable = true } 
	)	
	love.resize( love.graphics.getWidth(), love.graphics.getHeight() )
end

-------------------------------------------------------------------------------
function love.resize( width, height )
	width  = math.floor( width / conf.SCALE_GRAPHICS )
	height = math.floor( height / conf.SCALE_GRAPHICS )
	love.window.setTitle( string.format( "%d x %d, scale=%.2f", width, height, conf.SCALE_GRAPHICS ) )	
end

-------------------------------------------------------------------------------
function love.load()
	font.declare( "default", "fonts/apache/opensans/OpenSans-Regular.ttf", 14 )
	font.set( "default" )
	--font.declare( "input", "fonts/ofl/inconsolata/Inconsolata-Regular.ttf", 14 )
	font.declare( "input", "fonts/ofl/ptmono/PTM55FT.ttf", 14 )
	imgui.init()
	--local image = love.graphics.newImage( fileName )
	button_grid = imgui.grid9.fromFile( "resources/button.png", 10, 10, 10, 10 )
	for _, image in pairs(button_grid) do 
		if image.setFilter then
			image:setFilter(  "nearest", "nearest" )
		end
	end
	love.graphics.setBackgroundColor(128, 128, 64)
	love.graphics.setDefaultFilter( "nearest", "nearest" )
end

-------------------------------------------------------------------------------
local function setColor( name, alpha )
	local color = rgb[ name ]
	if color then
		love.graphics.setColor( color.r, color.g, color.b, alpha )
	else
		error( "bad color name: " .. name )
	end
end

-------------------------------------------------------------------------------
function love.draw()
	love.graphics.scale( conf.SCALE_GRAPHICS )

	--junk.drawText()

	imgui.prepare()

	gui.draw()

	imgui.finish()

	text.draw()

	setColor "white"

	-- local x = 0
	-- local y = 0
	-- for _, img in pairs( button_grid ) do 
	-- 	love.graphics.draw( img, x, y)
	-- 	x = x + 10 + img:getWidth()
	-- 	if x > 170 then
	-- 		y = y + 64
	-- 		x = 0
	-- 	end
	-- end
	--love.graphics.draw( button_grid[ "top-left" ] )
	--love.graphics.draw( button_grid[ "top" ])
	--love.graphics.draw( button_grid[ "top-right" ], 0, 0)
	imgui.grid9.draw( button_grid, 0, 0, 120, 100 )
	draw.hline(100.5)
	draw.vline(120.5)

end

-------------------------------------------------------------------------------
function love.keypressed( key, isrepeat )
	if key == "escape" then
		love.event.quit()
	end
	imgui.keypressed( key, isrepeat )
end

-------------------------------------------------------------------------------
function love.keyreleased( key )
	imgui.keyreleased( key )
end

-------------------------------------------------------------------------------
function love.textinput( text )
	imgui.textinput( text )
end

-------------------------------------------------------------------------------
function love.mousepressed( x, y, button )
	imgui.mousepressed( x, y, button )
end

-------------------------------------------------------------------------------
function love.mousereleased( x, y, button )
	imgui.mousereleased( x, y, button )
end

-------------------------------------------------------------------------------
function love.mousemoved( x, y, dx, dy )
	imgui.mousemoved( x, y, dx, dy )
end
