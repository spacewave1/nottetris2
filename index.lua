-------------------------------------------------
-- Port of not tetris 2 for lpp-vita --
-------------------------------------------------

-- Load 
dofile("ux0:/data/lpp-vita/samples/nottetris2/Conf.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/Controls.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/Failed.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/GameA.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/GameB.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/Menu.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/Main.lua")
dofile("ux0:/data/lpp-vita/samples/nottetris2/Rocket.lua")

volume = 1
hue = 0.08
scale = suggestedscale
fullscreen = false
gamestate = "logo"

Main.init()

local timer = Timer.new()

while true do
	Main.update(math.ceil(Timer.getTime(timer) / 1000))
end