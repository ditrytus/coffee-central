require("object")
require("point")
require("rectangle")
require("sprite")

local Chair = function(pos, flip_x)
    return Object:new({
        pos = pos,
        flip_x = flip_x,
        sprite = Sprite:new(Rectangle:new(36, 0, 9, 16), black),
        _draw = function(this)
            this.sprite:draw(this.pos, this.flip_x)
        end
    })
end

return Chair;
