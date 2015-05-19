--- @module dialog

local BASE = (...):match("(.-)[^%.]+$")
local core = require( BASE .. "core" )
local style = require( BASE .. "style" )

-------------------------------------------------------------------------------
local function resizeParent( parent, child )
	if parent.adjust_x then
		parent.adjust_x = false
		parent.x = child.x
	end
	if parent.adjust_y then
		parent.adjust_y = false
		parent.y = child.y
	end
	if parent.adjust_w then
		parent.adjust_w = false
		parent.w = child.w
	end
	if parent.adjust_h then
		parent.adjust_h = false
		parent.h = child.h
	end
	if child.x < parent.x then
		parent.x = child.x
	end
	if child.y < parent.y then
		parent.y = child.y
	end
	if child.x + child.w > parent.x + parent.w then
		parent.w = child.x + child.w - parent.x
	end
	if child.y + child.h > parent.y + parent.h then
		parent.h = child.y + child.h - parent.y
	end
	if parent.adjust_child then
		parent.adjust_child( parent, child )
	end
end

-------------------------------------------------------------------------------
local function surroundElements( parent, elements )
	for _, child in ipairs( elements ) do
		resizeParent( parent, child )
	end
end

-------------------------------------------------------------------------------
local function addPadding( rect, padding )
	rect.x = rect.x - padding
	rect.y = rect.y - padding
	rect.w = rect.w + padding * 2
	rect.h = rect.h + padding * 2			
end

-------------------------------------------------------------------------------
-- dialog resizes itself to surround all elements
-------------------------------------------------------------------------------
function dialog( self )
	assert( self.elements, "elements" )
	local id, uistate = core.nextId()
	core.fixRect( self )
	style.dialog( self, core.getMods( id ) )
	if core.isAfterAlignTick() then
		rect = {}
		core.fixRect( rect )
		surroundElements( rect, self.elements )
		addPadding( rect, 5 )
		self.x = rect.x 
		self.y = rect.y 
		self.h = rect.h 
		self.w = rect.w
	end
end

-------------------------------------------------------------------------------
return dialog

