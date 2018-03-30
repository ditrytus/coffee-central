require("object");
require("point");
require("sprite");

local Chair = {
    pos = Point:new(0, 0),
    sprite = Sprite:new(
        Rectangle:new(36, 0, 9, 16),
        black
    ),
    draw = function()
        self.sprite:draw(pos);
    end
}

return Object:new(Chair);
