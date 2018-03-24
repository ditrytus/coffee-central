pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--coffee central
--by jakub gruszecki

-- SYSTEM FUNCTIONS

function _init()
 initMenu();
end

function _update()
end

function _draw()
 cls(white);

 drawMenu();
end

-- MENU

function initMenu()
 menuRect = gridToScreen(Rectangle:new(0, 13, 16, 3));

 local coffeePanelPadding = 2;
 coffeePanelRect = Rectangle:new(
  menuRect.x + coffeePanelPadding,
  menuRect.y + coffeePanelPadding,
  rectY2(menuRect) - menuRect.y - coffeePanelPadding * 2 + 1,
  rectY2(menuRect) - menuRect.y - coffeePanelPadding * 2 + 1
 );
 
 handPanelRect = coffeePanelRect:move(
  Point:new(coffeePanelRect.width + 1, 0));
end

function drawMenu()
 roundRect(menuRect, 3, black, brown);
 roundRect(coffeePanelRect, 3, black, white);
 roundRect(handPanelRect, 3, black, white);

 drawCup();
end

-- MENU - COFFEE CUP

function drawCup()
 palt(black, false);
 palt(white, true);
 -- CUP SPRITE
 sspr(0, 0, 16, 14, coffeePanelRect.x + 2, coffeePanelRect.y + 3);
 palt();
end

-- GLOBAL CONSTANTS

black = 0;
dark_blue = 1;
dark_purple = 2;
dark_purple = 3;
brown = 4;
dark_gray = 5;
light_gray = 6;
white = 7;
red = 8;
orange = 9;
yellow = 10;
green = 11;
blue = 12;
indigo = 13;
pink = 14;
peach = 15;

-- GRID 8x8

grid_cell_size = 8;

function gridToScreen(rect)
 return Rectangle:new(
  grid_cell_size * rect.x,
  grid_cell_size * rect.y,
  grid_cell_size * rect.width,
  grid_cell_size * rect.height
 );
end

-- POINT

Point = {
 __add = function (a, b) 
  return Point:new(
    a.x + b.x,
    a.y + b.y
   );
  end
}

function Point:new(x, y)
 local point = {
  x = x,
  y = y
 };
 setmetatable(point, self);
 self.__index = self;
 return point;
end

function Point:toString()
 return "("..tostr(self.x)..", "..tostr(self.y)..")";
end

-- RECTANGLE

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

-- DRAW ROUNDED RECTANGLES

function roundRect(rectangle, rad, borderColor, fillColor)

 local top_left = Point:new(rectangle.x + rad, rectangle.y + rad);
 local top_right = Point:new(rectangle.x + rectangle.width - rad, rectangle.y + rad)
 local bottom_left = Point:new(rectangle.x + rad, rectangle.y + rectangle.height - rad);
 local bottom_right = Point:new(rectangle.x + rectangle.width - rad, rectangle.y + rectangle.height - rad);

 drawCorner(rectangle:pos(), top_left, rad, fillColor, borderColor);

 drawCorner(
  Point:new(top_right.x, rectangle.y),
  top_right + Point:new(-1,0),
  rad, fillColor, borderColor
 );

 drawCorner(
  Point:new(rectangle.x, bottom_left.y),
  bottom_left + Point:new(0,-1),
  rad, fillColor, borderColor
 );

 drawCorner(
  bottom_right,
  bottom_right + Point:new(-1,-1),
  rad, fillColor, borderColor
 );

 clip(top_left.x, rectangle.y, top_right.x - top_left.x, rectangle.height);
 borderRect(rectangle, fillColor, borderColor);

 clip(rectangle.x, top_left.y, rectangle.width, bottom_left.y - top_left.y);
 borderRect(rectangle, fillColor, borderColor);

 clip();
end

function drawCorner(clipPoint, circPoint, rad, fillColor, borderColor)
 clip(clipPoint.x, clipPoint.y, rad, rad);
 if fillColor != nil then
  pcircfill(circPoint, rad, fillColor); 
 end
 pcirc(circPoint, rad, borderColor);
end

function borderRect(rectangle, fillColor, borderColor)
 if fillColor != nil then
  rrectfill(rectangle, fillColor);
 end
 rrect(rectangle, borderColor);
end

-- OTHER

function rectX2(rectangle)
 return rectangle.x + rectangle.width - 1;
end

function rectY2(rectangle)
 return rectangle.y + rectangle.height - 1;
end

function pcirc(point, rad, color)
 circ(point.x, point.y, rad, color);
end

function pcircfill(point, rad, color)
 circfill(point.x, point.y, rad, color);
end

function rrectfill(rectangle, color)
 rectfill(
  rectangle.x,
  rectangle.y,
  rectX2(rectangle),
  rectY2(rectangle),
  color);
end

function rrect(rectangle, color)
 rect(
  rectangle.x,
  rectangle.y,
  rectX2(rectangle),
  rectY2(rectangle),
  color);
end
__gfx__
77000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77007777777700770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707777777707770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707777777707770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77700777777007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
