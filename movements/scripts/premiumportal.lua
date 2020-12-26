function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:isPremium() then
		return true
	end

	fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	player:teleportTo(fromPosition)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need a premium account in order to pass.')
	return true
end