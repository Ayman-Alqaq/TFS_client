local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

-- Travel
local function addTravelKeyword(keyword, cost, destination)
local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination})
travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('thais', 170, Position(32310, 32210, 6))
addTravelKeyword('venore', 150, Position(32955, 32025, 6))
addTravelKeyword('kazordoon', 130, Position(32569, 31957, 15))
addTravelKeyword('carlin', 130, Position(32387, 31820, 6))
addTravelKeyword('ab\'dendriel', 90, Position(32734, 31668, 6))
addTravelKeyword('liberty bay', 180, Position(32285, 32892, 6))
addTravelKeyword('port hope', 160, Position(32527, 32784, 6))
addTravelKeyword('ankrahmun', 150, Position(33092, 32883, 6))
addTravelKeyword('darashia', 110, Position(33289, 32481, 6))
addTravelKeyword('edron', 40, Position(33173, 31764, 6))
addTravelKeyword('svargrond', 150, Position(32341, 31108, 6))
addTravelKeyword('yalahar', 185, Position(32816, 31272, 6))
addTravelKeyword('farmine', 150, Position(33024, 31151, 10))
addTravelKeyword('gray beach', 250, Position(33196, 31984, 7))
addTravelKeyword('roshamuul', 250, Position(33495, 32569, 7))
addTravelKeyword('rathleton', 250, Position(33645, 31988, 6))
addTravelKeyword('trainer', 180, Position(21155, 16535, 7))
addTravelKeyword('rookgaard ruins', 200, Position(31972, 32278, 6))
addTravelKeyword('island of destruction', 200, Position(32098, 31969, 6))
addTravelKeyword('damshire', 240, Position(32912, 33064, 6))
addTravelKeyword('adriatica', 130, Position(32632, 33350, 5))
addTravelKeyword('ice bridge', 180, Position(32553, 32281, 5))

-- Basic
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Thais}, {Carlin}, {Ab\'Dendriel}, {Port Hope}, {Edron}, {Darashia}, {Liberty Bay}, {Svargrond}, {Yalahar}, {Gray Beach}, {Trainer}, {Venore}, {Kazordoon}, {Farmine}, {Roshamuul}, {Rathleton}, {Rookgaard Ruins}, {Island of Destruction}, or {Ankrahmun}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Thais}, {Carlin}, {Ab\'Dendriel}, {Port Hope}, {Edron}, {Darashia}, {Liberty Bay}, {Svargrond}, {Yalahar}, {Gray Beach}, {Trainer}, {Venore}, {Kazordoon}, {Farmine}, {Roshamuul}, {Rathleton}, {Rookgaard Ruins}, {Island of Destruction}, or {Ankrahmun}?'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship, and master of the seas!'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this ship, and master of the seas!'})
keywordHandler:addKeyword({'tibianic'}, StdModule.say, {npcHandler = npcHandler, text = 'This is the Tibianic. Where do you want to go?'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Captain Tibianus!'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome aboard the Tibianic, |PLAYERNAME|. Where shall I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell! I hope you enjoyed the luxury of the Tibianic. Come back soon!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())