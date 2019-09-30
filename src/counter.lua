require("object")
require("colors")
require("rectangle")
require("point")
require("draw")

local Counter = {
    counterRect = Rectangle:new(2, 7, 14, 2) * 8,
    counterSurfaceRect = Rectangle:new(2, 7, 14, 1) * 8,
    passageRect = Rectangle:new(0, 7, 2, 1) * 8,
    _init = function(this)
        this.passageRect.width = this.passageRect.width + 1
    end,
    _draw = function(this)

        local counter_color = mixColor(dark_gray, indigo)
        local counter_pattern = 0x8888
        roundRect(this.counterRect, 3, black, counter_color, counter_pattern)
        borderRect(this.passageRect:move(xy(0, 2)), counter_color, black, counter_pattern)

        local surface_color = mixColor(brown, dark_gray)
        local surface_pattern = 0xc3c3
        borderRect(this.counterSurfaceRect, surface_color, black, surface_pattern)
        borderRect(this.passageRect, surface_color, black, surface_pattern)

        fillp()
    end
}

return Object:new(Counter)
