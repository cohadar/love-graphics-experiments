--- @module conventions
-------------------------------------------------------------------------------
-- This module is NOT a part of imgui codebase, it is a code conventions example
--
-- for general module conventions read this:
-- http://hisham.hm/2014/01/02/how-to-write-lua-modules-in-a-post-module-world/
-------------------------------------------------------------------------------
local conventions = {} -- module names are all lowercase

-------------------------------------------------------------------------------
-- private module variables are camelCase with leading underscore
-------------------------------------------------------------------------------
local _tickCount = 23
local _bar = "bar"

-------------------------------------------------------------------------------
-- do NOT declare global variables inside module
-------------------------------------------------------------------------------
myStupidGlobal = "dirty name space" -- DO NOT DO THIS
MY_STUPID_CONSTANT = 55 -- Do NOT even make global constans
conventions.X_SIZE = 1024 -- make module constants instead: modulename.CONSTANT_NAME

-------------------------------------------------------------------------------
-- all functions should have 80 x '-' header comment ( like this one )
-- declare module private functions as local
-------------------------------------------------------------------------------
local function privateFunction()
end

-------------------------------------------------------------------------------
-- declare public functions as modulename.functionName
-- function names are camelCase, argument names are camelCase
-------------------------------------------------------------------------------
function conventions.exampleFunction( firstParam, secondParam )
	local myLocalParam = 45 -- local variables are also camelCase
end

-------------------------------------------------------------------------------
-- it is ok to use all lowercase for some variables and function names
-- be sure to have a good reason for this
-------------------------------------------------------------------------------
function conventions.flattable()
end

-------------------------------------------------------------------------------
-- NO CLASSES, use functions with explicit self instead
-------------------------------------------------------------------------------
function conventions.member( self, param1, param2 )
end

-------------------------------------------------------------------------------
-- return module table at the end, duh
-------------------------------------------------------------------------------
return conventions

