local sales = {
                [1] = {name = "Pair of Soft Boots", id = 6132, price = 5},
                [2] = {name = "Royal Scale Robe", id = 12643, price = 5},
                [3] = {name = "Frozen Starlight", id = 2361, price = 1},
                [4] = {name = "Magic Plate Armor", id = 2472, price = 4},
                [5] = {name = "Sneaky Stabber of Eliteness", id = 10511, price = 5},
                [6] = {name = "Squeezing Gear of GirlPower", id = 10513, price = 5},
                [7] = {name = "Whacking Driller of Fate", id = 10515, price = 5},
                [8] = {name = "Fabled Backpack", id = 9774, price = 5},
                [9] = {name = "Pair of Boots of Salvation", id = 2358, price = 10},
                [10] = {name = "Spellbook of Ancient Arcana", id = 16112, price = 7},
                [11] = {name = "Pair of Boots of Haste", id = 2195, price = 2},
                [12] = {name = "Ornamented Brooch", id = 12424, price = 2}
}

function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("valorSale")
 
    if modalWindowId == 1003 then
		if buttonId ~= 100 then 
			return false
		end
			if not player:removeItem(sales[choiceId].id, 1) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have a "..sales[choiceId].name..".")
			return false
			else
            player:addItem(2157, sales[choiceId].price)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have sold a "..sales[choiceId].name.." for "..sales[choiceId].price.." VIP Tokens.")
			return true
			end
    end
end