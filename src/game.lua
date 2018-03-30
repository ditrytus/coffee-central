require("object")
local floor = require("floor")
local chair = require("chair")
local table = require("table")

local GameScene = {
    init = nil,
    children = {
        floor,
        chair(Point:new(50, 50)),
        table(Point:new(100, 100))
    }
}

return Object:new(GameScene)
