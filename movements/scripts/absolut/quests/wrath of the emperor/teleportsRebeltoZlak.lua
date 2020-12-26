local config = {
	[12382] = {toPosition = {Position(33078, 31219, 8), Position(33216, 31069, 9)}},--storageKey = Storage.WrathoftheEmperor.Questline, 
	[12383] = {toPosition = {Position(33216, 31069, 9), Position(33078, 31219, 8)}}--storageKey = Storage.WrathoftheEmperor.Questline, 
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

	--local hasStorageValue = player:getStorageValue(targetTile.storageKey) >= 23
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(targetTile.toPosition[1 or 2])--hasStorageValue and 
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	--if not hasStorageValue then
	--	player:say('This portal is not activated', TALKTYPE_MONSTER_SAY)
	--end
	return true
end
