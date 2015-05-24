--- @module grid9
local grid9 = {}

-------------------------------------------------------------------------------
local function topLeft( source, top, right, bottom, left )
	local sx = 0
	local sy = 0
	local sw = left
	local sh = top
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function topCenter( source, top, right, bottom, left )
	local sx = left 
	local sy = 0
	local sw = source:getWidth() - left - right
	local sh = top
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function topRight( source, top, right, bottom, left )
	local sx = source:getWidth() - right 
	local sy = 0
	local sw = right
	local sh = top
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function bottomLeft( source, top, right, bottom, left )
	local sx = 0
	local sy = source:getHeight() - bottom 
	local sw = left
	local sh = bottom
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function bottomCenter( source, top, right, bottom, left )
	local sx = left
	local sy = source:getHeight() - bottom 
	local sw = source:getWidth() - left - right
	local sh = bottom
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function bottomRight( source, top, right, bottom, left )
	local sx = source:getWidth() - right 
	local sy = source:getHeight() - bottom 
	local sw = right
	local sh = bottom
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function leftCenter( source, top, right, bottom, left )
	local sx = 0
	local sy = top
	local sw = left
	local sh = source:getHeight() - top - bottom
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function rightCenter( source, top, right, bottom, left )
	local sx = source:getWidth() - right 
	local sy = top
	local sw = right
	local sh = source:getHeight() - top - bottom
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
local function center( source, top, right, bottom, left )
	local sx = left
	local sy = top
	local sw = source:getWidth() - left - right
	local sh = source:getHeight() - top - bottom
	local ret = love.image.newImageData( sw, sh )
	ret:paste( source, 0, 0, sx, sy, sw, sh )
	return love.graphics.newImage( ret )
end

-------------------------------------------------------------------------------
-- brakes an image into a grid of 9 images
-------------------------------------------------------------------------------
function grid9.fromImageData( imageData, top, right, bottom, left )
	assert( top > 0 )
	assert( right > 0 )
	assert( bottom > 0 )
	assert( left > 0 )
	assert( left < imageData:getWidth() )
	assert( right < imageData:getWidth() )
	assert( top < imageData:getHeight() )
	assert( bottom < imageData:getHeight() )
	assert( imageData:getWidth() - left - right > 0 )
	assert( imageData:getHeight() - top - bottom > 0 )
	local ret = {}
	ret[ "top-left" ]  = topLeft(   imageData, top, right, bottom, left )
	ret[ "top" ]       = topCenter( imageData, top, right, bottom, left )
	ret[ "top-right" ] = topRight(  imageData, top, right, bottom, left )
	ret[ "bottom-left" ]  = bottomLeft(   imageData, top, right, bottom, left )
	ret[ "bottom" ]       = bottomCenter( imageData, top, right, bottom, left )
	ret[ "bottom-right" ] = bottomRight(  imageData, top, right, bottom, left )
	ret[ "left" ] = leftCenter(  imageData, top, right, bottom, left )
	ret[ "right" ] = rightCenter(  imageData, top, right, bottom, left )
	ret[ "center" ] = center(  imageData, top, right, bottom, left )
	return ret
end 

-------------------------------------------------------------------------------
function grid9.fromFile( fileName, top, right, bottom, left )
	local image = love.graphics.newImage( fileName )
	return grid9.fromImageData( image:getData(), top, right, bottom, left )
end

-------------------------------------------------------------------------------
-- draws grid image stretched to w, h ( or larger ), returns drawn w, h
-------------------------------------------------------------------------------
function grid9.draw( self, x, y, w, h )
	local left   = self[ "left" ]:getWidth()
	local right  = self[ "right" ]:getWidth()
	local top    = self[ "top" ]:getHeight()
	local bottom = self[ "bottom" ]:getHeight()
	local cw = math.max( w, left + right + 1 ) - left - right
	local ch = math.max( h, top + bottom + 1 ) - top - bottom
	local sx = cw / self[ "center" ]:getWidth()
	local sy = ch / self[ "center" ]:getHeight()
	love.graphics.draw( self[ "top-left" ], x, y )
	love.graphics.draw( self[ "top" ], x + left, y, 0.0, sx, 1.0 )
	love.graphics.draw( self[ "top-right" ], x + left + cw, y )
	love.graphics.draw( self[ "left" ], x, y + top, 0.0, 1.0, sy )
	love.graphics.draw( self[ "center" ], x + left, y + top, 0.0, sx, sy )
	love.graphics.draw( self[ "right" ], x + left + cw, y + top, 0.0, 1.0, sy )
	love.graphics.draw( self[ "bottom-left" ], x, y + top + ch )
	love.graphics.draw( self[ "bottom" ], x + left, y + top + ch, 0.0, sx, 1.0 )
	love.graphics.draw( self[ "bottom-right" ], x + left + cw, y + top + ch )
	return left + cw + right, top + ch + bottom
end

-------------------------------------------------------------------------------
return grid9
