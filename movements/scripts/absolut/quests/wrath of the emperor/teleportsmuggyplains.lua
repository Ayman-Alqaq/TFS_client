local config = {
	[12380] = {toPosition = {Position(33138, 31248, 6), Position(33211, 31065, 9)}},--storageKey = Storage.WrathoftheEmperor.Questline, 
	[12381] = {toPosition = {Position(33211, 31065, 9), Position(33138, 31248, 6)}}--storageKey = Storage.WrathoftheEmperor.Questline, 
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetTile = config[item.actionid]
	if not targetTile then
		return true
	end

	--local hasStorageValue = player:getStorageValue(targetTile.storageKey) >= 5
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(targetTile.toPosition[1 or 2])--hasStorageValue and 
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	--if not hasStorageValue then
	--	player:say('This portal is not activated', TALKTYPE_MONSTER_SAY)
	--end
	return true
end
