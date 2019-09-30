local table = require("table")
local chair = require("chair")
require("object")

local Tableset = function(pos)
    return Object:new(
        {
            children = {
                chair(pos + xy(-8, 0)),
                chair(pos + xy(19, 0), true),
                table(pos)
            }
        }
    )
end

return Tableset
