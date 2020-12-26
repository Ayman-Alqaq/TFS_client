local config = {
	days = 30,
	maxDays = 365,
	count = 10
}

function onSay(player, words, param)
	if configManager.getBoolean(configKeys.FREE_PREMIUM) then
		return true
	end

	if player:getPremiumDays() <= config.maxDays then
		if player:removeItem(2157, 10) then
			player:addPremiumDays(config.days)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have bought " .. config.days .." days of premium account.")
		else
			player:sendCancelMessage("You don't have enough currency. " .. config.maxDays .. " days premium account costs " .. config.price .. " VIP tokens.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	else
		player:sendCancelMessage("You can not buy more than " .. config.maxDays .. " days of premium account.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
