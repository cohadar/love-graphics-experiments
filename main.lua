
local Font = nil

local rgb = require "rgb"
local conf = require "conf"
local imgui = require "imgui"
local gui = require "gui"
local utils = require "utils"
local junk = require "junk"
local draw = require "draw"
local text = require "text"
require "color"

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

local arr = {}

-------------------------------------------------------------------------------
function sortByH( a, b )
	return a.h < b.h
end

-------------------------------------------------------------------------------
function sortByS( a, b )
	return a.s < b.s
end

-------------------------------------------------------------------------------
function sortByL( a, b )
	return a.l < b.l
end

-------------------------------------------------------------------------------
function none( a, b )
	return false
end

function sortsub( arr, start, sortf )
	for i = 1, 72 do
		for j = i, 73 do
			if sortf( arr[ start + i ], arr[ start + j ] ) then
				local temp = arr[ start + i ]
				arr[ start + i ] = arr[ start + j ]
				arr[ start + j ] = temp
			end
		end	
	end
end

-------------------------------------------------------------------------------
function love.load()
	--Font = love.graphics.newFont( "OpenSans-Regular.ttf", 50 )
	Font = love.graphics.newFont( "Inconsolata.otf", 16 )
	--Font = love.graphics.getFont( 20 )
	--Font:setLineHeight( 0.6 )
	love.graphics.setFont( Font )
	--rescale()

	local maxname = 0

	local count = 0
	for name, v in pairs( rgb ) do 
		v.h, v.s, v.l  = rgbToHsl( v.r, v.g, v.b, 255 )
		v.v = v.v or 0
		v.name = name
		table.insert( arr, v )
		count = count + 1
		if string.len(name) > maxname then
			maxname = string.len(name)
		end
	end
	--print("maxname", maxname)  -----------------##################################
	table.sort( arr, sortByL )
	for i = 0, 12 do 
		sortsub( arr, i*73, sortByH )
	end

	arrT = {}
	for i = 0, 12 do
		for j = 0, 72 do
			arrT[ j * 13 + i + 1 ] = arr[ i * 73 + j + 1 ] 
		end
	end

 	local BLOCK = 16
 	local ix, iy = 0, 0
 	for i, v in ipairs( arrT ) do
 		if v.r + v.g + v.b < 128 * 3 then
	 		fgcolor = "FFFFFF"
	 	else
	 		fgcolor = "000000"
	 	end
	 	local hex = string.format( "%02X%02X%02X", v.r, v.g, v.b )
 		local text = hex .. "<br/>" .. v.name
 		local td = string.format('  <td style="color:#%s;background:#%s;">%s</td>', fgcolor, hex, text )
 		print( td )


 		iy = iy + 1
 		if iy > 12 then
 			iy = 0
 			ix = ix + 1
 			print("</tr>")
  			print("<tr>")
 		end
 	end	
end

-------------------------------------------------------------------------------
function love.draw()
	-- love.graphics.scale( conf.SCALE_GRAPHICS )
	-- --love.graphics.translate( OFFSET_X, OFFSET_Y )

	-- draw.fontSize( 50 )
	-- junk.drawText()
	-- imgui.prepare()

	-- if imgui.button( 200, 150 ) then
	-- 	text.print(" a ")
	-- end
 
 -- 	if imgui.button( 200, 200 ) then
 -- 		text.print(" b ")
	-- end

	-- imgui.printState( 10, 180 )
 -- 	imgui.finish()

 -- 	text.draw()

 	local BLOCK = 16
 	local ix, iy = 0, 0
 	for i, v in ipairs( arr ) do

 		draw.rect( ix * 240, iy * BLOCK, 240, BLOCK, v.name )
 		if v.r + v.g + v.b < 128 * 3 then
	 		draw.color "white"
	 	else
	 		draw.color "black"
	 	end
	 	local hex = string.format( "%02X%02X%02X", v.r, v.g, v.b )
 		draw.print( hex .. " - " .. v.name, ix * 240 + 2, iy * BLOCK )

 		iy = iy + 1
 		if iy > 72 then
 			iy = 0
 			ix = ix + 1
 		end
 	end
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
		imageData:encode( "screenshot.png", "png" )
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
