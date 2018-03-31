require("object")
local floor = require("floor")
local tableset = require("tableset")

local GameScene = {
    children = {
        floor,
        tableset(Point:new(39, 73)),
        tableset(Point:new(99, 73)),
        tableset(Point:new(9, 87)),
        tableset(Point:new(69, 87))
    }
}

return Object:new(GameScene)
