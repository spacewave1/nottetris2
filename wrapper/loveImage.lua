--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 17:25
-- To change this template use File | Settings | File Templates.
--

LoveImage = {
    id = 0,
    filterHeigth = "",
    filterWidth = ""
}

function LoveImage:create(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function LoveImage:setFilter (filterWidth, filterHeigth)
    self.filterWidth = filterWidth
    self.filterHeigth = filterHeigth
end
