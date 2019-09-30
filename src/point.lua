-- POINT

Point = {
  __add = function(a, b)
    return Point:new(a.x + b.x, a.y + b.y)
  end,
  __mul = function(a, b)
    return Point:new(a.x * b.x, a.y * b.y)
  end
}

function Point:new(x, y)
  local point = {
    x = x,
    y = y
  }
  setmetatable(point, self)
  self.__index = self
  return point
end

function Point:floor()
    return Point:new(flr(self.x), flr(self.y))
end

function xy(x, y)
    return Point:new(x, y)
end
