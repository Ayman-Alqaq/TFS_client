local rate = configManager.getNumber(configKeys.RATE_SKILL)
local magic = configManager.getNumber(configKeys.RATE_MAGIC)
local skills = {"Magic Level", "Fist Fighting", "Club Fighting", "Sword Fighting", "Axe Fighting", "Distance Fighting", "Shielding", "Fishing"}

local staminaCost = 6 * 60
local voucherTries = math.floor((staminaCost * 1000) / 2)
local voucherId = 2263

function onModalWindow(player, modalWindowId, buttonId, choiceId)
	if modalWindowId ~= 7092 then
		return false
	end
	
	if buttonId ~= 1 then
		return false
	end
	
	local voucher = player:getItemById(voucherId, true)
	if not voucher then
		-- avoids using scroll without removing one
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Put the rune in your backpack first.")
		return false
	end
	
	if not skills[choiceId] then
		return false
	end
	
	--local stamina = player:getStamina()
	--if stamina < staminaCost then
	--	player:sendTextMessage(MESSAGE_INFO_DESCR, "You need at least " .. math.floor(staminaCost/60) .. " hours of stamina to do that.")
	--	return false
	--end
	
	local gain = 0
	local maxskill = false
	
	if choiceId == 1 then
		-- database limit
		if player:getManaSpent() > 4294967295 then
			maxskill = true
		else
			gain = voucherTries * magic * .25 --.75
				player:addManaSpent(gain)
		end
	else
		-- beyond certain point player won't receive skill tries anymore
		-- probably something in sources
		gain = voucherTries * rate
		local tries = player:getSkillTries(choiceId - 2)
		player:addSkillTries(choiceId - 2, gain)
		if tries == player:getSkillTries(choiceId - 2) then
			maxskill = true
		end
	end
	
	if maxskill then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Final skill state reached. You cannot improve any further.")	
		return true
	end
	
	--player:setStamina(stamina - staminaCost)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You gained " .. gain .. " " .. skills[choiceId] .. " point(s). ")-- .. staminaCost .. " minutes of stamina used."
	voucher:remove(1)
	return true
end

function onLogin(player)
	player:registerEvent("skillScrollWindow")
	return true
end