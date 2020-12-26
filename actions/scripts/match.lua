function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for _, pos in ipairs(MATCH.PLAYERS.to) do
		local v = Tile(pos):getTopCreature()
		if v ~= nil then
			return player:say("There are still players in the game!", TALKTYPE_MONSTER_SAY, false, nil, fromPosition)
		end
	end

	local players = {}
	for _, pos in ipairs(MATCH.PLAYERS.from) do
		local v = Tile(pos):getTopCreature()
		if (v ~= nil) and v:isPlayer() then
			table.insert(players, v)
		end
	end

	if #players > 4 then
		return player:say("Limit is 4 players!", TALKTYPE_MONSTER_SAY, false, nil, fromPosition)
	end

	if #players < 2 then
		return player:say("At least 2 players are needed!", TALKTYPE_MONSTER_SAY, false, nil, fromPosition)
	end

	newBoard()
	for i, eventPlayer in ipairs(players) do
		local pid = eventPlayer:getId()
		eventPlayer:teleportTo(MATCH.PLAYERS.to[i])
		MATCH.POS[pid] = 0
		MATCH.LAST[pid] = 0
		MATCH.COUNT[pid] = 0
		MATCH.SCORE[pid] = 0
		MATCH.EXHAUST[pid] = 0
	end
	return item:transform(item:getId() == 1945 and 1946 or 1945)
end