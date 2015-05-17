
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
	imgui.init()
end

-------------------------------------------------------------------------------
function love.draw()
	love.graphics.scale( conf.SCALE_GRAPHICS )
	junk.drawText()

	imgui.prepare()

	gui.draw()

	imgui.finish()

	font.set( "default", 24 )
	love.graphics.print( "The Quick Brown Fox Jumps Over a Lazy Dog.", 100, 300 )
	text.draw()
end

-------------------------------------------------------------------------------
function love.keypressed( key, isrepeat )
	if key == "escape" then
		love.event.quit()
	elseif key == "up" or key == "w" then
		local old_width = love.graphics.getWidth() / conf.SCALE_GRAPHICS
		local old_height = love.graphics.getHeight() / conf.SCALE_GRAPHICS
		if conf.SCALE_GRAPHICS < 1 then
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS * 2
		else
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS + 1
		end
		rescale( old_width , old_height )
	elseif key == "down" or key == "s" then
		local old_width = love.graphics.getWidth() / conf.SCALE_GRAPHICS
		local old_height = love.graphics.getHeight() / conf.SCALE_GRAPHICS
		if conf.SCALE_GRAPHICS > 1 then
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS - 1
		else
			conf.SCALE_GRAPHICS = conf.SCALE_GRAPHICS / 2
		end
		rescale( old_width , old_height )
	elseif key == "p" then
		imageData = love.graphics.newScreenshot( )
		imageData:encode( SCREENSHOT, "png" )
	end
	imgui.keypressed( key, isrepeat )
end

-------------------------------------------------------------------------------
function love.keyreleased( key )
	imgui.keyreleased( key )
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
