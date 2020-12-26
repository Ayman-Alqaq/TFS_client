dofile("data/ctf.lua")

function onUse(player, item, fromPosition, target, toPosition)
	if item.itemid == config["red_flag_itemid"] and item:getAttribute('aid') == config["flag_aid"] then
		if player:getStorageValue(config["p_red_team"]) == 1 and player:getStorageValue(config["player_has_green_flag"]) ~= 1 then
			return player:sendCancelMessage("You cannot take your own flag.")
		end

		if player:getStorageValue(config["player_has_green_flag"]) == 1 then
			player:setStorageValue(config["player_has_green_flag"], 0)
			Game.setStorageValue(config["score_red_team"], Game.getStorageValue(config["score_red_team"]) + 1)
			Game.broadcastMessage("[Capture the Flag] Red team has scored!")
			flag_pos = Tile(config["green_flag_pos"])
			flag = flag_pos:getItemById(config["no_flag_itemid"])
			flag:remove()
			no_flag = doCreateItem(config["green_flag_itemid"], 1, config["green_flag_pos"])
			item_flag_pos = Tile(config["green_flag_pos"])
			item_flag = item_flag_pos:getItemById(config["green_flag_itemid"])
			item_flag:setAttribute('aid', config["flag_aid"])

			if Game.getStorageValue(config["score_red_team"]) >= config["max_flags_captured"] then
				endCTF()
			end
		end

		if player:getStorageValue(config["p_green_team"]) == 1 then
			player:setStorageValue(config["player_has_red_flag"], 1)
			flag_pos = Tile(config["red_flag_pos"])
			flag = flag_pos:getItemById(config["red_flag_itemid"])
			flag:remove()
			local no_flag = Game.createItem(config["no_flag_itemid"], 1, config["red_flag_pos"])
			no_flag:setAttribute('aid', config["flag_aid"])
		end

		elseif item.itemid == config["green_flag_itemid"] and item:getAttribute('aid') == config["flag_aid"] then
			if player:getStorageValue(config["p_green_team"]) == 1 and player:getStorageValue(config["player_has_red_flag"]) ~= 1 then
				return player:sendCancelMessage("You cannot take your own flag.")
			end

			if player:getStorageValue(config["player_has_red_flag"]) == 1 then
				player:setStorageValue(config["player_has_red_flag"], 0)
				Game.setStorageValue(config["score_green_team"], Game.getStorageValue(config["score_green_team"]) + 1)
				Game.broadcastMessage("[Capture the Flag] Green team has scored!")
				flag_pos = Tile(config["red_flag_pos"])
				flag = flag_pos:getItemById(config["no_flag_itemid"])
				flag:remove()
				no_flag = doCreateItem(config["red_flag_itemid"], 1, config["red_flag_pos"])
				item_flag_pos = Tile(config["red_flag_pos"])
				item_flag = item_flag_pos:getItemById(config["red_flag_itemid"])
				item_flag:setAttribute('aid', config["flag_aid"])

				if Game.getStorageValue(config["score_green_team"]) >= config["max_flags_captured"] then
					endCTF()
				end
			end

			if player:getStorageValue(config["p_red_team"]) == 1 then
				player:setStorageValue(config["player_has_green_flag"], 1)
				flag_pos = Tile(config["green_flag_pos"])
				flag = flag_pos:getItemById(config["green_flag_itemid"])
				flag:remove()

				local no_flag = Game.createItem(config["no_flag_itemid"], 1, config["green_flag_pos"])
				no_flag:setAttribute('aid', config["flag_aid"])
			end

			elseif item.itemid == config["no_flag_itemid"] and item:getAttribute('aid') == config["flag_aid"] and item:getPosition() == config["red_flag_pos"] then
				if player:getStorageValue(config["p_green_team"]) == 1 then
					return player:sendCancelMessage("Red Team flag has already been captured.")
				end

				if player:getStorageValue(config["p_red_team"]) == 1 then
					if player:getStorageValue(config["player_has_green_flag"]) == 1 then
						return player:sendCancelMessage("Your flag must be returned before you can capture the enemies flag.")
						else
							return player:sendCancelMessage("Go get your flag!")
						end
					end
					elseif item.itemid == config["no_flag_itemid"] and item:getAttribute('aid') == config["flag_aid"] and item:getPosition() == config["green_flag_pos"] then
						if player:getStorageValue(config["p_red_team"]) == 1 then
							return player:sendCancelMessage("Green Team flag has already been captured.")
						end

						if player:getStorageValue(config["p_green_team"]) == 1 then
							if player:getStorageValue(config["player_has_red_flag"]) == 1 then
								return player:sendCancelMessage("Your flag must be returned before you can capture the enemies flag.")
								else
									return player:sendCancelMessage("Go get your flag!")
								end
							end
					end
					return true
				end