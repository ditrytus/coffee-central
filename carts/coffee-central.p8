pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--coffee central
--by jakub gruszecki

-- SYSTEM FUNCTIONS

function _init()
 initSprites();
 initMenu();
 initCounter();
end

function _update()
end

function _draw()
 drawBackground();
 drawCounter();
 drawTables();
 drawMenu();
end

function drawBackground()
 fillp(0b1100110000110011); -- big checker
 rectfill(0, 0, 127, 115, mixColor(peach, white));
 rectfill(0, 115, 127, 127, black);
 fillp(0);
end

-- SPRITES

function initSprites()
 sprite = {

  table = {
   rect = Rectangle:new(16, 0, 20, 16),
   bkg = white
  },

  chair = {
   rect = Rectangle:new(36, 0, 9, 16),
   bkg = black
  },

  cup = {
   rect = Rectangle:new(0, 0, 16, 14),
   bkg = white
  }

 };
end

function drawSprite(s, pos, flip_x)
 local sRect = s.rect;
 if flip_x == nil then flip_x = false; end
 palt(black, false);
 palt(s.bkg, true);
 sspr(
  sRect.x, sRect.y,
  sRect.width, sRect.height,
  pos.x, pos.y,
  sRect.width, sRect.height,
  flip_x, false);
 palt();
end

-- TABLES

function drawTables()
 drawTable(Point:new(39,73));
 drawTable(Point:new(99,73));

 drawTable(Point:new(9,87));
 drawTable(Point:new(69,87));
end

function drawTable(pos)
 drawSprite(sprite.chair, pos + Point:new(-8, 0));
 drawSprite(sprite.chair, pos + Point:new(sprite.table.rect.width - 1, 0), true);
 drawSprite(sprite.table, pos);
end

-- COUNTER

function initCounter()
 counterRect = gridToScreen(Rectangle:new(2, 7, 14, 2));
 counterSurfaceRect = gridToScreen(Rectangle:new(2, 7, 14, 1));
 passageRect = gridToScreen(Rectangle:new(0, 7, 2, 1));
 passageRect.width += 1;
end

function drawCounter()
 roundRect(counterRect, 3, black, brown);
 borderRect(counterSurfaceRect, brown, black);
 borderRect(passageRect:move(Point:new(0, 2)), brown, black); 
 borderRect(passageRect, brown, black);
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

 drawSprite(sprite.cup, coffeePanelRect:pos() + Point:new(2,3));
end

-- COLORS

black = 0;
dark_blue = 1;
dark_purple = 2;
dark_green = 3;
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

function mixColor(primaryColor, secondaryColor)
 return secondaryColor * 16 + primaryColor;
end

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
  end,
 __mul = function (a, b)
  return Point:new(
   a.x * b.x,
   a.y * b.y
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

function Rectangle:pos2()
 return Point:new(self.x + self.width, self.y + self.height);
end

-- DRAW ROUNDED RECTANGLES

function roundRect(rectangle, rad, borderColor, fillColor, fillPattern)
 local rectPos = rectangle:pos();
 local radPoint = Point:new(rad, rad);

 local top_left =  rectPos + radPoint;
 local top_right = Point:new(rectangle.x + rectangle.width - rad, rectangle.y + rad)
 local bottom_left = Point:new(rectangle.x + rad, rectangle.y + rectangle.height - rad);
 local bottom_right = Point:new(rectangle.x + rectangle.width - rad, rectangle.y + rectangle.height - rad);

 iffillp(fillPattern);

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
 fillp();
end

function drawCorner(clipPoint, circPoint, rad, fillColor, borderColor)
 clip(clipPoint.x, clipPoint.y, rad, rad);
 if fillColor != nil then
  pcircfill(circPoint, rad, fillColor); 
 end
 pcirc(circPoint, rad, borderColor);
end

function borderRect(rectangle, fillColor, borderColor, fillPattern)
 if fillColor != nil then
  iffillp(fillPattern);
  rrectfill(rectangle, fillColor);
 end
 rrect(rectangle, borderColor);
 fillp();
end

-- OTHER

function iffillp(fillPattern)
 if fillPattern != nil then
  fillp(fillPattern);
 end
end

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
77000000000000077777700000000007777754500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770007700005544225500007754500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770707005442255442255400754500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770700022554422554422550054500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770000444225544225544225054500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77077777777770070005442255442255400012145454500000000000000000000000000000000000000000000000000000000000000000000000000000000000
770777777777707700500044225544000d00121dddd4500000000000000000000000000000000000000000000000000000000000000000000000000000000000
770077777777007770055500000000ddd007121dddd4500000000000000000000000000000000000000000000000000000000000000000000000000000000000
777077777777077777000056555ddd000077121dddd4500000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707777777707777777700000000007777712145454500000000000000000000000000000000000000000000000000000000000000000000000000000000000
777007777770077777777770565d0777777712121212100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777777056550777777712121212100000000000000000000000000000000000000000000000000000000000000000000000000000000000
007777777777770077777770555d0777777712100012100000000000000000000000000000000000000000000000000000000000000000000000000000000000
700000000000000777777770565d0777777712100012100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777777006500777777712100012100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000007777777700007777777712100012100000000000000000000000000000000000000000000000000000000000000000000000000000000000
