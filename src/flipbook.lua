require("sprite")

Flipbook = {}

function Flipbook:fromSheetArray(sheetArray, backColor)
    local flipbook = {
        pages = {}
    }
    for i, sheet in ipairs(sheetArray) do
        flipbook.pages[i] = Sprite:fromSheet(sheet, backColor)
    end
    setmetatable(flipbook, self)
    self.__index = self
    return flipbook
end

function Flipbook:draw(pos, page, flip_x)
    self.pages[page]:draw(pos, flip_x)
end
