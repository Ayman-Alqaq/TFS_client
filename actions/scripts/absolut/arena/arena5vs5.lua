local pos = {
[1] = {x = 32243, y = 32175, z = 8},
[2] = {x = 32243, y = 32176, z = 8},
[3] = {x = 32243, y = 32177, z = 8},
[4] = {x = 32243, y = 32178, z = 8},
[5] = {x = 32242, y = 32179, z = 8},
[6] = {x = 32243, y = 32180, z = 8},
[7] = {x = 32243, y = 32181, z = 8},
[8] = {x = 32243, y = 32182, z = 8},
[9] = {x = 32243, y = 32183, z = 8},
[10] = {x = 32243, y = 32184, z = 8},
team1 = {x = 32255, y = 32169, z = 9},
team2 = {x = 32254, y = 32188, z = 9} 
}

local posMidle = {x = 32255, y = 32179, z = 9}
local rangex = 23 
local rangey = 20 

local itemremove = 25378


function onUse(cid, item, fromPosition, itemEx)
	local player = Player(cid)

	if #Game.getSpectators(posMidle, false, true, rangex, rangex, rangey, rangey) == 0 then
		for i = 1, #pos do
			if not isPlayer(getTopCreature(pos[i]).uid) then
				return player:sendCancelMessage("You need two teams of five people to start the arena event.")			
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