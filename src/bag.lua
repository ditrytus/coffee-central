require("object")
require("sprite")
require("spritesheet")
require("colors")

local Bag = function(pos, labelColor)
    return Object:new({
        pos = pos,
        labelColor = labelColor,
        sprite = Sprite:fromSheet(spritesheet.bag, pink),
        _draw = function(this)
            pal(orange, labelColor)
            this.sprite:draw(this.pos)
            pal()
        end
    })
end

return Bag
