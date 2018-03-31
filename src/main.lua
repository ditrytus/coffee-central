--coffee central
--by jakub gruszecki

-- SYSTEM FUNCTIONS

require("point")
require("rectangle")
require("colors")
require("draw")
require("object")
game = require("game")

function _init()
  game:init()
  -- initSprites()
  -- initMenu()
  -- initCounter()
end

function _update()
  game:update()
end

function _draw()
  game:draw()
  --  drawBackground();
  --  drawCounter();
  --  drawTables();
  --  drawMenu();
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
  }
end

-- TABLES

function drawTables()
  drawTable(Point:new(39, 73))
  drawTable(Point:new(99, 73))

  drawTable(Point:new(9, 87))
  drawTable(Point:new(69, 87))
end

function drawTable(pos)
  drawSprite(sprite.chair, pos + Point:new(-8, 0))
  drawSprite(sprite.chair, pos + Point:new(sprite.table.rect.width - 1, 0), true)
  drawSprite(sprite.table, pos)
end

-- COUNTER

function initCounter()
  counterRect = Rectangle:new(2, 7, 14, 2) * grid_cell_size
  counterSurfaceRect = Rectangle:new(2, 7, 14, 1) * grid_cell_size
  passageRect = Rectangle:new(0, 7, 2, 1) * grid_cell_size
  passageRect.width = passageRect.width + 1
end

function drawCounter()
  roundRect(counterRect, 3, black, brown)
  borderRect(counterSurfaceRect, brown, black)
  borderRect(passageRect:move(Point:new(0, 2)), brown, black)
  borderRect(passageRect, brown, black)
end

-- MENU

function initMenu()
  menuRect = Rectangle:new(0, 13, 16, 3) * grid_cell_size

  local coffeePanelPadding = 2
  local size = menuRect:pos2().y - menuRect.y - coffeePanelPadding * 2 + 1

  coffeePanelRect = Rectangle:new(menuRect.x + coffeePanelPadding, menuRect.y + coffeePanelPadding, size, size)

  handPanelRect = coffeePanelRect:move(Point:new(coffeePanelRect.width + 1, 0))
end

function drawMenu()
  roundRect(menuRect, 3, black, brown)
  roundRect(coffeePanelRect, 3, black, white)
  roundRect(handPanelRect, 3, black, white)

  drawSprite(sprite.cup, coffeePanelRect:pos() + Point:new(2, 3))
end

-- GRID 8x8

grid_cell_size = 8
