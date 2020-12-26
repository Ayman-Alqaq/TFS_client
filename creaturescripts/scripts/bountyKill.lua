function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local bountyValue = player:getStorageValue(bountyStorage)
	if not killer:getPlayer() then
		return true
	end

	if bountyValue ~= -1 then
		local sex = (killer:getSex() == PLAYERSEX_MALE) and 'he' or 'she'
		Game.broadcastMessage(string.format('[BOUNTY] %s has killed %s with a bounty, %s has been rewarded with %d gold.', killer:getName(), player:getName(), sex, bountyValue), MESSAGE_STATUS_CONSOLE_ORANGE)
		killer:addMoney(bountyValue)
		player:setStorageValue(bountyStorage, -1)
	end
	return true
end