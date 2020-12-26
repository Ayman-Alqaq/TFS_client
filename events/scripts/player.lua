function Player:onBrowseField(position)
	return true
end

function Player:onLook(thing, position, distance)
--Custom Rune Game Function--
	if thing:isItem() and (thing.actionid == 31337) then
		local pid = self:getId()
		if MATCH.SCORE[pid] == nil then
			return false
		end

		if thing:getId() ~= MATCH.HIDDEN then
			return false
		end

		if getValue(MATCH.EXHAUST[pid]) >= os.time(t) then
			self:say("Wait...", TALKTYPE_MONSTER_SAY, false, self)
			return false
		end

		local a = MATCH.COUNT[pid]
		if a == 2 then
			return false
		end

		MATCH.EXHAUST[pid] = os.time(t) + 1
		MATCH.COUNT[pid] = a + 1
		self:getPosition():sendDistanceEffect(position, 31)
		local v, p = showRune(pid, thing), MATCH.POS[pid]
		enableSleep(function()
			if v ~= nil then
				pause(500)
				MATCH.POS[pid] = 0
				MATCH.LAST[pid] = 0
				MATCH.COUNT[pid] = 0

				if v then
					for _, pos in ipairs({p, position}) do
						local b = Tile(pos):getTopVisibleThing(false)
						if isMatchRune(b:getId()) then
							b:remove()
							pos:sendMagicEffect(10)
						end
					end
					self:say("MATCH!", TALKTYPE_MONSTER_SAY, false, nil, p)
					self:say("MATCH!", TALKTYPE_MONSTER_SAY, false, nil, position)
					p:sendDistanceEffect(self:getPosition(), 36)
					position:sendDistanceEffect(self:getPosition(), 36)
					local u = getValue(MATCH.SCORE[pid])
					MATCH.SCORE[pid] = u + 2
					local k = (getValue(MATCH.SCORE[pid])/(MATCH.SIZE[1]*MATCH.SIZE[2]))*100
					self:say(math.floor(k) .. "%", TALKTYPE_MONSTER_SAY)
					self:sendCancelMessage(getValue(MATCH.SCORE[pid])/2 .. "/".. (MATCH.SIZE[1]*MATCH.SIZE[2])/2 .." runes unlocked")
					if isBoardEmpty() then
						endMatch()
					end
				else
					hideRune(p)
					hideRune(position)
					self:say("FAIL!", TALKTYPE_MONSTER_SAY, false, nil, p)
					self:say("FAIL!", TALKTYPE_MONSTER_SAY, false, nil, position)
					stopEvent(MATCH.EVENT[pid])
				end
			end
			end)
		return false
	end
--End custom function--
	local description = "You see " .. thing:getDescription(distance)
		if thing:isItem() then
			description = string.format("%s\nItem ID: %d", description, thing:getId())
	if self:getGroup():getAccess() then
			local position = thing:getPosition()
			description = string.format("%s\nPosition: %d, %d, %d",	description, position.x, position.y, position.z)
			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, Action ID: %d", description, actionId)
			end
			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, Unique ID: %d", description, uniqueId)
			end
			local itemType = thing:getType()
			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onEquip)", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onDeEquip)", description, transformDeEquipId)
			end
			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecays to: %d", description, decayId)
			end
			elseif thing:isCreature() then
			local str = "%s\nHealth: %d / %d"
			if thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: %d / %d", str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
	end

	if thing:isCreature() then
		if thing:isPlayer() then
			description = string.format("%s\nIP: %s.", description, Game.convertIpToString(thing:getIp()))
		end
	end
	if thing:isPlayer() then
		local pronoun, posess, user = thing:getSex() == PLAYERSEX_MALE and 'He' or 'She', 'has', thing
		if thing == self then
			pronoun = 'You'
			posess = 'have'
			user = self
		end
		local bounty = user:getStorageValue(bountyStorage)
		if bounty > 0 then
			description = description .. string.format('\n%s %s a bounty of %d gold coins.', pronoun, posess, bounty)
		end
	end
end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInBattleList(creature, distance)
	local description = "You see " .. creature:getDescription(distance)
	if self:getGroup():getAccess() then
		local str = "%s\nHealth: %d / %d"
		if creature:getMaxMana() > 0 then
			str = string.format("%s, Mana: %d / %d", str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. "."

		local position = creature:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if creature:isPlayer() then
			description = string.format("%s\nIP: %s", description, Game.convertIpToString(creature:getIp()))
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInTrade(partner, item, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, "You see " .. item:getDescription(distance))
end

function Player:onLookInShop(itemType, count)
	return true
end

function Player:onMoveItem(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
--Custom Rune Game Function--
	if fromPosition:isInRange(MATCH.BOARD.from, MATCH.BOARD.to) then
		self:sendCancelMessage('Sorry, not possible.')
	return false
	end

	if toPosition:isInRange(MATCH.BOARD.from, MATCH.BOARD.to) then
		self:sendCancelMessage('Sorry, not possible.')
	return false
	end
--End custom Function
-- Custom Slot function--
local tile = Tile(toPosition)
if tile and tile:getGround() and(tile:getGround().actiondid == 6577) then
	self:sendCancelMessage('Sorry, not possible.')
	return false
end
--End custom function--
	return true
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	return true
end

local function hasPendingReport(name, targetName, reportType)
	local f = io.open(string.format("data/reports/players/%s-%s-%d.txt", name, targetName, reportType), "r")
	if f then
		io.close(f)
		return true
	else
		return false
	end
end

function Player:onReportRuleViolation(targetName, reportType, reportReason, comment, translation)
	local name = self:getName()
	if hasPendingReport(name, targetName, reportType) then
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your report is being processed.")
		return
	end

	local file = io.open(string.format("data/reports/players/%s-%s-%d.txt", name, targetName, reportType), "a")
	if not file then
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There was an error when processing your report, please contact a gamemaster.")
		return
	end

	io.output(file)
	io.write("------------------------------\n")
	io.write("Reported by: " .. name .. "\n")
	io.write("Target: " .. targetName .. "\n")
	io.write("Type: " .. reportType .. "\n")
	io.write("Reason: " .. reportReason .. "\n")
	io.write("Comment: " .. comment .. "\n")
	if reportType ~= REPORT_TYPE_BOT then
		io.write("Translation: " .. translation .. "\n")
	end
	io.write("------------------------------\n")
	io.close(file)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Thank you for reporting %s. Your report will be processed by %s team as soon as possible.", targetName, configManager.getString(configKeys.SERVER_NAME)))
	return
end

function Player:onReportBug(message, position, category)
	if self:getAccountType() == ACCOUNT_TYPE_NORMAL then
		return false
	end

	local name = self:getName()
	local file = io.open("data/reports/bugs/" .. name .. " report.txt", "a")

	if not file then
		self:sendTextMessage(MESSAGE_EVENT_DEFAULT, "There was an error when processing your report, please contact a gamemaster.")
		return true
	end

	io.output(file)
	io.write("------------------------------\n")
	io.write("Name: " .. name)
	if category == BUG_CATEGORY_MAP then
		io.write(" [Map position: " .. position.x .. ", " .. position.y .. ", " .. position.z .. "]")
	end
	local playerPosition = self:getPosition()
	io.write(" [Player Position: " .. playerPosition.x .. ", " .. playerPosition.y .. ", " .. playerPosition.z .. "]\n")
	io.write("Comment: " .. message .. "\n")
	io.close(file)

	self:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Your report has been sent to " .. configManager.getString(configKeys.SERVER_NAME) .. ".")
	return true
end

function Player:onTurn(direction)
	if self:getGroup():getAccess() and self:getDirection() == direction then
		local nextPosition = self:getPosition()
		nextPosition:getNextPosition(direction)
		self:teleportTo(nextPosition, true)
	end
	return true
end

function Player:onTradeRequest(target, item)
	return true
end

function Player:onTradeAccept(target, item, targetItem)
	return true
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

function Player:onGainExperience(source, exp, rawExp)
	if not source or source:isPlayer() then
		return exp
	end

	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Apply experience stage multiplier
	exp = exp * Game.getExperienceStage(self:getLevel())

	-- Stamina modifier
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)

		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5
		end
	end

	return exp
end

function Player:onLoseExperience(exp)
	return exp
end

function Player:onGainSkillTries(skill, tries)
	if APPLY_SKILL_MULTIPLIER == false then
		return tries
	end

	if skill == SKILL_MAGLEVEL then
		return tries * configManager.getNumber(configKeys.RATE_MAGIC)
	end
	return tries * configManager.getNumber(configKeys.RATE_SKILL)
end
