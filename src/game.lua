require("object")
local floor = require("floor")
local tableset = require("tableset")
local panel = require("panel")
local counter = require("counter")

local GameScene = {
    children = {
        floor,
        counter,
        tableset(Point:new(39, 73)),
        tableset(Point:new(99, 73)),
        tableset(Point:new(9, 87)),
        tableset(Point:new(69, 87)),
        panel
    }
}

return Object:new(GameScene)
