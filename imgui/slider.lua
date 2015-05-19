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
    local wh = uistate.mousewheel
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
    if core.hasKeyboardFocus( id ) then
        if uistate.keyentered == "up" then
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
    return value
end

-------------------------------------------------------------------------------
function slider( self )
    local id, uistate = core.nextId()
    self.percent = getPercentFromValue( self.value, self.size )
    self.value = getValueFromPercent( self.percent, self.size )
    core.checkRect( id, self )
    local mod = core.getMods( id )
    style.drawSlider( self, mod )
    -- Update widget value
    local v = keyboardOn( id, uistate, self.value, self.size )
    if v ~= self.value then
        self.value = v
        return true
    end       
    if mod.active then
        local percent = getPercentFromMouse( uistate, self.y, self.h )
        local v = getValueFromPercent( percent, self.size )
        if v ~= self.value then
            self.value = v
            return true
        end  
    end
    if mod.hot or mod.focus then
        local v = getValueFromWheel( id, uistate, self.value, self.size )
        if v ~= self.value then
            self.value = v
            return true
        end     
    end     
    return false
end

-------------------------------------------------------------------------------
return slider