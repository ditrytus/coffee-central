require("object")
require("sprite")

local SpriteObject = function(pos, sprite)
    return Object:new({
        pos = pos,
        sprite = sprite,
        _draw = function(this)
            this.sprite:draw(this.pos)
        end
    })
end

function spriteObjectFromSheet(pos, sheet, background)
    return SpriteObject(pos, Sprite:fromSheet(sheet, background))
end

return SpriteObject
