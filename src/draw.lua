-- DRAWING ROUTINS

require("rectangle")
require("point")

function roundRect(rectangle, rad, borderColor, fillColor, fillPattern)
  local rectPos = rectangle:pos()
  local radPoint = Point:new(rad, rad)

  local top_left = rectPos + radPoint
  local top_right = Point:new(rectangle.x + rectangle.width - rad, rectangle.y + rad)
  local bottom_left = Point:new(rectangle.x + rad, rectangle.y + rectangle.height - rad)
  local bottom_right = Point:new(rectangle.x + rectangle.width - rad, rectangle.y + rectangle.height - rad)

  iffillp(fillPattern)

  drawCorner(rectangle:pos(), top_left, rad, fillColor, borderColor)

  drawCorner(Point:new(top_right.x, rectangle.y), top_right + Point:new(-1, 0), rad, fillColor, borderColor)

  drawCorner(Point:new(rectangle.x, bottom_left.y), bottom_left + Point:new(0, -1), rad, fillColor, borderColor)

  drawCorner(bottom_right, bottom_right + Point:new(-1, -1), rad, fillColor, borderColor)

  clip(top_left.x, rectangle.y, top_right.x - top_left.x, rectangle.height)
  borderRect(rectangle, fillColor, borderColor, fillPattern)

  clip(rectangle.x, top_left.y, rectangle.width, bottom_left.y - top_left.y)
  borderRect(rectangle, fillColor, borderColor, fillPattern)

  clip()
  fillp()
end

function drawCorner(clipPoint, circPoint, rad, fillColor, borderColor)
  clip(clipPoint.x, clipPoint.y, rad, rad)
  if fillColor ~= nil then
    pcircfill(circPoint, rad, fillColor)
  end
  pcirc(circPoint, rad, borderColor)
end

function borderRect(rectangle, fillColor, borderColor, fillPattern)
  if fillColor ~= nil then
    iffillp(fillPattern)
    rrectfill(rectangle, fillColor)
  end
  rrect(rectangle, borderColor)
  fillp()
end

-- OTHER

function iffillp(fillPattern)
  if fillPattern ~= nil then
    fillp(fillPattern)
  end
end

function pcirc(point, rad, color)
  circ(point.x, point.y, rad, color)
end

function pcircfill(point, rad, color)
  circfill(point.x, point.y, rad, color)
end

function rrectfill(rectangle, color)
  rectfill(rectangle.x, rectangle.y, rectangle:pos2().x, rectangle:pos2().y, color)
end

function rrect(rectangle, color)
  rect(rectangle.x, rectangle.y, rectangle:pos2().x, rectangle:pos2().y, color)
end
