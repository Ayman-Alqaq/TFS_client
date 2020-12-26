local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Mission (Tibia Tales: Rest In Hallowed Ground)
local startMissionKeyword = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = 'Well, I would do it myself but I can\'t leave town for a longer time. Would you be so kind to bring me a vial of holy water from the White Raven Monastery?'}, function(player) return player:getStorageValue(Storage.TibiaTales.RestInHallowedGround.Questline) == -1 end)
	startMissionKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'I thank you a lot in advance. The power of the holy water from the White Raven Monastery is legendary. For my task it is indispensable. We talk about that when you get back.', reset = true}, nil, function(player) player:setStorageValue(Storage.TibiaTales.RestInHallowedGround.Questline, 1) end)
	startMissionKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s your decision. I will ask the next believing mind that visits the temple of Banor\'s blood.', reset = true})

local function addMissionKeyword(text, value, newValue, addItem)
	keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = text},
		function(player) return player:getStorageValue(Storage.TibiaTales.RestInHallowedGround.Questline) == value end,
		function(player)
			if newValue then
				player:setStorageValue(Storage.TibiaTales.RestInHallowedGround.Questline, newValue)
			end

			if addItem then
				player:addItem(7498, 1)
			end
		end
	)
end

addMissionKeyword('First of all, you have to find a way to enter the Isle of the Kings and get some holy water from the White Raven Monastery.', 1)
addMissionKeyword('Have you heard about the unholy graveyard north of Edron? Go there and spill some holy water on every grave. Once you are done, come back to me.', 2, 3)
addMissionKeyword('I feel that the spirits have not come to a rest yet. There must still be some graves left to sanctify.', 3)
addMissionKeyword('I appreciate your help. May Banor be always on your side. Here, your reward is this package which contains five mana and five health potions.', 4, 5, true)

keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = 'Your mission here on Tibia is to be polite and friendly. The gods will reward you, I promise!'})

local blessKeyword = keywordHandler:addKeyword({'twist of fate'}, StdModule.say, {npcHandler = npcHandler,
	text = {
		'Use the !bless talkaction to receive the twist of fate blessing, as well as all of the other blessings.'
		--'This is a special blessing I can bestow upon you once you have obtained at least one of the other blessings and which functions a bit differently. ...',
		--'It only works when you\'re killed by other adventurers, which means that at least half of the damage leading to your death was caused by others, not by monsters or the environment. ...',
		--'The {twist of fate} will not reduce the death penalty like the other blessings, but instead prevent you from losing your other blessings as well as the amulet of loss, should you wear one. It costs the same as the other blessings. ...',
		--'Would you like to receive that protection for a sacrifice of |PVPBLESSCOST| gold, child?'
	}})
	--blessKeyword:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, text = 'So receive the protection of the twist of fate, pilgrim.', cost = '|PVPBLESSCOST|', bless = 6})
	--blessKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'Fine. You are free to decline my offer.', reset = true})

-- Adventurer Stone
keywordHandler:addKeyword({'adventurer stone'}, StdModule.say, {npcHandler = npcHandler, text = 'Keep your adventurer\'s stone well.'}, function(player) return player:getItemById(18559, true) end)

local stoneKeyword = keywordHandler:addKeyword({'adventurer stone'}, StdModule.say, {npcHandler = npcHandler, text = 'Ah, you want to replace your adventurer\'s stone for free?'}, function(player) return player:getStorageValue(Storage.AdventurersGuild.FreeStone.Amanda) ~= 1 end)
	stoneKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Here you are. Take care.', reset = true}, nil, function(player) player:addItem(18559, 1) player:setStorageValue(Storage.AdventurersGuild.FreeStone.Amanda, 1) end)

local stoneKeyword = keywordHandler:addKeyword({'adventurer stone'}, StdModule.say, {npcHandler = npcHandler, text = 'Ah, you want to replace your adventurer\'s stone for 30 gold?'})
	stoneKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Here you are. Take care.', reset = true},
		function(player) return player:getMoney() >= 30 end,
		function(player) player:removeMoney(30) player:addItem(18559, 1) end
	)
	stoneKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'Sorry, you don\'t have enough money.', reset = true})
	stoneKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'No problem.', reset = true})

-- Wooden Stake
keywordHandler:addKeyword({'stake'}, StdModule.say, {npcHandler = npcHandler, text = 'I think you have forgotten to bring your stake, my child.'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 6 and player:getItemCount(5941) == 0 end)

local stakeKeyword = keywordHandler:addKeyword({'stake'}, StdModule.say, {npcHandler = npcHandler, text = 'Yes, I was informed what to do. Are you prepared to receive my line of the prayer?'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 6 end)
	stakeKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'So receive my prayer: \'Wicked curses shall be broken\'. Now, bring your stake to Kasmir in Darashia for the next line of the prayer. I will inform him what to do.', reset = true}, nil,
		function(player) player:setStorageValue(Storage.FriendsandTraders.TheBlessedStake, 7) player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE) end
	)
	stakeKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'I\'ll wait for you.', reset = true})

keywordHandler:addKeyword({'stake'}, StdModule.say, {npcHandler = npcHandler, text = 'You should visit Kasmir in Darashia now, my child.'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 7 end)
keywordHandler:addKeyword({'stake'}, StdModule.say, {npcHandler = npcHandler, text = 'You already received my line of the prayer.'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) > 7 end)
keywordHandler:addKeyword({'stake'}, StdModule.say, {npcHandler = npcHandler, text = 'A blessed stake? That\'s a strange request. Maybe Quentin knows more, he is one of the oldest monks after all.'})

-- Healing
local function addHealKeyword(text, condition, effect)
	keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = text},
		function(player) return player:getCondition(condition) ~= nil end,
		function(player)
			player:removeCondition(condition)
			player:getPosition():sendMagicEffect(effect)
		end
	)
end

addHealKeyword('You are burning. Let me quench those flames.', CONDITION_FIRE, CONST_ME_MAGIC_GREEN)
addHealKeyword('You are poisoned. Let me soothe your pain.', CONDITION_POISON, CONST_ME_MAGIC_RED)
addHealKeyword('You are electrified, my child. Let me help you to stop trembling.', CONDITION_ENERGY, CONST_ME_MAGIC_GREEN)

keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = 'You are hurt, my child. I will heal your wounds.'},
	function(player) return player:getHealth() < 40 end,
	function(player)
		local health = player:getHealth()
		if health < 40 then player:addHealth(40 - health) end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
)
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = 'You aren\'t looking that bad. Sorry, I can\'t help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes or get the protection of the {twist of fate} here.'})

-- Basic
keywordHandler:addKeyword({'pilgrimage'}, StdModule.say, {npcHandler = npcHandler, text = 'Whenever you receive a lethal wound, your vital force is damaged and there is a chance that you lose some of your equipment. With every single of the five {blessings} you have, this damage and chance of loss will be reduced.'})
keywordHandler:addKeyword({'blessings'}, StdModule.say, {npcHandler = npcHandler, text = 'There are five blessings available in five sacred places: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}. Additionally, you can receive the {twist of fate} here.'})
keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, text = 'I see you received the spiritual shielding in the whiteflower temple south of Thais.'}, function(player) return player:hasBlessing(1) end)
keywordHandler:addAliasKeyword({'shield'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, text = 'I can sense that the druids north of Carlin have provided you with the Embrace of Tibia.'}, function(player) return player:hasBlessing(2) end)
keywordHandler:addKeyword({'suns'}, StdModule.say, {npcHandler = npcHandler, text = 'I can see you received the blessing of the two suns in the suntower near Ab\'Dendriel.'}, function(player) return player:hasBlessing(3) end)
keywordHandler:addAliasKeyword({'fire'})
keywordHandler:addKeyword({'phoenix'}, StdModule.say, {npcHandler = npcHandler, text = 'I can sense that the spark of the phoenix already was given to you by the dwarven priests of earth and fire in Kazordoon.'}, function(player) return player:hasBlessing(4) end)
keywordHandler:addAliasKeyword({'spark'})
keywordHandler:addKeyword({'solitude'}, StdModule.say, {npcHandler = npcHandler, text = 'I can sense you already talked to the hermit Eremo on the isle of Cormaya and received this blessing.'}, function(player) return player:hasBlessing(5) end)
keywordHandler:addAliasKeyword({'wisdom'})
keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, text = 'You can ask for the blessing of spiritual shielding in the whiteflower temple south of Thais.'})
keywordHandler:addAliasKeyword({'shield'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, text = 'The druids north of Carlin will provide you with the embrace of Tibia.'})
keywordHandler:addKeyword({'suns'}, StdModule.say, {npcHandler = npcHandler, text = 'You can ask for the blessing of the two suns in the suntower near Ab\'Dendriel.'})
keywordHandler:addAliasKeyword({'fire'})
keywordHandler:addKeyword({'phoenix'}, StdModule.say, {npcHandler = npcHandler, text = 'The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.'})
keywordHandler:addAliasKeyword({'spark'})
keywordHandler:addKeyword({'solitude'}, StdModule.say, {npcHandler = npcHandler, text = 'Talk to the hermit Eremo on the isle of Cormaya about this blessing.'})
keywordHandler:addAliasKeyword({'wisdom'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, young |PLAYERNAME|! If you are heavily wounded or poisoned, I can {heal} you for free.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Remember: If you are heavily wounded or poisoned, I can heal you for free.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May the gods bless you, |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())
