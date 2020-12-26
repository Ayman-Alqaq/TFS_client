local teleports = {
	[3178] = {position = Position(33137, 31248, 6)},--value = 6, 
	[3179] = {position = Position(33211, 31068, 9)},--value = 6, 
	[3180] = {position = Position(33211, 31068, 9)},--value = 6,

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	--if player:getStorageValue(Storage.WrathoftheEmperor.TeleportAccess) >= teleports[item.uid].value then
		player:teleportTo(teleports[item.uid].position)
		player:getPosition():sendMagicEffect(teleports[item.uid].position, CONST_ME_TELEPORT)
	--else
	--	player:teleportTo(fromPosition)
	--end
	return true
end
