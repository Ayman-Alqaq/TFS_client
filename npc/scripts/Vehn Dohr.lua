	local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

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
                [11] = {name = "Pair of Boots of Haste", id = 2195, price = 1},
                [12] = {name = "Ornamented Brooch", id = 12424, price = 1}
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
    if msgcontains(msg, 'sell') or msgcontains(msg, 'trade') then
        player:registerEvent("valorSale")
		
        local title = "VIP Store"
        local message = "Welcome to the VIP Store!\nSelect an item to sell for VIP Tokens. If you need more VIP Tokens, purchase them online from the webstore."
     
        local window = ModalWindow(1003, title, message)
            window:addButton(100, "Sell")
			window:addButton(101, "Cancel")
       
        for i = 1, #sales do
            window:addChoice(i, "" ..sales[i].name.. ": " .. sales[i].price.. " VIP Tokens, " ..getItemWeight(sales[i].id).. " oz")
        end

		
        window:sendToPlayer(player)
		return true
    elseif msgcontains(msg, 'vip') or msgcontains(msg, 'token') or msgcontains(msg, 'vip token') then
        npcHandler:say("VIP Tokens are a special currency of Daritica. You may use them to purchase items and other benefits from me such as {experience} boosts. You may also use VIP Tokens to hunt in the VIP hunting rooms on {Hunter Island}. ",cid)
	elseif msgcontains(msg, 'hunter') or msgcontains(msg, 'island') or msgcontains(msg, 'hunter island') then
        npcHandler:say("Hunter Island is a special island created for your convenience. You may access the island by speaking to a Captain aboard one of the local boats or via the portals in Knightwatch Tower.",cid)
	elseif msgcontains(msg, 'exp') or msgcontains(msg, 'experience') then     -- Add Experience
        npcHandler:say("In exchange for 5 VIP Tokens I will grant you 100,000 experience points. Would you like to continue?",cid)
        talkState[cid] = 1
    
    elseif msgcontains(msg, 'yes') or msgcontains(msg, 'y') and talkState[cid] == 1 then
		if player:getItemCount(2157) > 5 then
			player:removeItem(2157, 5)
			player:addExperience(100000)
			npcHandler:say("Here you are.",cid)
		else
			npcHandler:say("You do not have enough VIP Tokens.",cid)
		end
        local voc = player:getVocation()
        if player:getStorageValue(STORAGEVALUE_PROMOTION) ~= 1 then     -- Add Promotion
            player:setVocation(voc:getPromotion())
            player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
            npcHandler:say("You have received a promotion.",cid)
        end
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())