local premiumDaysCost = 10

function onSay(player, words, param)
	if player:getGroup():getAccess() then
		player:setSex(player:getSex() == PLAYERSEX_FEMALE and PLAYERSEX_MALE or PLAYERSEX_FEMALE)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have changed your sex.")
		return false
	end

	if player:removeItem(2157, 10) then
	--if player:getPremiumDays() >= premiumDaysCost then
		--player:removePremiumDays(premiumDaysCost)
		player:setSex(player:getSex() == PLAYERSEX_FEMALE and PLAYERSEX_MALE or PLAYERSEX_FEMALE)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have changed your sex for " .. premiumDaysCost .. " VIP Tokens.")
	else
		player:sendCancelMessage("You do not have enough VIP Tokens, changing sex costs " .. premiumDaysCost .. " VIP Tokens.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
