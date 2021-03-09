--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 17:40
-- To change this template use File | Settings | File Templates.
--

LoveEnvironment = {
    id = 0,
    backgroundColor = {
        r = 0,
        g = 0,
        b = 0
    },
    activeFont = 0,
    timer = 0
}

function LoveEnvironment:create(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.timer = Timer.new()
    return o
end

function LoveEnvironment:setBackgroundColor (backgroundColor)
    self.backgroundColor = backgroundColor
end

function LoveEnvironment:setActiveFont(font)
    self.activeFont = font
end
