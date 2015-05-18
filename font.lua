--- @module font

local font = {}

font.DEFAULT_FONT_SIZE = 12

local _nameMap = {}
local _sizeMap = {}
local _fontCache = {}

-------------------------------------------------------------------------------
local function key( fontName, fontSize )
	return fontName .. "#" .. fontSize
end

-------------------------------------------------------------------------------
function font.declare( fontName, fileName, fontSize )
	_nameMap[ fontName ] = fileName
	fontSize = fontSize or font.DEFAULT_FONT_SIZE
	_sizeMap[ fontName ] = fontSize
	local font = love.graphics.newFont( fileName, fontSize )
	_fontCache[ key( fontName, fontSize ) ] = font
end

-------------------------------------------------------------------------------
function font.set( fontName, fontSize )
	if _nameMap[ fontName ] == nil then
		error( ' font never declared: "' .. fontName .. '"' ) 
	end
	fontSize = fontSize or _sizeMap[ fontName ] or font.DEFAULT_FONT_SIZE
	local k = key( fontName, fontSize )
	if _fontCache[ k ] == nil then
		_fontCache[ k ] = love.graphics.newFont( _nameMap[ fontName ], fontSize )
	end
	love.graphics.setFont( _fontCache[ k ] )
	return _fontCache[ k ]
end

-------------------------------------------------------------------------------
return font
