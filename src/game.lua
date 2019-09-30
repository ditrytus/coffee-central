require("object")
local background = require("background")
local tableset = require("tableset")
local panel = require("panel")
local counter = require("counter")
local hero = require("hero")
local bagsShelve = require("bags_shelve")

local GameScene = {
    children = {
        background,
        bagsShelve(Point:new(32, 15)),
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
