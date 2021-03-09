--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 16:28
-- To change this template use File | Settings | File Templates.
--

LoveSound = {
    id = 0,
    volume = 0,
    isLooping = false
}

function LoveSound:create(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function LoveSound:setVolume (volume)
    self.volume = volume
end

function LoveSound:setLooping (isLooping)
    self.isLooping = isLooping
end