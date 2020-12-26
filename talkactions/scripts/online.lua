local maxPlayersPerMessage = 10

function onSay(player, words, param)
	local hasAccess = player:getGroup():getAccess()
	local players = Game.getPlayers()
	local onlineList = {}

	for _, targetPlayer in ipairs(players) do
		if hasAccess or not targetPlayer:isInGhostMode() then
			table.insert(onlineList, ("%s [%d]"):format(targetPlayer:getName(), targetPlayer:getLevel()))
		end
	end

	local playersOnline = #onlineList
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ("%d players online."):format(playersOnline))

	for i = 1, playersOnline, maxPlayersPerMessage do
		local j = math.min(i + maxPlayersPerMessage - 1, playersOnline)
		local msg = table.concat(onlineList, ", ", i, j) .. "."
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
	end
	
	--local msg = {}
	-- for k, nPlayer in ipairs(players) do
		-- if hasAccess or not nPlayer:isInGhostMode() then
			-- local bounty = nPlayer:getStorageValue(bountyStorage)
			-- local max = (k == playerCount)
			-- --table.insert(msg, string.format('There is a reward for killing %s [%d]', nPlayer:getName(), nPlayer:getLevel(), (bounty ~= -1) and '[Bounty: '..bounty..'gold coins]' or '', max and '.' or ','))
		-- end
	-- end
		
	--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, table.concat(msg, ' '))
	return false
end
