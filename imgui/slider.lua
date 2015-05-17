--- @module slider

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )
local FPS = 60

-------------------------------------------------------------------------------
local function getValueFromPercent( percent, size )
  return math.floor( percent * ( size - 1 ) + 0.5 )
end

-------------------------------------------------------------------------------
local function getPercentFromValue( value, size )
    local percent = value / ( size - 1 )
    if percent < 0.0 then
       percent = 0.0
    end
    if percent > 1.0 then
       percent = 1.0
    end
    return percent
end  

-------------------------------------------------------------------------------
local function getPercentFromMouse( y, height )
    local mousepos = math.floor( core.getMouseY() - y )
    if mousepos < 0 then
        mousepos = 0
    end
    if mousepos > height then 
        mousepos = height
    end
    local percent = mousepos / height
    return percent
end

-------------------------------------------------------------------------------
local function getValueFromWheel( id, value, size )
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
    return value
end

-------------------------------------------------------------------------------
slider = function( x, y, width, height, size, value )
    local id = core.nextId()
    local percent = getPercentFromValue( value, size )
    value = getValueFromPercent( percent, size )
    core.checkRegion( id, x, y, width, height )
    local mod = core.getMods( id )
    style.drawSlider( x, y, width, height, mod, percent )
    -- Update widget value
    if mod.active then
        local percent = getPercentFromMouse( y, height )
        local v = getValueFromPercent( percent, size )
        if v ~= value then
            return true, v
        end
    elseif mod.hot then
        local v = getValueFromWheel( id, value, size )
        if v ~= value then
            return true, v
        end        
    end
    return false, value
end

-------------------------------------------------------------------------------
return slider