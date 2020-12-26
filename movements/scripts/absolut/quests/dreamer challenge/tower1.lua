local config = {
	[3050] = {storageValue = 1, toPosition = Position(32750, 32344, 14)}, -- Dream Realm
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetTeleport = config[item.uid]
	if not targetTeleport then
		return true
	end

	if (player:getStorageValue(Storage.OutfitQuest.NightmareOutfit) >= targetTeleport.storageValue
			or player:getStorageValue(Storage.OutfitQuest.BrotherhoodOutfit) >= targetTeleport.storageValue)
			and player:removeItem(5022, 1) then
		player:teleportTo(targetTeleport.toPosition)
	else
		player:teleportTo(fromPosition)
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end