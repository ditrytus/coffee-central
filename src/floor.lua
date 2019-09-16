require("object")
require("colors")

local Floor = {
  _draw = function(this)
    fillp(0xcc33) -- big checker
    rectfill(0, 0, 127, 115, mixColor(indigo, light_gray))
    rectfill(0, 115, 127, 127, black)
    fillp(0)
  end
}

return Object:new(Floor)
