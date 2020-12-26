-- local keywordHandler = KeywordHandler:new()
-- local npcHandler = NpcHandler:new(keywordHandler)
-- NpcSystem.parseParameters(npcHandler)

-- function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
-- function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
-- function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
-- function onThink()				npcHandler:onThink()					end

-- npcHandler:addModule(FocusModule:new())

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local vocation = {}
local town = {}
local destination = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

--Equipment Upon Arrival to Mainland
local config = {
		[1] = {
				--equipment spellbook, wand of vortex, spirit cloak, plate legs, soldier helmet, scarf, leather boots
				items = {{2175, 1}, {2190, 1}, {8870, 1}, {2647, 1}, {2481, 1}, {2661, 1}, {2643, 1}},
				--container rope, shovel, 5 mana potion, 5 health potions, 1 crystal coin, 10 orichalcum pearls
				container = {{2120, 1}, {2554, 1}, {7620, 5}, {7618, 5}, {2160, 1}, {5022, 10}, {2789,100}}
		},
		[2] = {
				--equipment spellbook, snakebite rod, spirit cloak, plate legs, soldier helmet, scarf, leather boots
				items = {{2175, 1}, {2182, 1}, {8870, 1}, {2647, 1}, {2481, 1}, {2661, 1}, {2643, 1}},
				--container rope, shovel, 5 mana potion, 5 health potion, 1 crystal coin, 10 orichalcum pearls
				container = {{2120, 1}, {2554, 1}, {7620, 5}, {7618, 5}, {2160, 1}, {5022, 10}, {2789,100}}
		},
		[3] = {
				--equipment dwarven shield, 1 spear, scale armor, plate legs, soldier helmet, scarf, leather boots
				items = {{2525, 1}, {2389, 1}, {2483, 1}, {2647, 1}, {2481, 1}, {2661, 1}, {2643, 1}},
				--container rope, shovel, 5 mana potion, 5 health potion, 1 crystal coin, 10 orichalcum pearls, bow, 50 arrow
				container = {{2120, 1}, {2554, 1}, {7620, 5}, {7618, 5}, {2160, 1}, {5022, 10}, {2456, 1}, {2544, 50}, {2789,100}}
		},
		[4] = {
				--equipment dwarven shield, jagged sword, scale armor, plate legs, soldier helmet, scarf, leather boots
				items = {{2525, 1}, {8602, 1}, {2483, 1}, {2647, 1}, {2481, 1}, {2661, 1}, {2643, 1}},
				--container rope, shovel, 5 mana potion, 5 health potion, 1 crystal coin, 10 orichalcum pearls
				container = {{2120, 1}, {2554, 1}, {7620, 5}, {7618, 5} ,{2160, 1}, {5022, 10}, {2789,100}}--{8601, 1}, {2439, 1}, steel axe, daramian mace, 
		}
	}
--End--

local function greetCallback(cid)
	local player = Player(cid)
	local level = player:getLevel()
	if level < 8 then
		npcHandler:say("CHILD! COME BACK WHEN YOU HAVE GROWN UP!", cid)
		return false
	elseif level > 9 then
		npcHandler:say(player:getName() .. ", I CAN'T LET YOU LEAVE - YOU ARE TOO STRONG ALREADY! YOU CAN ONLY LEAVE WITH LEVEL 9 OR LOWER.", cid)
		return false
	elseif player:getVocation():getId() > 0 then
		npcHandler:say("YOU ALREADY HAVE A VOCATION!", cid)
		return false
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "yes") and npcHandler.topic[cid] == 0 then
		------------------------------------
		---------EDIT CITIES HERE-----------
		------------------------------------
		npcHandler:say("IN WHICH TOWN DO YOU WANT TO LIVE: {EDRON}, {YALAHAR}, {SVARGROND}, {FARMINE}, {ROSHAMUUL}, {LIBERTY BAY}, {PORT HOPE}, {ANKRAHMUN}, {DARASHIA}, {RATHLETON}?", cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		------------------------------------
		------------BEGIN CITIES------------
		------------------------------------
		if msgcontains(msg, "edron") then
			town[cid] = 2
			destination[cid] = Position(33217, 31814, 8) -- Edit This
			npcHandler:say("IN EDRON! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "yalahar") then
			town[cid] = 2
			destination[cid] = Position(32787, 31276, 7) -- Edit This
			npcHandler:say("IN YALAHAR! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "svargrond") then
			town[cid] = 2
			destination[cid] = Position(32212, 31132, 7) -- Edit This
			npcHandler:say("IN SVARGROND! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "farmine") then
			town[cid] = 2
			destination[cid] = Position(33023, 31525, 11) -- Edit This
			npcHandler:say("IN FARMINE! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "roshamuul") then
			town[cid] = 2
			destination[cid] = Position(33513, 32363, 6) -- Edit This
			npcHandler:say("IN ROSHAMUUL! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "liberty bay") then
			town[cid] = 2
			destination[cid] = Position(32317, 32826, 7) -- Edit This
			npcHandler:say("IN LIBERTY BAY! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "port hope") then
			town[cid] = 2
			destination[cid] = Position(32594, 32745, 7) -- Edit This
			npcHandler:say("IN PORT HOPE! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "ankrahmun") then
			town[cid] = 2
			destination[cid] = Position(33194, 32853, 8) -- Edit This
			npcHandler:say("IN ANKRAHMUN! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "darashia") then
			town[cid] = 2
			destination[cid] = Position(33213, 32454, 1) -- Edit This
			npcHandler:say("IN DARASHIA! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "rathleton") then
			town[cid] = 2
			destination[cid] = Position(33594, 31899, 6) -- Edit This
			npcHandler:say("IN RATHLETON! AND WHAT PROFESSION HAVE YOU CHOSEN: {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2

			------------------------------------
			-----------END CITIES---------------
			------------------------------------
		else
			------------------------------------
			---------EDIT CITIES HERE-----------
			------------------------------------
			npcHandler:say("IN WHICH TOWN DO YOU WANT TO LIVE: {EDRON}, {YALAHAR}, {SVARGROND}, {FARMINE}, {ROSHAMUUL}, {LIBERTY BAY}, {PORT HOPE}, {ANKRAHMUN}, {DARASHIA}, {RATHLETON}?", cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, "sorcerer") then
			npcHandler:say("A SORCERER! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 1
		elseif msgcontains(msg, "druid") then
			npcHandler:say("A DRUID! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 2
		elseif msgcontains(msg, "paladin") then
			npcHandler:say("A PALADIN! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 3
		elseif msgcontains(msg, "knight") then
			npcHandler:say("A KNIGHT! ARE YOU SURE? THIS DECISION IS IRREVERSIBLE!", cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = 4
		else
			npcHandler:say("{KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			local player = Player(cid)
			npcHandler:say("SO BE IT!", cid)
			player:setVocation(Vocation(vocation[cid]))
			player:setTown(Town(town[cid]))
			local destination = destination[cid]
			npcHandler:releaseFocus(cid)
			player:teleportTo(destination)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			
			--------------------------------------
			--Equipment Upon Arrival to Mainland--
			--------------------------------------
			
		local firstItems = {2480, 2464, 2468, 2643, 2530, 2383}--,1988
		local player = Player(cid)
		
			for i = 1, #firstItems do
				player:removeItem(firstItems[i], 1)
			end
			
		local player = Player(cid)
		local targetVocation = config[player:getVocation():getId()]
			
			if not targetVocation then
			return true
			end
			
			for i = 1, #targetVocation.items do
				player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
			end
			
			local backpack = player:addItem(1988)
			
			if not backpack then
			return true
			end
			
			for i = 1, #targetVocation.container do
				backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
			end
			
			--------------------------------------
			----------End Custom Section----------
			--------------------------------------
			
		else
			npcHandler:say("THEN WHAT? {KNIGHT}, {PALADIN}, {SORCERER}, OR {DRUID}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

local function onAddFocus(cid)
	town[cid] = 0
	vocation[cid] = 0
	destination[cid] = 0
end

local function onReleaseFocus(cid)
	town[cid] = nil
	vocation[cid] = nil
	destination[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

