local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local items = {
                [1] = {name = "Pair of Soft Boots", id = 2640, price = 35},
                [2] = {name = "Royal Scale Robe", id = 12643, price = 35},
                [3] = {name = "Frozen Starlight", id = 2361, price = 5},
                [4] = {name = "Magic Plate Armor", id = 2472, price = 20},
                [5] = {name = "Sneaky Stabber of Eliteness", id = 10511, price = 20},
                [6] = {name = "Squeezing Gear of GirlPower", id = 10513, price = 20},
                [7] = {name = "Whacking Driller of Fate", id = 10515, price = 20},
                [8] = {name = "Fabled Backpack", id = 9774, price = 25},
                --[9] = {name = "Pair of Boots of Salvation", id = 2358, price = 150},
                [9] = {name = "Spellbook of Ancient Arcana", id = 16112, price = 30},
                [10] = {name = "Pair of Boots of Haste", id = 2195, price = 10},
                [11] = {name = "Ornamented Brooch", id = 12424, price = 10}
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
    if msgcontains(msg, 'buy') or msgcontains(msg, 'trade') then
        player:registerEvent("valorShop")
     
        local title = "VIP Store"
        local message = "Welcome to the VIP Store!\nSelect an item to trade for VIP Tokens. You can obtain VIP Tokens by trading your rare items, or you can purchase them online."
     
        local window = ModalWindow(1003, title, message)
        if player:getItemCount(2157) > 0 then
            window:addButton(100, "Purchase")
            window:setDefaultEnterButton(101)
        else
            window:setDefaultEnterButton(101)
        end
        window:addButton(101, "Cancel")
        window:setDefaultEscapeButton(101)
       
        for i = 1, #items do
            window:addChoice(i, "" ..items[i].name.. ": " .. items[i].price.. " VIP Tokens, " ..getItemWeight(items[i].id).. " oz")
		end

		
        window:sendToPlayer(player)
		return true
    elseif msgcontains(msg, 'vip') or msgcontains(msg, 'token') or msgcontains(msg, 'vip token') then
        npcHandler:say("VIP Tokens are a special currency of Daritica. You may use them to purchase items and other benefits from me such as {experience} boosts. You may also use VIP Tokens to hunt in the VIP hunting rooms on {Hunter Island}. ",cid)
	elseif msgcontains(msg, 'hunter') or msgcontains(msg, 'island') or msgcontains(msg, 'hunter island') then
        npcHandler:say("Hunter Island is a special island created for your convenience. You may access the island by speaking to a Captain aboard one of the local boats or via the portals in Knightwatch Tower.",cid)
	elseif msgcontains(msg, 'exp') or msgcontains(msg, 'experience') then     -- Add Experience
        npcHandler:say("In exchange for 10 VIP Tokens I will grant you 1,000,000 experience points. Would you like to continue?",cid)
        talkState[cid] = 1
    
    elseif msgcontains(msg, 'yes') or msgcontains(msg, 'y') and talkState[cid] == 1 then
		if player:getItemCount(2157) >= 10 then
			player:removeItem(2157, 10)
			player:addExperience(1000000)
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
