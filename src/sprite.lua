-- SPRITE

Sprite = {}

function Sprite:new(rect, backColor)
    local sprite = {
        rect = rect,
        backColor = backColor
    }
    setmetatable(sprite, self)
    self.__index = self
    return sprite
end

function Sprite:draw(pos, flip_x)
    local sRect = self.rect
    if flip_x == nil then
        flip_x = false
    end
    palt(black, false)
    palt(self.backColor, true)
    sspr(sRect.x, sRect.y, sRect.width, sRect.height, pos.x, pos.y, sRect.width, sRect.height, flip_x, false)
    palt()
end
