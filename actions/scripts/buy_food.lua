local potions = {
-- Config
titleMsg = " ",
mainMsg = " ",
moneyMsg = "You do not have enough money!", -- This is the message the player will recieve when he does not have enough money.
capacityMsg = "You do not have enough capacity", -- This is the message the player will recieve when he does not have enough capactiy.
buyMsg = "You have bought ", -- This is the message the player will recieve when he succesfully buys.
-- End Config

-- Change prices in this table here price10 = price for 10 potions etc.
[1] = {potion = "Brown Mushroom", itemID = 2789, price10 = 100, price50 = 500, price100 = 1000},
[2] = {potion = "Dragon Ham", itemID = 2672, price10 = 200, price50 = 1000, price100 = 2000},
[3] = {potion = "Fish", itemID = 2667, price10 = 50, price50 = 250, price100 = 500},
[4] = {potion = "Meat", itemID = 2666, price10 = 50, price50 = 250, price100 = 500},
[5] = {potion = "Ham", itemID = 2671, price10 = 80, price50 = 400, price100 = 800},
[6] = {potion = "Mana Potion", itemID = 7620, price10 = 500, price50 = 2500, price100 = 5000},
[7] = {potion = "Strong Mana Potion", itemID = 7589, price10 = 800, price50 = 4000, price100 = 8000},
[8] = {potion = "Great Mana Potion", itemID = 7590, price10 = 1200, price50 = 6000, price100 = 12000},
[9] = {potion = "Ultimate Mana Potion", itemID = 26029, price10 = 5000, price50 = 25000, price100 = 50000},
[10] = {potion = "Small Mana Rune", itemID = 2275, price10 = 5000, price50 = 25000, price100 = 50000},
[11] = {potion = "Mana Rune", itemID = 2270, price10 = 7500, price50 = 37500, price100 = 75000},
[12] = {potion = "Mana Restoration Rune", itemID = 2269, price10 = 2500, price50 = 12500, price100 = 25000},
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	player:sendShopWindow(potions)
	return true
end