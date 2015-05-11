---  @module HSV
local hsv = {}
local rgb = require "rgb"
require "color"

-------------------------------------------------------------------------------
local matrix = {}

-------------------------------------------------------------------------------
local function sortByH( a, b )
	return a.h < b.h
end

-------------------------------------------------------------------------------
local function sortByS( a, b )
	return a.s < b.s
end

-------------------------------------------------------------------------------
local function sortByV( a, b )
	return a.v < b.v
end

-------------------------------------------------------------------------------
local sortBy = { h = sortByH, s = sortByS, v = sortByV }

-------------------------------------------------------------------------------
local function none( a, b )
	return false
end

-------------------------------------------------------------------------------
local sortsub_start = 0
local function sortsub( arr, length, sortf )
	local start = sortsub_start
	for i = 0, length - 2 do
		for j = i + 1, length - 1 do
			if sortf( arr[ start + i ], arr[ start + j ] ) then
				local temp = arr[ start + i ]
				arr[ start + i ] = arr[ start + j ]
				arr[ start + j ] = temp
			end
		end	
	end
	sortsub_start = sortsub_start + length
end

-------------------------------------------------------------------------------
local regions = {}
regions[ 1 ] = 14
regions[ 2 ] = 15
regions[ 3 ] = 15
regions[ 4 ] = 15
regions[ 5 ] = 14

-------------------------------------------------------------------------------
function hsv.init()
	for name, v in pairs( rgb ) do 
		v.h, v.s, v.v  = rgbToHsv( v.r, v.g, v.b, 255 )
		v.s = v.s or 0
		v.name = name
		table.insert( matrix, v )
	end	
end	

-------------------------------------------------------------------------------
local function index( x, y )
	assert( x > 0 )
	assert( y > 0 )
	return ( y - 1 ) * 13 + x
end

-------------------------------------------------------------------------------
function hsv.getColorName( x, y )
	return matrix[ index( x, y ) ].name
end

-------------------------------------------------------------------------------
function hsv.printHTML()
	for y = 1, 73 do
		for x = 1, 13 do 
			local v = matrix[ index( x, y ) ]
			if v.r + v.g + v.b < 128 * 3 then
				fgcolor = "FFFFFF"
			else
				fgcolor = "000000"
			end
			local hex = string.format( "%02X%02X%02X", v.r, v.g, v.b )
			local text = hex .. "<br/>" .. v.name
			local td = string.format('  <td style="color:#%s;background:#%s;">%s</td>', fgcolor, hex, text )
			print( td )
		end
 		print("</tr>")
  		print("<tr>")
	end
end

-------------------------------------------------------------------------------
local function manual()
	local by = "svh"
	local a = string.sub( by, 1, 1 )
	local b = string.sub( by, 2, 2 )
	local c = string.sub( by, 3, 3 ) 
	SCREENSHOT = "hsv_sortedby_"..a.."_than_"..b.."_than_"..c..".png"	
	return a, b, c
end

-------------------------------------------------------------------------------
function hsv.sort()
	local a, b, c = manual()

	table.sort( matrix, sortBy[ a ] )

	sortsub_start = 1
	for _, reg in ipairs( regions ) do
		sortsub( matrix, 13*reg, sortBy[ b ] )
	end

	sortsub_start = 1
	for _, reg in ipairs( regions ) do
		for i = 1, 13 do 
			sortsub( matrix, reg, sortBy[ c ] )
		end
	end	
end



-------------------------------------------------------------------------------
return hsv
