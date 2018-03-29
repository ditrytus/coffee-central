-- RECTANGLE

require("point");

Rectangle = {
 __mul = function(r, n)
  return Rectangle:new(r.x * n, r.y * n, r.width * n, r.height * n);
 end
}

function Rectangle:new(x, y, w, h)
 local rectangle = {
  x = x,
  y = y,
  width = w,
  height = h,
 };
 setmetatable(rectangle, self);
 self.__index = self;
 return rectangle;
end

function Rectangle:move(point)
 return Rectangle:new(
  self.x + point.x,
  self.y + point.y,
  self.width,
  self.height
 );
end

function Rectangle:pos()
 return Point:new(self.x, self.y);
end

function Rectangle:pos2()
 return Point:new(self.x + self.width - 1, self.y + self.height - 1);
end
