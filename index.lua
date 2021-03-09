--
-- Created by IntelliJ IDEA.
-- User: spacewave
-- Date: 08.03.2021
-- Time: 15:26
-- To change this template use File | Settings | File Templates.
--

-- Load
dofile("ux0:/data/lpp-vita/samples/nottetris/wrapper/love.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/main.lua")

volume = 1
hue = 0.08
scale = suggestedscale
fullscreen = true
gamestate = "logo"

main.init()

local timer = Timer.new()
local pad = Controls.read()

while true do
    -- if any key pressed send out events
    if(Controls.check(pad,SCE_CTRL_UP)) then
        main.love.keypressed("up")
    elseif(Controls.check(pad,SCE_CTRL_DOWN)) then
        main.love.keypressed("down")
    elseif(Controls.check(pad,SCE_CTRL_LEFT)) then
        main.love.keypressed("left")
    elseif(Controls.check(pad,SCE_CTRL_RIGHT)) then
        main.love.keypressed("right")
    elseif(Controls.check(pad,SCE_CTRL_START)) then
        main.love.keypressed("return")
    elseif(Controls.check(pad,SCE_CTRL_SELECT)) then
        main.love.keypressed("escape")
    elseif(Controls.check(pad,SCE_CTRL_LTRIGGER)) then
        main.love.keypressed("y")
    elseif(Controls.check(pad,SCE_CTRL_RTRIGGER)) then
        main.love.keypressed("x")
    end
    --
    main.update(math.ceil(love.timer.getTime))
end