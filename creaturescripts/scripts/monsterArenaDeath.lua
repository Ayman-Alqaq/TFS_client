function onDeath(monster, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local winnerPlayer = killer:getMaster() -- Find winning player
	local loserPlayer = monster:getMaster() -- Find losing player
	local reward = MonsterArena.reward
	
	if reward then
		if killer:getMaster() then
			winnerPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your monster won the fight and earned a reward for you!')
			winnerPlayer:addItem(reward.itemId, reward.count) -- Create reward item and give to player
	else
			--Custom Error Handler
			killer:sendTextMessage(MESSAGE_INFO_DESCR, 'Your monster won the fight! Enjoy your reward!')
			killer:addItem(reward.itemId, reward.count)
		end
	else
		winnerPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations, Your monster won the fight!')
	end

	loserPlayer:sendTextMessage(MESSAGE_INFO_DESCR, 'I\'m sorry. Your monster lost the fight.')

	winnerPlayer:teleportTo(MonsterArena.exitPosition[1]) --oRIGINAL
	loserPlayer:teleportTo(MonsterArena.exitPosition[2]) -- ORIGINAL
	MonsterArena.exitPosition[1]:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	MonsterArena.exitPosition[2]:sendMagicEffect(CONST_ME_MAGIC_BLUE)

	--Keep tiles clean of trash
	for _, position in ipairs(MonsterArena.spawnPosition) do
local item = Tile(position):getItemById(MonsterArena.blockItemId)
		if item then
			item:remove()
		end
	end
	
	if killer:getMaster() then
		killer:remove()
	end
	
	if monster:getMaster() then
		monster:remove()
	end
	return true
end