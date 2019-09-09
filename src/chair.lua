require("object")
require("point")
require("rectangle")
require("sprite")
require("spritesheet")

local Chair = function(pos, flip_x)
    return Object:new({
        pos = pos,
        flip_x = flip_x,
        sprite = Sprite:fromSheet(spritesheet.chair, black),
        _draw = function(this)
            this.sprite:draw(this.pos, this.flip_x)
        end
    })
end

return Chair
