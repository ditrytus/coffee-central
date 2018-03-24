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
 drawBackground();
 drawMenu();
end

-- BACKGROUND

function drawBackground()
 cls(white);
end

-- MENU

menuRect = {};
--coffeePanelRect = {};
handPanelRect = {};

function initMenu()
 menuRect = gridToScreen({x = 0, y = 13, width = 16, height = 3});

 local coffeePanelPadding = 2;
 coffeePanelRect = Rectangle:new(
  menuRect.x + coffeePanelPadding,
  menuRect.y + coffeePanelPadding,
  rectY2(menuRect) - menuRect.y - coffeePanelPadding * 2 + 1,
  rectY2(menuRect) - menuRect.y - coffeePanelPadding * 2 + 1
 );
 
 handPanelRect = coffeePanelRect:move(
  Point:new(
   coffeePanelRect.width + 1,
   0));

 initCup();
end

function drawMenu()
 roundRect(menuRect, 3, black, brown);
 roundRect(coffeePanelRect, 3, black, white);
 roundRect(handPanelRect, 3, black, white);

 drawCup();
end

-- MENU - COFFEE CUP

cupPosition = {};
cupSprite = {x = 0, y = 0, width = 16, height = 14};

function initCup()
 cupPosition = {
  x = coffeePanelRect.x + 2,
  y = coffeePanelRect.y + 3
 };
end

function drawCup()
 palt(black, false);
 palt(white, true);
 sspr(cupSprite.x, cupSprite.y, cupSprite.width, cupSprite.height, cupPosition.x, cupPosition.y);
 palt();
end

-- GLOBAL CONSTANTS

screen = {
 x = 0, y = 0,
 width = 128, height = 128
};

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

grid = {
 width = 8, height = 8
};

function gridToScreen(rect)
 return {
  x = grid.width * rect.x,
  y = grid.height * rect.y,
  width = grid.width * rect.width,
  height = grid.height * rect.height
 };
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

function pointTest()
 local p1 = Point:new(2, 2);
 print(p1:toString());
 local p2 = Point:new(1, -3);
 print(p2:toString());
 local p3 = p1 + p2;
 print(p3:toString());
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
 return {
  x = self.x + point.x,
  y = self.y + point.y,
  width = self.width,
  height = self.height
 };
end

function roundRectData(rectangle, rad)
 return {
  top = {
   left = {
    x = rectangle.x + rad,
    y = rectangle.y + rad
   },
   right = {
    x = rectangle.x + rectangle.width - rad,
    y = rectangle.y + rad
   }
  },
  bottom = {
   left = {
    x = rectangle.x + rad,
    y = rectangle.y + rectangle.height - rad
   },
   right = {
    x = rectangle.x + rectangle.width - rad,
    y = rectangle.y + rectangle.height - rad
   }
  },
 };
end

function roundRect(rectangle, rad, borderColor, fillColor)
 data = roundRectData(rectangle, rad);

 clip(rectangle.x, rectangle.y, rad, rad);
 if fillColor != nil then
  circfill(data.top.left.x, data.top.left.y, rad, fillColor);
 end
 circ(data.top.left.x, data.top.left.y, rad, borderColor);

 clip(data.top.right.x, rectangle.y, rad, rad);
 if fillColor != nil then
  circfill(data.top.right.x - 1, data.top.right.y, rad, fillColor);
 end
 circ(data.top.right.x - 1, data.top.right.y, rad, borderColor);

 clip(rectangle.x, data.bottom.left.y, rad, rad);
 if fillColor != nil then
  circfill(data.bottom.left.x, data.bottom.left.y - 1, rad, fillColor);
 end
 circ(data.bottom.left.x, data.bottom.left.y - 1, rad, borderColor);

 clip(data.bottom.right.x, data.bottom.right.y, rad, rad);
 if fillColor != nil then
  circfill(data.bottom.right.x - 1, data.bottom.right.y - 1, rad, fillColor); 
 end
 circ(data.bottom.right.x - 1, data.bottom.right.y - 1, rad, borderColor);

 clip(data.top.left.x, rectangle.y, data.top.right.x - data.top.left.x, rectangle.height);
 if fillColor != nil then
  rrectfill(rectangle, fillColor); 
 end
 rrect(rectangle, borderColor);

 clip(rectangle.x, data.top.left.y, rectangle.width, data.bottom.left.y - data.top.left.y);
 if fillColor != nil then
  rrectfill(rectangle, fillColor);  
 end
 rrect(rectangle, borderColor);

 clip();
end

function borderRect(rectangle, backColor, borderColor)
 rrectfill(rectangle, backColor);
 rrect(rectangle, borderColor);
end

function rectX2(rectangle)
 return rectangle.x + rectangle.width - 1;
end

function rectY2(rectangle)
 return rectangle.y + rectangle.height - 1;
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
