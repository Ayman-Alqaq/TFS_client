function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

		player:teleportTo({x = 32749, y = 32536, z = 10})

	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end


