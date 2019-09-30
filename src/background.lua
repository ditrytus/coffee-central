require("object")
require("colors")

local Background = {
  _draw = function(this)
    fillp(0xcc33) -- big checker
    rectfill(0, 0, 127, 115, mixColor(indigo, light_gray))
    fillp(0xaaaa) -- vertical stripes
    rectfill(0, 0, 127, 34, mixColor(dark_purple, dark_gray))
    fillp(0)
    rectfill(0, 115, 127, 127, black)
  end
}

return Object:new(Background)
