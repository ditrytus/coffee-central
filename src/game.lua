require("object")
local floor = require("floor")
local tableset = require("tableset")
local panel = require("panel")
local counter = require("counter")
local hero = require("hero")

local GameScene = {
    children = {
        floor,
        hero(Point:new(20, 20)),
        counter,
        tableset(Point:new(39, 73)),
        tableset(Point:new(99, 73)),
        tableset(Point:new(9, 87)),
        tableset(Point:new(69, 87)),
        panel
    }
}

return Object:new(GameScene)
