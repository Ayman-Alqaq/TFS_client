bountyStorage = 99981

function onSay(player, words, param)
	if param == '' then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Usage: '.. words ..' playername, money')
		return false
	end

	local sp = string.split(param, ',')
	local name, money = sp[1], tonumber(sp[2])
	local guid = getPlayerGUIDByName(name)
	local target = (guid ~= 0) and (Player(name) or guid)

	-- Has the player entered the correct parameters?
	if not (name and money) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Usage: '.. words ..' playername, money')
		return false
	end

	-- Does the target player exist?
	if not target then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Player '.. name .. ' does not exist.')
		return false
	end

	-- Is the target the same as the player?
	if guid == player:getGuid() then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You may not add a bounty to yourself.')
		return false
	end

	if money <= 0 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You must add a value greater than 0.')
		return false
	end

	-- Does the player have enough money to set a bounty to the specified target?
	if not (player:getMoney() >= money) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You do not have enough money.')
		return false
	end

	local online = type(target) == 'userdata'

	local query = "SELECT `value` FROM `player_storage` WHERE `key` = ".. bountyStorage .." AND `player_id` = ".. guid
	local getResult = db.storeQuery(query)

	if not online and not getResult then
		db.query("INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES (".. guid ..", ".. bountyStorage ..", 0)")
		getResult = db.storeQuery(query)
	end

	local dbValue = result.getDataInt(getResult, 'value')
	local newValue = money + (online and target:getStorageValue(bountyStorage) or tonumber(dbValue))
	result.free(getResult)

	-- Is the target online?
	if online then
		target:setStorageValue(bountyStorage, newValue)
	else
		db.query("UPDATE `player_storage` SET `value` = " .. newValue .. " WHERE `key` = " .. bountyStorage .. " AND `player_id` = " .. guid)
	end

	Game.broadcastMessage(string.format('[BOUNTY]: %s has added a bounty of %d gold to %s. Current bounty: %d', player:getName(), money, name, newValue), MESSAGE_STATUS_CONSOLE_ORANGE)
	player:removeMoney(money)
	return false
end