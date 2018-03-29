-- RECTANGLE

require("point");

Rectangle = {}

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
 return Point:new(self.x + self.width, self.y + self.height);
end