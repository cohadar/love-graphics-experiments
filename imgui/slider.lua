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
local function getPercentFromMouse( uistate, y, height )
    local mousepos = math.floor( uistate.mousey - y )
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
local function wheel( id, uistate )
    if uistate.hotitem == id then
        return uistate.mousewheel
    end
    return 0
end

-------------------------------------------------------------------------------
local function valueRebound( value, size )
    if value < 0 then
        return 0
    end
    if value > size - 1 then
        return size - 1
    end
    return value
end

-------------------------------------------------------------------------------
local function getValueFromWheel( id, uistate, value, size )
    local wh = wheel( id, uistate )
    if wh ~= 0 then
        if math.abs( wh ) == 1 then
            value = value + wh
        else
            value = value + wh * math.floor( 1 + size * 0.01 )
        end
        value = valueRebound( value, size )
    end
    return value
end

-------------------------------------------------------------------------------
local function keyboardOn( id, uistate, value, size )
    if uistate.kbditem == 0 then
        uistate.kbditem = id
    end     
    if uistate.kbditem == id then
        if uistate.keyentered == "tab" then
            uistate.keyentered = 0
            uistate.kbditem = 0
            if love.keyboard.isDown( "lshift" ) or love.keyboard.isDown( "rshift" ) then
                uistate.kbditem = uistate.lastwidget
            end
        elseif uistate.keyentered == "up" then
            uistate.keyentered = 0
            return valueRebound( value - 1, size )
        elseif uistate.keyentered == "down" then
            uistate.keyentered = 0
            return valueRebound( value + 1, size )
        elseif uistate.keyentered == "pageup" then
            uistate.keyentered = 0
            return valueRebound( value - 5 * math.floor( 1 + size * 0.01 ), size )
        elseif uistate.keyentered == "pagedown" then
            uistate.keyentered = 0
            return valueRebound( value + 5 * math.floor( 1 + size * 0.01 ), size )            
        end
    end
    uistate.lastwidget = id;
    return value
end

-------------------------------------------------------------------------------
slider = function( x, y, width, height, size, value )
    local id, uistate = core.nextId()
    local percent = getPercentFromValue( value, size )
    value = getValueFromPercent( percent, size )
    core.checkRegion( id, x, y, width, height )
    local mod = core.getMods( id )
    style.drawSlider( x, y, width, height, mod, percent )
    -- Update widget value
    if mod.active then
        local percent = getPercentFromMouse( uistate, y, height )
        local v = getValueFromPercent( percent, size )
        if v ~= value then
            return true, v
        end
    elseif mod.hot then
        local v = getValueFromWheel( id, uistate, value, size )
        if v ~= value then
            return true, v
        end        
    end
    local v = keyboardOn( id, uistate, value, size )
    if v ~= value then
        return true, v
    end        
    return false, value
end

-------------------------------------------------------------------------------
return slider