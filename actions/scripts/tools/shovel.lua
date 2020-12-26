local holes = {294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285, 8284, 8281,
	8280, 8279, 8277, 8276, 8567, 8585, 8596, 8595, 8249, 8250, 8251,
	8252, 8253, 8254, 8255, 8256, 8592, 8972, 9606, 9625, 13190, 14461, 19519, 21536}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local targetId, targetActionId = target.itemid, target.actionid
	if isInArray(holes, targetId) then
		target:transform(targetId + 1)
		target:decay()

	elseif isInArray({231, 9059}, targetId) then
		local rand = math.random(100)
		if target.actionid == 100 and rand <= 20 then
			target:transform(489)
			target:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster("Scarab", toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)

	-- Wrath of the emperor quest
	elseif targetId == 351 and targetActionId == 8024 then
		player:addItem(12297, 1)
		player:say("You dig out a handful of earth from this sacred place.", TALKTYPE_MONSTER_SAY)

	-- RookgaardTutorialIsland
	elseif targetId == 8579 and player:getStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage) < 20 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug a hole! Walk onto it as long as it is open to jump down into the forest cave.')
		player:setStorageValue(Storage.RookgaardTutorialIsland.tutorialHintsStorage, 19)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALARROW)
		Position(32070, 32266, 7):sendMagicEffect(CONST_ME_TUTORIALSQUARE)
		target:transform(469)
		addEvent(revertItem, 30 * 1000, toPosition, 469, 8579)

	-- Gravedigger Quest
	elseif targetActionId == 4654 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission49) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission50) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission50, 1)

	elseif targetActionId == 4668 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission67) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission68) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:addItem(21250, 1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission68, 1)

	-- ???
	elseif targetActionId == 50118 then
		local wagonItem = Tile(Position(32717, 31492, 11)):getItemById(7131)
		if wagonItem then
			Game.createItem(8749, 1, wagonItem:getPosition())
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end

	elseif targetId == 8749 then
		local coalItem = Tile(Position(32699, 31492, 11)):getItemById(8749)
		if coalItem then
			coalItem:remove()
			toPosition:sendMagicEffect(CONST_ME_POFF)

			local crucibleItem = Tile(Position(32699, 31494, 11)):getItemById(8642)
			if crucibleItem then
				crucibleItem:setActionId(50119)
			end
		end

	elseif isInArray({9632, 20230}, targetId) then
		if player:getStorageValue(Storage.SwampDiggingTimeout) >= os.time() then
			return false
		end

		local config = { {from = 1, to = 39, itemId = 2817}, {from = 40, to = 79, itemId = 2145}, {from = 80, to = 100, itemId = 20138} }
		local chance = math.random(100)

		for i = 1, #config do
			local randItem = config[i]
			if chance >= randItem.from and chance <= randItem.to then
				player:addItem(randItem.itemId, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug up a ' .. ItemType(randItem.itemId):getName() .. '.')
				player:setStorageValue(Storage.SwampDiggingTimeout, os.time() + 604800)
				toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
				break
			end
		end

	elseif targetId == 103 and targetActionId == 4205 then
		if player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) ~= 1 then
			return false
		end

		local remains = Game.createItem(2248, 1, toPosition)
		if remains then
			remains:setActionId(4206)
		end
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
		addEvent(removeRemains, 60000, toPosition)

	elseif targetId == 22674 then
		if not player:removeItem(5091, 1) then
			return false
		end

		target:transform(5731)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	else
		return false
	end

	return true
end
