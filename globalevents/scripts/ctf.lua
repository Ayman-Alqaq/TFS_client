dofile("data/ctf.lua")

function onThink(interval)
	if Game.getStorageValue(config["event"]) == 1 then
		checkCTF()
	end
	return true
end
