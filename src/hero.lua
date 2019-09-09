require("object")
require("point")
require("rectangle")
require("sprite")
require("spritesheet")
require("flipbook")
require("keys")

local Hero = function(startPos)
    return Object:new({
        pos = pos,
        direction = "down",
        frame = 0,
        gfx = {
            side = {
                stand = Flipbook:fromSheetArray({[0]=spritesheet.character.side.stand}),
                walk = Flipbook:fromSheetArray(spritesheet.character.side.walk)
            },
            front = {
                stand = Flipbook:fromSheetArray({[0]=spritesheet.character.front.stand}),
                walk = Flipbook:fromSheetArray(spritesheet.character.front.walk)
            },
            back = {
                stand = Flipbook:fromSheetArray({[0]=spritesheet.character.back.stand}),
                walk = Flipbook:fromSheetArray(spritesheet.character.back.walk)
            }
        },
        _draw = function(this)
            gfx_dir = ""
            if self.direction == "up" then
                gfx_dir = "back"
            elseif self.direction == "down" then
                gfx_dir = "front"
            else 
                gfx_dir = "side"
            end
            this.gfx[gfx_dir]["stand"]:draw(this.pos, false)
        end,
        _update = function(this)
            if btnp(key.up) then
                self.direction = "up"
            elseif btnp(key.down) then
                self.direction = "down"
            elseif btnp(key.left) then
                self.direction = "left"
            elseif btnp(key.right) then
                self.direction = "right"
            end
        end     
    })
end

return Hero
