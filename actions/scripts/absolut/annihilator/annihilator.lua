local config = {
	{fromPosition = Position(33222, 31671, 13), toPosition = Position(33219, 31569, 13)},
	{fromPosition = Position(33223, 31671, 13), toPosition = Position(33220, 31569, 13)},
	{fromPosition = Position(33224, 31671, 13), toPosition = Position(33221, 31569, 13)},
	{fromPosition = Position(33225, 31671, 13), toPosition = Position(33222, 31569, 13)}
}

local demons = {
	[1] = Position(33219, 31657, 13),
	[2] = Position(33221, 31657, 13),
	[3] = Position(33220, 31661, 13),
	[4] = Position(33222, 31661, 13),
	[5] = Position(33223, 31659, 13),
	[6] = Position(33224, 31659, 13)
}

local pullPosition = Position(33226, 31671, 13)

local timeLimit = 30

local function resetAnnihilator(uid)
	local item = Item(uid)
	if item.itemid == 1946 then
		item:transform(1945)
	end
	for i = 1, #demons do
		local creatures = Tile(demons[i]):getCreatures()
		for key, creature in pairs(creatures) do
			if creature:getName() == "Demon" then
				creature:remove()
			end
		end
	end
	for key, value in pairs(config) do
		local creatures = Tile(value.toPosition):getCreatures()
		for k, creature in pairs(creatures) do
			if creature:getName() == "Demon" then
				creature:remove()
			end
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local count = 0
		for i = 1, #config do
			if config[i].fromPosition == pullPosition and player:getPosition() ~= pullPosition then
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You are in the wrong position.')
				return false
			end

			local creature = Tile(config[i].fromPosition):getBottomCreature()
			if creature then
				if not creature:isPlayer() then
					player:sendTextMessage(MESSAGE_INFO_DESCR, creature:getName()..' is not a valid participant.')
					return false
				end

				if creature:getLevel() < 100 then
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'Some players are under the required level 100.')
					return false
				end

				count = count + 1
			end
		end

		if count < 1 then
			return false
		end

		for i = 1, #config do
			local creature = Tile(config[i].fromPosition):getBottomCreature()
			if creature then
				creature:teleportTo(config[i].toPosition)
				config[i].toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			end
		end

		for i = 1, #demons do
			doSummonCreature('Demon', demons[i], false, true)
		end
		
		item:transform(1946)
		addEvent(resetAnnihilator, timeLimit*60*1000, item.uid)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'Someone has recently started this quest, the cooldown is '..timeLimit..' minutes.')
		return false
	end
	return true
end
