--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 17:25
-- To change this template use File | Settings | File Templates.
--

LoveFont = {
    id = 0
}

function LoveFont:create(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.id = o.id or 0
    return o
end

