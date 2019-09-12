require("sprite")

Flipbook = {}

function Flipbook:fromSheetArray(sheetArray, backColor)
    local flipbook = {
        pages = {}
    }

    for i = 1, #sheetArray do
        flipbook.pages[i] = Sprite:fromSheet(sheetArray[i], backColor)
    end

    setmetatable(flipbook, self)
    self.__index = self
    return flipbook
end

function Flipbook:draw(page, pos, flip_x)
    self.pages[page]:draw(pos, flip_x)
end

function Flipbook:count()
    return #self.pages;
end
