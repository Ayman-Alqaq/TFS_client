function onSay(player, words, param)
	if player:getExhaustion(1000) <= 0 then
		player:setExhaustion(1000, 2)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Player commands:" .. "\n"
			.. "!buyhouse" .. "\n"
			.. "!leavehouse" .. "\n"
			.. "!serverinfo" .. "\n"
			.. "!online" .. "\n"
			.. "!deathlist" .. "\n"
			.. "!kills" .. "\n"
			.. "!changesex" .. "\n"
			.. "!uptime" .. "\n"
			.. "!shop" .. "\n"
			.. "!autoloot" .. "\n"
			.. "!attack" .. "\n"
			.. "!exp" .. "\n"
			.. "!mana" .. "\n"
			.. "!rank" .. "\n"
			.. "!bless" .. "\n"
			.. "!spells" .. "\n"
			)
		return false
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You\'re exhausted for: '..player:getExhaustion(1000)..' seconds.')
	end
end
			--.. "!buypremium" .. "\n"
			--.. "!cast on" .. "\n"
			--.. "!cast off" .. "\n"
			--.. "!saveme" .. "\n"