dofile("data/lib/koh.lua")

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	
	if getGlobalStorageValue(KOH.status) == 1 then
		player:sendCancelMessage('King of Hill has already started.')
		return player:teleportTo(fromPosition, true)
	end
	
	if getGlobalStorageValue(KOH.status) == -1 then
		player:sendCancelMessage('King of Hill is not currently running.')
		return player:teleportTo(fromPosition, true)
	end
								
	if player:getLevel() < KOH.player_level then
		player:sendCancelMessage('You need to be at least of level ' .. KOH.player_level .. ' to join KoH.')
		return player:teleportTo(fromPosition, true)
	end
				
	if KOH.ip_check and KOH.hasDuplicateIP(player) then
		player:sendCancelMessage('You cannot join KoH with someone else having your same IP.')
		return player:teleportTo(fromPosition, true)
	end

    local count = 0
    for i, counted in ipairs(Game.getPlayers()) do
    	if counted:getPosition():isInRange(KOH.wait_room.from, KOH.wait_room.to) then
        	count = count + 1
      	end
   	end

    if count >= KOH.max_players then
    	player:sendCancelMessage('KoH event is already full.')
        return player:teleportTo(fromPosition, true)
   	end

	player:openChannel(KOH.channel)
	KOH.teleport(player, KOH.wait_room.from, KOH.wait_room.to)
	KOH.broadcast(KOH.msg_join:format(player:getName()), 8)
	return true
end