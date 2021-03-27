--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 17:40
-- To change this template use File | Settings | File Templates.
--

LoveEnvironment = {
    id = 0,
    backgroundColor = 0,
    activeFont = 0,
    timer = 0
}

function LoveEnvironment:create(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.timer = o.timer or 0
    self.backgroundColor = o.backgroundColor or Color.new(0,0,0,0)
    self.activeFont = o.activeFont or 0
    return o
end

function LoveEnvironment:setBackgroundColor (backgroundColor)
    self.backgroundColor = backgroundColor
end

function LoveEnvironment:setActiveFont(font)
    self.activeFont = font
end
