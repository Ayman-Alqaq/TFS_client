local config = {
	[9051] = {toPosition = Position(33181, 32664, 15)}, -- Vasrehamun
	[9052] = {toPosition = Position(33073, 32606, 15)}, -- Dipthrah
	[9053] = {toPosition = Position(33120, 32798, 14)}, -- Rahemos
	[9054] = {toPosition = Position(33206, 32979, 14)}, -- Omruc
	[9505] = {toPosition = Position(33183, 32755, 15)}, -- Mahrdis
	[9502] = {toPosition = Position(33364, 32809, 14)}, -- Thalas
	[9503] = {toPosition = Position(33259, 32707, 13)}, -- Morguthis
	[9504] = {toPosition = Position(33187, 32908, 11)}, -- Ashmunrah
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
	
	if (player:removeItem(2159, 5)) then
		player:teleportTo(targetTeleport.toPosition)
	else
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '5 scarab coins are required to use these portals.')
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end