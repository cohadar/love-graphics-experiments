--- @module slider

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )
local FPS = 60

-------------------------------------------------------------------------------
slider = function( x, y, width, height, size, value )
	local id = core.nextId()
	
	local percent = value / ( size - 1 )
	if percent < 0.0 then
		percent = 0.0
	end
	if percent > 1.0 then
		percent = 1.0
	end
	value = math.floor( percent * ( size - 1 ) + 0.5 )

	core.checkRegion( id, x, y, width, height )

	style.drawSlider( x, y, width, height, core.isHot( id ), core.isActive( id ), percent )

	-- Update widget value
	if core.isActive( id ) then
    	local mousepos = math.floor( core.getMouseY() - y )
    	if mousepos < 0 then
    		mousepos = 0
    	end
    	if mousepos > height then 
    		mousepos = height
    	end
    	local percent = mousepos / height
    	local v = math.floor( percent * ( size - 1 ) + 0.5 )
    	if v ~= value then
  		    value = v
      		return true, value
   		end
   	end
   	local wh = core.wheel( id )
   	if wh ~= 0 then
   		if math.abs( wh ) == 1 then
   			value = value + wh
   		else
   			value = value + wh * math.floor( 1 + size * 0.01 )
   		end
	   	if value < 0 then
	   		value = 0
	   	end
	   	if value > size - 1 then
	   		value = size - 1
	    end
	end
   	return false, value
end

-------------------------------------------------------------------------------
return slider