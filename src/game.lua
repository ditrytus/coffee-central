require("object");
local floor = require("floor");
local chair = require("chair");

local GameScene = {
 init = nil,
 children = {
  floor,
  chair
 }
};

return Object:new(GameScene);
