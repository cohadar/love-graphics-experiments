--- @module matrix_test
local matrix_test = {}

local Matrix = require "Matrix"

-------------------------------------------------------------------------------
function matrix_test.run()
	local matrix = Matrix:new( 13, 17 )
	assert( matrix:getSizeX() == 13 )
	assert( matrix:getSizeY() == 17 )

	for x = 1, 13 do
		for y = 1, 17 do
			matrix:setValueOnXY( x, y, x + y )
		end
	end

	local i = 1
	for y = 1, 17 do
		for x = 1, 13 do
			str = string.format( "x=%d, y=%d, i=%d", x, y, i )
			assert( matrix:getIndex( x, y ) == i, str )
			matrix:setValueOnXY( x, y, x + y )
			assert( matrix:getValueOnIndex( i ) == x + y )
			i = i + 1
		end
	end	
end

-------------------------------------------------------------------------------
return matrix_test
