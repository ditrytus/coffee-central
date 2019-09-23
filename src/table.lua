require("object")
require("sprite")
require("point")
require("rectangle")
require("colors")
require("spritesheet")
local chair = require("chair")

local Table = function(pos)
    return Object:new(
        {
            pos = pos,
            sprite = Sprite:fromSheet(spritesheet.table, pink),
            _draw = function(this)
                this.sprite:draw(this.pos)
            end
        }
    )
end

return Table
