require("object")
require("point")
require("rectangle")
require("sprite")

local Chair = function(pos)
    return Object:new({
        pos = pos,
        sprite = Sprite:new(Rectangle:new(36, 0, 9, 16), black),
        _draw = function(this)
            this.sprite:draw(this.pos)
        end
    })
end

return Chair;
