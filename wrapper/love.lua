--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 15:25
-- To change this template use File | Settings | File Templates.
--

dofile("app0:/wrapper/loveSound.lua")
dofile("app0:/wrapper/loveImage.lua")
dofile("app0:/wrapper/loveImageData.lua")
dofile("app0:/wrapper/loveEnvironment.lua")
dofile("app0:/wrapper/loveFont.lua")

love = {
    graphics = {},
    filesystem = {},
    mouse = {},
    audio = {},
    image = {},
    env = {},
    timer = {},
    coordinateSystemTranslation = {x = 0, y = 0},
    scissor = { x = 0, y = 0, width = 960, height = 544 },
    keyboard = {},
    textCount = 1
}

function love.init()
    love.env = LoveEnvironment:create({id = 0, backgroundColor = Color.new(0,0,0,0), activeFont = 0, timer = Timer.new()})
end

function love.graphics.getModes()
    local modes = {
        { width = 960, height = 544 }
    }
    return modes
end

function love.filesystem.exists(filePath)
    return System.doesFileExist("app0:/" .. filePath)
end

-- TODO: Figure out how big the read/ write length needs to be
function love.filesystem.read(filePath)
    local handle = System.openFile("app0:/" .. filePath, FREAD)
    local sizeOfFile = 200
    return System.readFile(handle, sizeOfFile)
end


-- TODO: Figure out how big the read/ write
function love.filesystem.write(filePath, content)
    --local handle = System.openFile("app0:/" .. filePath, FCREATE)
    --local sizeOfFile = 200
    --System.write(handle, content, sizeOfFile)
end

function love.graphics.setMode( width, height, fullscreen, vsync, fsaa)
    if(fullscreen) then
    else
        Graphics.initBlend()
        Graphics.debugPrint(5, 5, "Only Fullscreen Mode possible", Color.new(255, 255, 255))
        Graphics.termBlend()
    end
end

function love.mouse.setVisible( visible )

end

function love.graphics.getWidth()
    return 960
end

function love.graphics.getHeight()
    return 544
end

function love.audio.newSource(filePath, type)
    return LoveSound:create({id = Sound.open("app0:/" .. filePath), volume = 0, isLooping = false})
end

function love.graphics.newImageFromFile(filePath)
    return LoveImage:create({id = Graphics.loadImage("app0:/" .. filePath), filterWidth = "", filterHeight = ""})
end

function love.graphics.newImageFromImageData(imageData)
    return LoveImage:create({id = imageData.id, filterWidth = "", filterHeight = ""})
end

function love.graphics.setBackgroundColor(r,g,b)
    love.env:setBackgroundColor(Color.new(r,g,b, 255))
end

function love.image.newImageDataFromPath(filePath)
    local graphicsId = Graphics.loadImage("app0:/" .. filePath)
    local graphics_width = Graphics.getImageWidth(graphicsId)
    local graphics_height = Graphics.getImageHeight(graphicsId)

    return LoveImageData:create({id = graphicsId, width = graphics_width, height = graphics_height})
end

function love.image.newImageDataFromDimensions(image_width, image_height)
    love.graphics.print(
         image_width .. "wi\n" .. image_height .. "ht\n" .. 
         Color.getR(love.env.backgroundColor) .. "," .. Color.getG(love.env.backgroundColor) .. ","..
         Color.getB(love.env.backgroundColor),
         20,60,0,1,1)
         idsa = Graphics.createImage(image_width, image_height, Color.new(0,0,0))
         love.graphics.print("tze id", 20,60,0,1,1)
         obj = LoveImageData:create({id = idsa, width = image_width, height = image_height})
         love.graphics.print("obj", 20,60,0,1,1)
         return obj
end

function love.graphics.newFont(fontPath)
    return LoveFont:create({ id = Font.load("app0:/" .. fontPath)})
end

function love.graphics.setFont(font)
    love.env:setActiveFont(font)
end

function love.audio.play(snd)
    if (snd.isLooping) then
        Sound.play(snd.id, LOOP)
    else
        Sound.play(snd.id, NO_LOOP)
    end
end

function love.audio.stop(snd)
    Sound.pause(snd)
end

function love.timer.getTime()
    return Timer.getTime(love.env.timer)
end

function love.keyboard.isDown(key)
    local pad = Controls.read()
    return Controls.check(pad, key)
end

function love.graphics.translate(dx, dy)
    love.coordinateSystemTranslation.x = love.coordinateSystemTranslation.x + dx
    love.coordinateSystemTranslation.y = love.coordinateSystemTranslation.y + dy
end

function love.graphics.draw(drawable, x, y, angle, scale_x, scale_y, offset_x, offset_y)
    Graphics.initBlend()
    Graphics.drawScaleImage(
        x + love.coordinateSystemTranslation.x + offset_x or 0,
        y + love.coordinateSystemTranslation.y + offset_y or 0,
        drawable.id, scale_x or 1, scale_y or 1)
    Graphics.termBlend()
end

function love.graphics.setScissor(x, y, width, height)
    love.scissor.x = x
    love.scissor.y = y
    love.scissor.width = width
    love.scissor.height = height
end

function love.graphics.print( text, x, y, r, scale_x, scale_y)
    Graphics.initBlend()
    Screen.clear()
    Font.print(love.env.activeFont.id, x, y, text, Color.new(0, 255, 255))
    Graphics.termBlend()
    Screen.flip()
end
