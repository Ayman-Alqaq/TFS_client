config = {
["event"] = 50000,
["green_team"] = 50001,
["red_team"] = 50002,

["score_red_team"] = 50003,
["score_green_team"] = 50004,

["player_has_red_flag"] = 50005,
["player_has_green_flag"] = 50006,

["p_green_team"] = 50007,
["p_red_team"] = 50008,

["cycle"] = 50009,

["max_players_per_team"] = 10,
["required_players"] = 2,
["max_flags_captured"] = 10,
["end_automatic"] = true, --Should it end CTF by itself?
["end_automatically_minutes"] = 30,

["green_flag_pos"] = {x=32552, y=32444, z=5},
["red_flag_pos"] = {x=32453, y=32448, z=5},

["green_flag_itemid"] = 1437,
["red_flag_itemid"] = 1435,
["flag_aid"] = 3000,

["no_flag_itemid"] = 3532, --set this to item that pops up when flag is taken

["red_team_start_pos"] = {x=32477, y=32447, z=7},
["green_team_start_pos"] = {x=32526, y=32443, z=7},

["temple"] = {x = 32369, y = 32241, z = 7},
}

function openCTF()
	Game.setStorageValue(config["event"], 1)
	print('[CTF] Event has started.')
	Game.broadcastMessage("[Capture the Flag] Event entry is now open. Type !joinCTF to enter.")
end

function playerJoinTeam(player)
	if Game.getStorageValue(config["event"]) == 1 or Game.getStorageValue(config["event"]) == 2 then
		if Game.getStorageValue(config["red_team"]) > config["max_players_per_team"] and Game.getStorageValue(config["green_team"]) > config["max_players_per_team"] then
			return	 player:sendCancelMessage("The teams are full.")
		end

		if Game.getStorageValue(config["red_team"]) <= Game.getStorageValue(config["green_team"]) and Game.getStorageValue(config["red_team"]) <= config["max_players_per_team"] then
			player:setStorageValue(config["p_red_team"], 1)
			Game.setStorageValue(config["red_team"], Game.getStorageValue(config["red_team"]) + 1)
			player:sendTextMessage(4, "You have joined the red team. The Capture the Flag event will start when enough players have joined. Type !leaveCTF to exit the queue")
			elseif Game.getStorageValue(config["green_team"]) <= Game.getStorageValue(config["red_team"]) and Game.getStorageValue(config["green_team"]) <= config["max_players_per_team"] then
				player:setStorageValue(config["[p_green_team"], 1)
				Game.setStorageValue(config["green_team"], Game.getStorageValue(config["green_team"]) + 1)
				player:sendTextMessage(4, "You have joined the green team. The Capture the Flag event will start when enough players have joined. Type !leaveCTF to exit the queue.")
			end
		else
			return player:sendCancelMessage("The Capture the Flag event is not open.")
		end
	end

function checkCTF()
	if Game.getStorageValue(config["event"]) == 1 then
		red_team = Game.getStorageValue(config["red_team"])
		green_team = Game.getStorageValue(config["green_team"])
		if red_team + green_team >= config["required_players"] then
			Game.broadcastMessage("[Capture the Flag] Event will start in 5 minutes.")
			Game.setStorageValue(config["event"], 2)
			Game.setStorageValue(config["cycle"], 1)
			addEvent(nextStep, 60 * 1000)
		end
	end
end

function nextStep()
	if Game.getStorageValue(config["event"]) == 2 then
		red_team = Game.getStorageValue(config["red_team"])
		green_team = Game.getStorageValue(config["green_team"])
		if red_team + green_team < config["required_players"] then
			Game.broadcastMessage("[Capture the Flag] Players have left the queue. There are not enough players for the event to start.")
			Game.setStorageValue(config["event"], 1)
			return false
		end

		if Game.getStorageValue(config["cycle"]) < 5 then
			time_left = 5 - Game.getStorageValue(config["cycle"])
			Game.broadcastMessage("[Capture the Flag] Event will start in "..time_left.." minutes.")
			Game.setStorageValue(config["cycle"], Game.getStorageValue(config["cycle"]) + 1)
			addEvent(nextStep, 60 * 1000)
		else
			Game.setStorageValue(config["event"], 3)
			Game.setStorageValue(config["cycle"], 0)
			addEvent(startCTF, 0)
		end
	end
end

function startCTF()
	players = Game.getPlayers()
	for i = 1, #players do
		player = Player(players[i])
		if player:getStorageValue(config["p_red_team"]) == 1 then
			player:teleportTo(config["red_team_start_pos"])
			player:sendTextMessage(4, "[Capture the Flag] Event has started.")
		elseif player:getStorageValue(config["p_green_team"]) == 1 then
			player:teleportTo(config["green_team_start_pos"])
			player:sendTextMessage(4, "[Capture the Flag] Event has started.")
		end
	end
	Game.setStorageValue(config["score_green_team"], 0)
	Game.setStorageValue(config["score_red_team"], 0)
	if config["end_automatic"] == true then
	addEvent(endCTF, config["end_automatically_minutes"] * 60 * 1000)
	end
end

function endCTF()
	players = Game.getPlayers()
	if Game.getStorageValue(config["score_green_team"]) > Game.getStorageValue(config["score_red_team"]) then
		for i = 1, #players do
			player = Player(players[i])
			if player:getStorageValue(config["p_green_team"]) == 1 then
			--Add rewards here
			player:sendTextMessage(4, "Your team has won!")
		end
	end
	elseif Game.getStorageValue(config["score_green_team"]) < Game.getStorageValue(config["score_red_team"]) then
		for i = 1, #players do
			player = Player(players[i])
			if player:getStorageValue(config["p_red_team"]) == 1 then
			--Add rewards here
			player:sendTextMessage(4, "Your team has won!")
		end
	end
	Game.broadcastMessage("[Capture the Flag] Red team has won the event!")
	elseif Game.getStorageValue(config["score_green_team"]) == Game.getStorageValue(config["score_red_team"]) then
		for i = 1, #players do
			player = Player(players[i])
			if player:getStorageValue(config["p_red_team"]) == 1 or player:getStorageValue(config["p_green_team"]) == 1 then
			--Add tie rewards here
			player:sendTextMessage(4, "Tie Game!")
			end
		end
		Game.broadcastMessage("[Capture the Flag] Tie Game!")
	end

	for i = 1, #players do
		if player:getStorageValue(config["p_red_team"]) == 1 then
			player:setStorageValue(config["p_red_team"], 0)
			player:teleportTo(config["temple"])
			elseif player:getStorageValue(config["p_green_team"]) == 1 then
				player:setStorageValue(config["p_green_team"], 0)
				player:teleportTo(config["temple"])
			end
		end
		Game.setStorageValue(config["score_green_team"], 0)
		Game.setStorageValue(config["score_red_team"], 0)
		Game.setStorageValue(config["event"], 0)
		Game.setStorageValue(config["cycle"], 0)
		Game.setStorageValue(config["red_team"], 0)
		Game.setStorageValue(config["green_team"], 0)
	end