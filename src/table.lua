require("object");
require("sprite");
require("point")
require("rectangle")
require("colors")

local Table = function(pos)
    return Object:new({
        pos = pos,
        sprite = Sprite:new(Rectangle:new(16, 0, 20, 16), white),
        draw = function(this)
            this.sprite:draw(this.pos);
        end
    })
end

return Table;
