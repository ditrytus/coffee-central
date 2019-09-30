-- RECTANGLE

require("point")

Rectangle = {
    __mul = function(r, n)
        return Rectangle:new(r.x * n, r.y * n, r.width * n, r.height * n)
    end
}

function Rectangle:new(x, y, w, h)
    local rectangle = {
        x = x,
        y = y,
        width = w,
        height = h
    }
    setmetatable(rectangle, self)
    self.__index = self
    return rectangle
end

function Rectangle:fromSheet(sheet)
    return Rectangle:new(sheet.x, sheet.y, sheet.w, sheet.h)
end

function Rectangle:move(point)
    return Rectangle:new(self.x + point.x, self.y + point.y, self.width, self.height)
end

function Rectangle:pos()
    return xy(self.x, self.y)
end

function Rectangle:pos2()
    return xy(self.x + self.width - 1, self.y + self.height - 1)
end
