dofile("data/ctf.lua")

function onSay(player, words)
	if (words == "!startCTF") then
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
	Game.setStorageValue(config["green_team"], 0)
	Game.setStorageValue(config["red_team"], 0)
	Game.setStorageValue(config["p_green_team"], 0)
	Game.setStorageValue(config["p_red_team"], 0)
	Game.setStorageValue(config["score_red_team"], 0)
	Game.setStorageValue(config["score_green_team"], 0)
	Game.setStorageValue(config["cycle"], 0)
	openCTF()

	elseif (words == "!joinCTF") then
	if player:getStorageValue(config["p_red_team"]) == 1 or player:getStorageValue(config["p_green_team"]) == 1 then
	return player:sendCancelMessage("[Capture the Flag] You have already joined the event.")
	end
	playerJoinTeam(player)
	elseif (words == "!leaveCTF") then
		if player:getStorageValue(config["p_green_team"]) == 1 then
			player:setStorageValue(config["p_green_team"], 0)
			Game.setStorageValue(config["green_team"], Game.getStorageValue(config["green_team"]) - 1)
			player:sendTextMessage(4, "You have left the event.")
		elseif player:getStorageValue(config["p_red_team"]) == 1 then
			player:setStorageValue(config["p_red_team"], 0)
			Game.setStorageValue(config["red_team"], Game.getStorageValue(config["red_team"]) - 1)
			player:sendTextMessage(4, "[Capture the Flag] You have left the event.")
		else
		player:sendTextMessage(4, "[Capture the Flag] You are not in the event queue.")
		end
	end
return false
end
