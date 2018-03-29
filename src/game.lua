require("object");
local floor = require("floor");

local GameScene = {
 init = nil,
 children = {
  floor
 }
};

return Object:new(GameScene);
