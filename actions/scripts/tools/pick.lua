local groundIds = {354, 355}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId, targetActionId = target.itemid, target.actionid
	if isInArray({354, 355}, targetId) and (target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID)) then
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

	elseif targetId == 7200 then
		target:transform(7236)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)

	--The Ice Islands Quest, Nibelor 1: Breaking the Ice
	elseif targetId == 3621 and targetActionId == 12026 then
		local missionProgress, pickAmount = player:getStorageValue(Storage.TheIceIslands.Mission02), player:getStorageValue(Storage.TheIceIslands.PickAmount)
		if missionProgress < 1 or pickAmount >= 3 or player:getStorageValue(Storage.TheIceIslands.Questline) ~= 3 then
			return false
		end

		player:setStorageValue(Storage.TheIceIslands.PickAmount, math.max(0, pickAmount) + 1)
		player:setStorageValue(Storage.TheIceIslands.Mission02, missionProgress + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice

		if pickAmount >= 2 then
			player:setStorageValue(Storage.TheIceIslands.Questline, 4)
			player:setStorageValue(Storage.TheIceIslands.Mission02, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
		end

		local crackItem = Tile(toPosition):getItemById(7185)
		if crackItem then
			crackItem:transform(7186)
			addEvent(revertItem, 60 * 1000, toPosition, 7186, 7185)
		end

		local chakoyas = {"chakoya toolshaper", "chakoya tribewarden", "chakoya windcaller"}
		Game.createMonster(chakoyas[math.random(#chakoyas)], toPosition)
		toPosition:sendMagicEffect(CONST_ME_TELEPORT)

	elseif targetId == 1304 then
		--The Pits of Inferno Quest
		if target.uid == 1022 then
			for i = 1, #lava do
				Game.createItem(5815, 1, lava[i])
			end
			target:transform(2256)
			toPosition:sendMagicEffect(CONST_ME_SMOKE)

		-- naginata quest
		elseif targetActionId == 50058 then
			local stoneStorage = Game.getStorageValue(GlobalStorage.NaginataStone)
			if stoneStorage ~= 5 then
				Game.setStorageValue(GlobalStorage.NaginataStone, math.max(0, stoneStorage) + 1)
			elseif stoneStorage == 5 then
				target:remove()
				Game.setStorageValue(GlobalStorage.NaginataStone)
			end

			toPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -31, -39, CONST_ME_NONE)
		end

	 --The Banshee Quest
	elseif targetId == 9025 and targetActionId == 101 then
		target:transform(392)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

	 -- The Hidden City of Beregar Quest
	elseif targetActionId == 50090 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) == 1 then
			player:teleportTo(Position(32566, 31338, 10))
		end

	elseif targetActionId == 50114 then
		if Tile(Position(32617, 31513, 9)):getItemById(1027) and Tile(Position(32617, 31514, 9)):getItemById(1205) then
			local rubbleItem = Tile(Position(32619, 31514, 9)):getItemById(5709)
			if rubbleItem then
				rubbleItem:remove()
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't remove this pile since it's currently holding up the tunnel.")
		end

	-- Pythius The Rotten (Firewalker Boots)
	elseif targetActionId == 50127 then
		if player:getStorageValue(Storage.QuestChests.FirewalkerBoots) == 1 then
			return false
		end

		target:remove()

		local stoneItem = Tile(toPosition):getItemById(1304)
		if stoneItem then
			stoneItem:remove()
		end

		iterateArea(
			function(position)
				local groundItem = Tile(position):getGround()
				if groundItem and groundItem.itemid == 598 then
					groundItem:transform(5815)
				end
			end,
			Position(32550, 31373, 15),
			Position(32551, 31379, 15)
		)
		iterateArea(
			function(position)
				position:sendMagicEffect(CONST_ME_POFF)
			end,
			Position(32551, 31374, 15),
			Position(32551, 31379, 15)
		)

		local portal = Game.createItem(1387, 1, Position(32551, 31376, 15))
		if portal then
			portal:setActionId(50126)
		end

	-- Wrath of the emperor quest
	elseif targetId == 12296 then
		player:addItem(12295, 1)
		player:say("The cracked part of the table lets you cut out a large chunk of wood with your pick.", TALKTYPE_MONSTER_SAY)

	elseif targetId == 22671 then
		target:transform(392)
		target:decay()
	else
		return false
	end

	return true
end
