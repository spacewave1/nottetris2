--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 18:46
-- To change this template use File | Settings | File Templates.
--


LoveImageData = {
    id = 0,
    heigth = 0,
    width = 0
}

function LoveImageData:create(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.height = Graphics.getImageHeight(o.id) or 0
    self.width = Graphics.getImageWidth(o.id) or 0
    return o
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
    for index_y = y,imageData.height,1
    do
        for index_x = x,imageData.width,1
        do
            Graphics.drawPixel(index_x,index_y,imageData.id)
        end
    end

    Graphics.drawImage(x,y, imageData)
end



