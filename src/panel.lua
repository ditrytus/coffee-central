require("object")
require("colors")
require("sprite")
require("spritesheet")

local Panel = {
    _init = function(this)
        this.menuRect = xywh(0, 13, 16, 3) * 8

        local coffeePanelPadding = 2
        local size = this.menuRect:pos2().y - this.menuRect.y - coffeePanelPadding * 2 + 1

        this.coffeePanelRect =
            xywh(this.menuRect.x + coffeePanelPadding, this.menuRect.y + coffeePanelPadding, size, size)

        this.handPanelRect = this.coffeePanelRect:move(xy(this.coffeePanelRect.width + 1, 0))
    end,
    _draw = function(this)
        local radius = 3
        roundRect(this.menuRect, radius, black, brown)
        roundRect(this.coffeePanelRect, radius, black, white)
        roundRect(this.handPanelRect, radius, black, white)
    end
}

return Object:new(Panel)
