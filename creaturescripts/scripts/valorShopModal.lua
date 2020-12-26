local items = {
                [1] = {name = "Pair of Soft Boots", id = 2640, price = 10},
                [2] = {name = "Royal Scale Robe", id = 12643, price = 10},
                [3] = {name = "Frozen Starlight", id = 2361, price = 2},
                [4] = {name = "Magic Plate Armor", id = 2472, price = 10},
                [5] = {name = "Sneaky Stabber of Eliteness", id = 10511, price = 10},
                [6] = {name = "Squeezing Gear of GirlPower", id = 10513, price = 10},
                [7] = {name = "Whacking Driller of Fate", id = 10515, price = 10},
                [8] = {name = "Fabled Backpack", id = 9774, price = 10},
                --[9] = {name = "Pair of Boots of Salvation", id = 2358, price = 150},
                [9] = {name = "Spellbook of Ancient Arcana", id = 16112, price = 15},
                [10] = {name = "Pair of Boots of Haste", id = 2195, price = 5},
                [11] = {name = "Ornamented Brooch", id = 12424, price = 5}
}

function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("valorShop")
 
    if modalWindowId == 1003 then
		if buttonId ~= 100 then 
			--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must click the 'Purchase' button to complete your transaction!")
			return false
		end
		if buttonId == 100 then
			if player:getItemCount(2157) < items[choiceId].price then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough VIP Tokens!")
				return true
			end
            player:removeItem(2157, items[choiceId].price)
            player:addItem(items[choiceId].id, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a "..items[choiceId].name..".")
			return true
        end
    end
end