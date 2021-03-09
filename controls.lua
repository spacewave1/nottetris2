controls = {}
controls.settings = {}

controls.settings.left = {"key", {"left"}}
controls.settings.right = {"key", {"right"}}
controls.settings.up = {"key", {"up"}}
controls.settings.down = {"key", {"down"}}
controls.settings["return"] = {"key", {"return"}}
controls.settings.escape = {"key", {"escape"}}
controls.settings.rotateleft = {"key", {"y", "z", "w"}}
controls.settings.rotateright = {"key", {"x"}}

--player 2
controls.settings.leftp2 = {"key", {"j"}}
controls.settings.rightp2 = {"key", {"k"}}
controls.settings.downp2 = {"key", {"m"}}
controls.settings.rotateleftp2 = {"key", {"o"}}
controls.settings.rotaterightp2 = {"key", {"p"} }

controls.vita.mapping = {}
controls.vita.mapping["left"] = SCE_CTRL_LEFT
controls.vita.mapping["right"] = SCE_CTRL_RIGHT
controls.vita.mapping["up"] = SCE_CTRL_UP
controls.vita.mapping["down"] = SCE_CTRL_DOWN
controls.vita.mapping["return"] = SCE_CTRL_START
controls.vita.mapping["escape"] = SCE_CTRL_SELECT
controls.vita.mapping["y"] = SCE_CTRL_LTRIGGER
controls.vita.mapping["z"] = SCE_CTRL_LTRIGGER
controls.vita.mapping["w"] = SCE_CTRL_LTRIGGER
controls.vita.mapping["x"] = SCE_CTRL_RTRIGGER


function controls.check(t, key)
	if controls.settings[t][1] == "key" then
		for i = 1, #controls.settings[t][2] do
			if key == controls.settings[t][2][i] then
				return true
			end
		end
		return false
	end
end

function controls.isDown(t)
	if controls.settings[t][1] == "key" then
		for i = 1, #controls.settings[t][2] do
			if love.keyboard.isDown(controls.vita.mapping[controls.settings[t][2][i]]) then
				return true
			end
		end
		return false
	end
end
