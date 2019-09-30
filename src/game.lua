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
        bagsShelve(xy(32, 15)),
        hero(xy(20, 20)),
        counter,
        tableset(xy(39, 73)),
        tableset(xy(99, 73)),
        tableset(xy(9, 87)),
        tableset(xy(69, 87)),
        panel
    }
}

return Object:new(GameScene)
