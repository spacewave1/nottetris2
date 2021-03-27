--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 18:46
-- To change this template use File | Settings | File Templates.
--


LoveImageData = {
    id = 0,
    height = 0,
    width = 0
}

function LoveImageData:create(o)
    love.graphics.print("tst", 20, 60,0,1,1)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.id = o.id or 0
    self.width = o.width or 0
    self.height = o.height or 0
    return o
end

function LoveImageData:setFilter (filterWidth, filterHeigth)
    self.filterWidth = filterWidth
    self.filterHeigth = filterHeigth
end


function LoveImageData:getHeight()
    return self.height
end

function LoveImageData:getWidth()
    return self.width
end

function LoveImageData:getPixel(x, y)
    return Graphics.getPixel(x, y, self.id)
end

function LoveImageData:setPixel(x, y, r, g, b, a)
    Graphics.drawPixel(x,y,Color.new(r, g, b),self.id)
end


-- TODO: There might occur bugs here
function LoveImageData:paste(imageData, x, y)
    love.graphics.print(
      x .. " x\n" .. y .. " y\n" ..
      imageData.width .. " from width\n" ..
      imageData.height .. " from height\n" ..
      LoveImageData.width .. " to width\n" ..
      LoveImageData.height .. " to height\n", 20, 120, 0, 1, 1)
    for index_y = y,imageData.height,1
    do
        for index_x = x,imageData.width,1
        do
            Graphics.drawPixel(index_x,index_y, Graphics.getPixel(x,y,imageData.id),LoveImageData.id)
        end
    end
end



