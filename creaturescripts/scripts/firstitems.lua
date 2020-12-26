local firstItems = {2480, 2468, 2643, 2530}--2464, 2383

function onLogin(player)
	if player:getLastLoginSaved() == 0 then
		for i = 1, #firstItems do
			player:addItem(firstItems[i], 1)
		end
		player:addItem(1988, 1)
		player:addItem(2674, 1)
		--player:addItem(2120, 1)
		--player:addItem(2554, 1)
	end
	return true
end