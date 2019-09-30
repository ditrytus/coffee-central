require("object")
require("sprite")
require("colors")
require("spritesheet")

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
