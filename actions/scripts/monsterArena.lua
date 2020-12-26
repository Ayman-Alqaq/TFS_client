MonsterArena = {
	fromPosition = {Position(32571,32321,7), Position(32573,32321,7) }, -- Location of entry tiles
	toPosition = {Position(32570,32312,7), Position(32572,32312,7) }, -- Location of arena entry
	
	spawnPosition = {Position(32570,32314,7), Position(32572,32310,7) }, -- Location of arena spawn
	
	area = {
		from = Position(32566,32308,7),  --Top Left
		to = Position(32576,32316,7) --Bottom Right
	}, -- Arena size
	
	exitPosition = {Position(32569,32294,7), Position(32571,32294,7)}, -- Location of exit tiles
	
	blockItemId = 3402,-- Blocking storage
	
	--Only convincable / summonable monsters
	monsters = {'Dwarf Guard', 'Orc Leader', 'Demon Skeleton', 'Orc Berserker', 'Gozzler', 'Quara Constrictor Scout', 'Monk', 'Gargoyle', 'Tortoise','Minotaur Guard', 'Barbarian Bloodwalker', 'Tarantula', 'Stone Golem', 'Terramite', 'Lizard Templar', 'Elephant',},
	event = 'MonsterArenaDeath', -- Name of event
	think = 'MonsterArenaThink', -- Think Event [CUSTOM LINE]
	reward = {itemId = 2160, count = 1}, -- Item reward id and count

	players = {},
}
	
	--Check if player is in arena
	function MonsterArena.hasPlayer(player)
		local position = player:getPosition() -- Assigning player position to variable
			return position.x <= MonsterArena.area.to.x and position.y <= MonsterArena.area.to.y and position.z == MonsterArena.area.from.z -- Make sure player is in arena
	end
	
	--Check if arena is occupied
	function MonsterArena.isOccupied()
			for _, pid in ipairs(MonsterArena.players) do
		local player = Player(pid)
				if player and MonsterArena.hasPlayer(player) then
					return true
				end
			end
		return false
	end
	
	--Clean the arena
	function MonsterArena.clean()
		for i = 1, #MonsterArena.players do
			MonsterArena.players[i] = nil
		end
	end
	
	-- When lever is used
	function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		if item.itemid ~= 1945 then
			item:transform(1946) --Transform lever (flip position)
			return true
		end
		
		if MonsterArena.isOccupied() then
			player:sendCancelMessage('The arena is currently occupied. Please wait...') -- Send cancel message if arena is occupied
			return true
		end
		
		local players = {}		
		for _, fromPosition in ipairs(MonsterArena.fromPosition) do		
		local creature = Tile(fromPosition):getTopCreature()	
		if not creature or not creature:isPlayer() then -- Check for two players entering
			player:sendCancelMessage('You need another player to enter the monster arena.')
			return true
		end
		table.insert(players,creature)
        end
		


		
	MonsterArena.clean() -- Clean the arena
		
		local summons = {}
		
		for i, player in ipairs(players) do
			player:removeMoney(5000)
			player:teleportTo(MonsterArena.toPosition[i]) -- Player enter arena
			MonsterArena.fromPosition[i]:sendMagicEffect(CONST_ME_POFF)
			MonsterArena.toPosition[i]:sendMagicEffect(CONST_ME_TELEPORT)
			
			local monsterName = MonsterArena.monsters[math.random(#MonsterArena.monsters)] --Get random monster
			local monster = Game.createMonster(monsterName, MonsterArena.spawnPosition[i], true) --Create the monster
			monster:setDropLoot(false)
			monster:setMaster(player) -- Set player as summoner
			monster:registerEvent(MonsterArena.event)
			table.insert(summons, monster)
			
			Game.createItem(MonsterArena.blockItemId, 1, MonsterArena.spawnPosition[i]) -- Prevent additional players from entering the arena
			
			player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('A %s if fighting for you this round!', monsterName)) -- Inform player of monster assigned
			table.insert(MonsterArena.players, player.uid)
		end
		
		players[1]:setTarget(summons[2]) -- Player 1 attack Player 2 (monster)
		players[2]:setTarget(summons[1]) -- Player 2 attack Player 1 (monster)
		
		item:transform(1945) -- Reset lever
		return true
	end
	