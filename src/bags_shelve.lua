require("object")
local shelve = require("shelve")
local bag = require("bag")

local BagsShelve = function(pos)
    return Object:new({
        pos = pos,
        children = {
            shelve(pos),
            bag(pos + Point:new(11, -8), orange),
            bag(pos + Point:new(5, -6), dark_green),
            bag(pos + Point:new(15, -6), red)
        }
    })
end

return BagsShelve
