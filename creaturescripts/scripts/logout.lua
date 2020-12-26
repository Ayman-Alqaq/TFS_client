function onLogout(player)
	local playerId = player:getId()
	if nextUseStaminaTime[playerId] ~= nil then
		nextUseStaminaTime[playerId] = nil
	end

	--Capture the Flag
	if player:getStorageValue(config["p_green_team"]) == 1 then
		player:setStorageValue(config["p_green_team"], 0)
		Game.setStorageValue(config["green_team"], Game.getStorageValue(config["green_team"]) - 1)
	elseif player:getStorageValue(config["p_red_team"]) == 1 then
		player:setStorageValue(config["p_red_team"], 0)
		Game.setStorageValue(config["p_red_team"], Game.getStorageValue(config["p_red_team"]) - 1)
	end
	
	if player:getStorageValue(50010) > 0 then
		player:setStorageValue(50010, 0)
	end

	return true
end
