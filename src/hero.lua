require("object")
require("point")
require("rectangle")
require("sprite")
require("spritesheet")
require("flipbook")
require("keys")

local Hero = function(startPos)
    return Object:new({
        pos = startPos,
        direction = "down",
        state = "stand",
        frame = 0,
        frameRate = 10.0,
        lastFrameTime = 0,
        walkingSpeed = 5.0,
        lastUpdate = t(),
        gfx = {
            side = {
                stand = Flipbook:fromSheetArray({spritesheet.character.side.stand}),
                walk = Flipbook:fromSheetArray(spritesheet.character.side.walk)
            },
            front = {
                stand = Flipbook:fromSheetArray({spritesheet.character.front.stand}),
                walk = Flipbook:fromSheetArray(spritesheet.character.front.walk)
            },
            back = {
                stand = Flipbook:fromSheetArray({spritesheet.character.back.stand}),
                walk = Flipbook:fromSheetArray(spritesheet.character.back.walk)
            }
        },
        _draw = function(this)

            gfxDir = "side"
            shouldFlip = false
            if this.direction == "up" then
                gfxDir = "back"
            elseif this.direction == "down" then
                gfxDir = "front"
            elseif this.direction == "left" then
                shouldFlip = true
            end

            animation = this.gfx[gfxDir][this.state];
            if t() - this.lastFrameTime > 1.0 / this.frameRate then
                this.frame = (this.frame + 1)
                this.lastFrameTime = t()
            end
            this.frame = this.frame % animation:count()

            animation:draw(this.frame + 1, this.pos:floor(), shouldFlip)
        end,
        _update = function(this)
            this.state = "stand"

            dt = t() - this.lastUpdate
            this.lastUpdate = t()

            deltaPos = dt * this.walkingSpeed

            if btn(key.up) then
                this.direction = "up"
                this.state = "walk"
                this.pos.y = this.pos.y - deltaPos
            elseif btn(key.down) then
                this.direction = "down"
                this.state = "walk"
                this.pos.y = this.pos.y + deltaPos
            elseif btn(key.left) then
                this.direction = "left"
                this.state = "walk"
                this.pos.x = this.pos.x - deltaPos
            elseif btn(key.right) then
                this.direction = "right"
                this.state = "walk"
                this.pos.x = this.pos.x + deltaPos
            end
        end
    })
end

return Hero
