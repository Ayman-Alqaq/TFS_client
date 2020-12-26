dofile("data/ctf.lua")

function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local player = Player(cid)
	if not player then
	return
	end
	
	if player:getStorageValue(config["p_green_team"]) == 1 then
		player:setDropLoot(false)
		player:teleportTo(config["green_team_start_pos"])
		player:addHealth(player:getMaxHealth())
		if player:getStorageValue(config["player_has_red_flag"]) == 1 then
			flag_pos = Tile(config["red_flag_pos"])
			flag = flag_pos:getItemById(config["no_flag_itemid"])
			flag:remove()
			flag_new = doCreateItem(config["red_flag_itemid"], 1, config["red_flag_pos"])
			flag_new:setItemAttribute('aid', config["flag_aid"])
			player:setStorageValue(config["player_has_red_flag"], 0)
		end
		elseif player:getStorageValue(config["p_red_team"]) == 1 then
			player:setDropLoot(false)
			player:teleportTo(config["red_team_start_pos"])player:addHealth(player:getMaxHealth())
			if player:getStorageValue(config["player_has_green_flag"]) == 1 then
				flag_pos = Tile(config["green_flag_pos"])
				flag = flag_pos:getItemById(config["no_flag_itemid"])
				flag:remove()
				flag_new = doCreateItem(config["green_flag_itemid"], 1, config["green_flag_pos"])
				flag_new:setItemAttribute('aid', config["flag_aid"])
				player:setStorageValue(config["player_has_green_flag"], 0)
			end
		end
	end