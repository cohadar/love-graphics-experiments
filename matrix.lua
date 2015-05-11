--- @module matrix
local class = require 'middleclass'
local Matrix = class( "Matrix" )

-------------------------------------------------------------------------------
function Matrix:initialize( size_x, size_y, defaultValue )
	assert( size_x > 0 )
	assert( size_y > 0 )
	self.size_x = size_x
	self.size_y = size_y
	self.data = {}
	for y = 1, size_y do
		for x = 1, size_x do
			self.data[ self:getIndex( x, y ) ] = defaultValue
		end
	end
end

-------------------------------------------------------------------------------
function Matrix:getIndex( x, y )
	assert( x > 0 )
	assert( y > 0 )
	return ( y - 1 ) * self.size_x + x
end

-------------------------------------------------------------------------------
function Matrix:getSizeX()
	return self.size_x
end

-------------------------------------------------------------------------------
function Matrix:getSizeY()
	return self.size_y
end

-------------------------------------------------------------------------------
function Matrix:getLength()
	return self.size_x * self.size_y
end

-------------------------------------------------------------------------------
function Matrix:getValueOnXY( x, y )
	assert( x > 0 )
	assert( y > 0 )
	return self.data[ self:getIndex( x, y ) ]
end

-------------------------------------------------------------------------------
function Matrix:setValueOnXY( x, y, value )
	assert( x > 0 )
	assert( y > 0 )
	self.data[ self:getIndex( x, y ) ] = value
end

-------------------------------------------------------------------------------
function Matrix:getValueOnIndex( index )
	assert( index > 0 )
	return self.data[ index ]
end

-------------------------------------------------------------------------------
function Matrix:setValueOnIndex( index, value )
	assert( index > 0 )	
	self.data[ index ] = value
end

-------------------------------------------------------------------------------
return Matrix

