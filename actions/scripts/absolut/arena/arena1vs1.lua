local pos = {
[1] = {x = 32271, y = 32180, z = 8},
[2] = {x = 32270, y = 32180, z = 8},
team1 = {x = 32255, y = 32169, z = 9},
team2 = {x = 32254, y = 32188, z = 9} 
}

local posMiddle = {x = 32255, y = 32179, z = 9}
local rangex = 23 
local rangey = 20 

local itemremove = 25376

-- local function checkForPlayers()
-- 	count = 0
-- 	local spectators = getSpectators(posMiddle, 10, 10, false)
-- 	if spectators ~= nil then
-- 		for _, spectator in ipairs(spectators) do
-- 			if isPlayer(spectator) then
-- 				count = count + 1
-- 			end
-- 		end
-- 	end

-- if count == 1 then
-- 	for _, pid in ipairs(getOnlinePlayers()) do
-- 		if getPlayerStorageValue(pid, 25001) == 1 then
-- 			local playerids = getPlayerByName(pid)
-- 			setPlayerStorageValue(playerids, 25001, 0)
-- 		end
-- 	end

-- 	local spectators = getSpectators(centeroffight, 10, 10, false)
-- 	if spectators ~= nil then
-- 		for _, spectator in ipairs(spectators) do
-- 			if isPlayer(spectator) then
-- 				doTeleportThing(spectator,depotcenter)
-- 				doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
-- 			end
-- 		end
-- 	end

-- 	for _, pid in ipairs(getOnlinePlayers()) do
-- 		if getPlayerStorageValue(pid, 25001) == 1 then
-- 			local playerids = getPlayerByName(pid)
-- 			setPlayerStorageValue(pid, 25001, 0)
-- 		end
-- 	end

-- 	stopEvent(lmscheck)
-- 	else
-- 		addEvent(lmscheck, 10*1000)
-- 	end
-- end


function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)

	if #Game.getSpectators(posMiddle, false, true, rangex, rangex, rangey, rangey) == 0 then
		for i = 1, #pos do
			if not isPlayer(getTopCreature(pos[i]).uid) then
				return player:sendCancelMessage("You need two players to start the arena event.")			
			end
		end	
		if not doPlayerRemoveItem(cid, itemremove, 1) then
			return player:sendCancelMessage("You must have a 1v1 ticket with you in order to enter the arena. Purchase a ticket from Victor to the south.")			
		end
		
		for i = 1, #pos do
			if isPlayer(getTopCreature(pos[i]).uid) then
				if i <= #pos/2 then			
					doTeleportThing(getTopCreature(pos[i]).uid, pos.team1)
                                        doSendMagicEffect(pos.team1, 37)
				else
					doTeleportThing(getTopCreature(pos[i]).uid, pos.team2)
                                        doSendMagicEffect(pos.team2, 37)
				end
                                doPlayerSendTextMessage(cid, 19, "You have entered the PVP Arena. Survive if you can!")
			end
		end
	else
		player:sendCancelMessage("The arena is being used at this moment. Please try again later.")
	end	
return true
end