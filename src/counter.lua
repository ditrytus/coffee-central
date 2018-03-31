require("object")
require("colors")
require("rectangle")
require("point")

local Counter = {
    counterRect = Rectangle:new(2, 7, 14, 2) * 8,
    counterSurfaceRect = Rectangle:new(2, 7, 14, 1) * 8,
    passageRect = Rectangle:new(0, 7, 2, 1) * 8,
    _init = function(this)
        this.passageRect.width = this.passageRect.width + 1
    end,
    _draw = function(this)
        roundRect(this.counterRect, 3, black, brown)
        borderRect(this.counterSurfaceRect, brown, black)
        borderRect(this.passageRect:move(Point:new(0, 2)), brown, black)
        borderRect(this.passageRect, brown, black)
    end
}

return Object:new(Counter)
