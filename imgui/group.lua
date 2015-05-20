--- @module vline

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )
local group = {}

-------------------------------------------------------------------------------
-- vertically allign all elements
-------------------------------------------------------------------------------
function group.v_align( elements, align, x )
	x = x or style.getCenterX()
	if align == "left" then
		for _, rect in ipairs( elements ) do 
			rect.x = x
		end
	elseif align == "right" then
		for _, rect in ipairs( elements ) do 
			rect.x = x - rect.w
		end
	elseif align == "center" then
		for _, rect in ipairs( elements ) do 
			rect.x = x - rect.w / 2 
		end
	else
		error( "group.v_align invalid align: " .. tostring( align ) )
	end	
end

-------------------------------------------------------------------------------
-- horizontally allign all elements
-------------------------------------------------------------------------------
function group.h_align( elements, align, y )
	y = y or style.getCenterY()
	if align == "top" then
		for _, rect in ipairs( elements ) do 
			rect.y = y
		end
	elseif align == "bottom" then
		for _, rect in ipairs( elements ) do 
			rect.y = y - rect.h
		end
	elseif align == "center" then
		for _, rect in ipairs( elements ) do 
			rect.y = y - rect.h / 2 
		end
	else
		error( "group.h_align invalid align: " .. tostring( align ) )
	end	
end

-------------------------------------------------------------------------------
-- arrange elements from top to bottom with vertical spacing in between
-------------------------------------------------------------------------------
function group.v_distribute( elements, spacing )
	if spacing and elements[ 1 ] then
		local y = elements[ 1 ].y
		for _, rect in ipairs( elements ) do 
			rect.y = y
			y = y + rect.h + spacing
		end
	end		
end

-------------------------------------------------------------------------------
-- make all elements have same width
-------------------------------------------------------------------------------
function group.stretch_w( elements )
	local w = 0
	for _, rect in ipairs( elements ) do 
		w = math.max( w, rect.w )
	end	
	for _, rect in ipairs( elements ) do 
		rect.w = w
	end		
end

-------------------------------------------------------------------------------
-- returns the arithmetic center of group
-------------------------------------------------------------------------------
function group.get_center( elements )
	local cx = 0
	local cy = 0
	local n = 0
	for _, rect in ipairs( elements ) do 
		cx = cx + rect.x + rect.w / 2
		cy = cy + rect.y + rect.h / 2
		n = n + 1
	end	
	if n == 0 then
		return style.getCenterX(), style.getCenterY()
	else 
		return math.floor( cx / n ), math.floor( cy / n )
	end
end

-------------------------------------------------------------------------------
-- centers whole group on screen; preserves element distances 
-------------------------------------------------------------------------------
function group.center_on_screen( elements )
	local sx, sy = style.getCenterX(), style.getCenterY()
	local dx, dy = group.get_center( elements )
	for _, rect in ipairs( elements ) do 
		local rx = rect.x + rect.w / 2
		local ry = rect.y + rect.h / 2
		rect.x = math.floor( rect.x + sx - dx ) 
		rect.y = math.floor( rect.y + sy - dy )
	end	
end

-------------------------------------------------------------------------------
return group
