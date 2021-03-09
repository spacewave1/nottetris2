--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 15:25
-- To change this template use File | Settings | File Templates.
--

dofile("ux0:/data/lpp-vita/samples/nottetris/loveSound.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris/loveImage.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris/loveImageData.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris/loveEnvironment.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris/loveFont.lua")

love = {
    graphics = {},
    filesystem = {},
    mouse = {},
    audio = {},
    image = {},
    env = {},
    timer = {}
}

function love.init()
    love.env = LoveEnvironment:create({id = 0, backgroundColor = { r = 0, g = 0, b = 0}})
    love.timer = Timer.new()
end

function love.graphics.getModes()
    local modes = {
        { width = 960, height = 544 }
    }
    return modes
end

function love.filesystem.exists(filePath)
    return System.doesFileExist(filePath)
end

-- TODO: Figure out how big the read/ write length needs to be
function love.filesystem.read(filePath)
    local handle = System.openFile("ux0:/" + filePath, FREAD)
    local sizeOfFile = 200
    return System.readFile(handle, sizeOfFile)
end


-- TODO: Figure out how big the read/ write
function love.filesystem.write(filePath, content)
    local handle = System.openFile("ux0:/" + filePath, FWRITE)
    local sizeOfFile = 200
    System.write(handle, content, sizeOfFile)
end

function love.graphics.setMode( width, height, fullscreen, vsync, fsaa)
    if(fullscreen) then
    else
        Graphics.debugPrint(5, 5, "Only Fullscreen Mode possible", BLACK)
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
    return LoveSound:create({id = Sound.open("ux0:/" + filePath), volume = 0, isLooping = false})
end

function love.audio.newSource(filePath)
    return LoveSound:create({id = Sound.open("ux0:/" + filePath), volume = 0, isLooping = false})
end

function love.graphics.newImage(filePath)
    return LoveImage:create({id = Graphics.loadImage("ux0:/" + filePath), filterWidth = "", filterHeight = ""})
end

function love.graphics.newImage(imageData)
    return LoveImage:create({id = imageData.id, filterWidth = "", filterHeight = ""})
end

function love.graphics.setBackgroundColor(r,g,b)
    love.config:setBackgroundColor(r,g,b)
end

function love.image.newImageData(filePath)
    return LoveImageData:create({id = Graphics.loadImage("ux0:/" + filePath), width = 0, height = 0})
end

function love.image.newImageData(height, width)
    return LoveImageData:create({id = Graphics.createImage(height, width), width = 0, height = 0})
end

function love.graphics.newFont(fontPath)
    return LoveFont:create(Font.load(fontPath))
end

function love.graphics.setFont(font)
    love.config:setActiveFont(font)
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
    Timer.getTime(love.env.timer)
end

function love.keyboard.isDown(key)
    local pad = Controls.read()
    return Controls.check(pad, key)
end