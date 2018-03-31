require("object")
local floor = require("floor")
local chair = require("chair")
local table = require("table")

local GameScene = {
    children = {
        floor,
        table(Point:new(39, 73)),
        table(Point:new(99, 73)),
        table(Point:new(9, 87)),
        table(Point:new(69, 87))
    }
}

return Object:new(GameScene)
