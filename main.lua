
local Font = nil

local rgb = require "rgb"
local conf = require "conf"
local imgui = require "imgui"
local gui = require "gui"
local utils = require "utils"
local junk = require "junk"
local draw = require "draw"
local text = require "text"

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
	Font = love.graphics.newFont( "Inconsolata.otf", 50 )
	--Font = love.graphics.getFont( 20 )
	--Font:setLineHeight( 0.6 )
	love.graphics.setFont( Font )
	rescale()
end

-------------------------------------------------------------------------------
function love.draw()
	love.graphics.scale( conf.SCALE_GRAPHICS )
	junk.drawText()

	imgui.prepare()

	gui.draw()

	imgui.finish()
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
	elseif key == "p" then
		imageData = love.graphics.newScreenshot( )
		imageData:encode( SCREENSHOT, "png" )
	end
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
