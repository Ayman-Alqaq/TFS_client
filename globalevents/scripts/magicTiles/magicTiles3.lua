local lobbyPos = Position(32663, 32462, 7) --Center of area

function onThink(interval)
	local players = Game.getSpectators(lobbyPos, false, true, 16, 16, 16, 16)
	if players[1] ~= nil then
		for i = 1, #players do
			local player = Player(players[i])
			local mana = player:getMana()
			if mana ~= 0 then
				player:addMana(-mana)
				player:addManaSpent(mana)
				Position(player:getPosition()):sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
		end
	end
	return true
end
