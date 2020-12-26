--  1. FRUITS
TEMP, FRUITS = {
['APPLE'] = 2674,  ['BANANA'] = 2676,  ['BERRY'] = 2680, ['CHERRY'] = 2679,  ['LEMON'] = 8841,  ['MANGO'] = 5097, ['MELON'] = 2682,  ['ORANGE'] = 2675,  ['PUMPKIN'] = 2683
}, {}
 
for name, id in pairs(TEMP) do
 _G[name] = id
 table.insert(FRUITS, id)
end
 
--  2. CONFIGURATION
SETUP = {
 --MONEY = 1000, --REQUIRED MONEY(gp) TO PLAY SLOT MACHINE
 TIME = 200, --MILLISECONDS TO SWITCH FRUITS
 LIMIT = 20, --COUNTER TO STOP CHANGING FRUIT IF PLAYER DOESN'T (decreases each SETUP.TIME)
 LEVER = {1945, 1946},
WIN={

--THREE OF A KIND
	[{PUMPKIN,PUMPKIN,PUMPKIN}]={2157,30},
	[{BERRY,BERRY,BERRY}]={2157,30},
	[{LEMON,LEMON,LEMON}]={2157,25},
	[{CHERRY,CHERRY,CHERRY}]={2157,20},
	[{MANGO,MANGO,MANGO}]={2157,20},
	[{ORANGE,ORANGE,ORANGE}]={2157,20},
	[{APPLE,APPLE,APPLE}]={2157,20},
	[{MELON,MELON,MELON}]={2157,15},
	[{BANANA,BANANA,BANANA}]={2157,10},
	
--SMOOTHIE
	[{BERRY,BERRY,BANANA}]={2157,4},
	[{BERRY,BANANA,BERRY}]={2157,4},
	[{BANANA,BERRY,BERRY}]={2157,4},
	[{BANANA,BERRY,BANANA}]={2157,4},
	[{BERRY,BANANA,BANANA}]={2157,4},
	[{BANANA,BANANA,BERRY}]={2157,4},  
	
	[{APPLE,APPLE,MANGO}]={2157,4},
	[{APPLE,MANGO,APPLE}]={2157,4},
	[{MANGO,APPLE,APPLE}]={2157,4},
	[{MANGO,APPLE,MANGO}]={2157,4},
	[{APPLE,MANGO,MANGO}]={2157,4},
	[{MANGO,MANGO,APPLE}]={2157,4},
	
	[{APPLE,APPLE,BANANA}]={2157,4},
	[{APPLE,BANANA,APPLE}]={2157,4},
	[{BANANA,APPLE,APPLE}]={2157,4},
	[{BANANA,APPLE,BANANA}]={2157,4},
	[{APPLE,BANANA,BANANA}]={2157,4},
	[{BANANA,BANANA,APPLE}]={2157,4},
	
--SPECIAL COMBOS	
	[{APPLE,CHERRY,PUMPKIN}]={2157,3},
	[{PUMPKIN,APPLE,CHERRY}]={2157,3},
	[{CHERRY,PUMPKIN,APPLE}]={2157,3},
	
	[{CHERRY,PUMPKIN,CHERRY}]={2157,3},
	[{CHERRY,CHERRY,PUMPKIN}]={2157,3},
	[{PUMPKIN,CHERRY,CHERRY}]={2157,3},
	
	[{LEMON,MELON,LEMON}]={2157,3},
	[{LEMON,LEMON,MELON}]={2157,3},
	[{MELON,LEMON,LEMON}]={2157,3},
	
--TWO OF A KIND
	--PUMPKIN ANY PUMPKIN
		[{PUMPKIN,PUMPKIN,APPLE}]={2157,2},
	[{PUMPKIN,APPLE,PUMPKIN}]={2157,2},
	[{APPLE,PUMPKIN,PUMPKIN}]={2157,2},
	[{APPLE,APPLE,PUMPKIN}]={2157,2},
	[{APPLE,PUMPKIN,APPLE}]={2157,2},
	[{PUMPKIN,APPLE,APPLE}]={2157,2},
		[{PUMPKIN,PUMPKIN,BANANA}]={2157,2},
	[{PUMPKIN,BANANA,PUMPKIN}]={2157,2},
	[{BANANA,PUMPKIN,PUMPKIN}]={2157,2},
	[{BANANA,BANANA,PUMPKIN}]={2157,2},
	[{BANANA,PUMPKIN,BANANA}]={2157,2},
	[{PUMPKIN,BANANA,BANANA}]={2157,2},
		[{PUMPKIN,PUMPKIN,BERRY}]={2157,2},
	[{PUMPKIN,BERRY,PUMPKIN}]={2157,2},
	[{BERRY,PUMPKIN,PUMPKIN}]={2157,2},
	[{BERRY,BERRY,PUMPKIN}]={2157,2},
	[{BERRY,PUMPKIN,BERRY}]={2157,2},
	[{PUMPKIN,BERRY,BERRY}]={2157,2},
		[{PUMPKIN,PUMPKIN,CHERRY}]={2157,2},
	[{PUMPKIN,CHERRY,PUMPKIN}]={2157,2},
	[{CHERRY,PUMPKIN,PUMPKIN}]={2157,2},
	[{CHERRY,CHERRY,PUMPKIN}]={2157,2},
	[{CHERRY,PUMPKIN,CHERRY}]={2157,2},
	[{PUMPKIN,CHERRY,CHERRY}]={2157,2},
		[{PUMPKIN,PUMPKIN,LEMON}]={2157,2},
	[{PUMPKIN,LEMON,PUMPKIN}]={2157,2},
	[{LEMON,PUMPKIN,PUMPKIN}]={2157,2},
	[{LEMON,LEMON,PUMPKIN}]={2157,2},
	[{LEMON,PUMPKIN,LEMON}]={2157,2},
	[{PUMPKIN,LEMON,LEMON}]={2157,2},
		[{PUMPKIN,PUMPKIN,MANGO}]={2157,2},
	[{PUMPKIN,MANGO,PUMPKIN}]={2157,2},
	[{MANGO,PUMPKIN,PUMPKIN}]={2157,2},
	[{MANGO,MANGO,PUMPKIN}]={2157,2},
	[{MANGO,PUMPKIN,MANGO}]={2157,2},
	[{PUMPKIN,MANGO,MANGO}]={2157,2},
		[{PUMPKIN,PUMPKIN,ORANGE}]={2157,2},
	[{PUMPKIN,ORANGE,PUMPKIN}]={2157,2},
	[{ORANGE,PUMPKIN,PUMPKIN}]={2157,2},
	[{ORANGE,ORANGE,PUMPKIN}]={2157,2},
	[{ORANGE,PUMPKIN,ORANGE}]={2157,2},
	[{PUMPKIN,ORANGE,ORANGE}]={2157,2},
	
	--CHERRY ANY CHERRY
		[{CHERRY,CHERRY,APPLE}]={2157,2},
	[{CHERRY,APPLE,CHERRY}]={2157,2},
	[{APPLE,CHERRY,CHERRY}]={2157,2},
	[{APPLE,APPLE,CHERRY}]={2157,2},
	[{APPLE,CHERRY,APPLE}]={2157,2},
	[{CHERRY,APPLE,APPLE}]={2157,2},
		[{CHERRY,CHERRY,BANANA}]={2157,2},
	[{CHERRY,BANANA,CHERRY}]={2157,2},
	[{BANANA,CHERRY,CHERRY}]={2157,2},
	[{BANANA,BANANA,CHERRY}]={2157,2},
	[{BANANA,CHERRY,BANANA}]={2157,2},
	[{CHERRY,BANANA,BANANA}]={2157,2},
		[{CHERRY,CHERRY,BERRY}]={2157,2},
	[{CHERRY,BERRY,CHERRY}]={2157,2},
	[{BERRY,CHERRY,CHERRY}]={2157,2},
	[{BERRY,BERRY,CHERRY}]={2157,2},
	[{BERRY,CHERRY,BERRY}]={2157,2},
	[{CHERRY,BERRY,BERRY}]={2157,2},
		[{CHERRY,CHERRY,LEMON}]={2157,2},
	[{CHERRY,LEMON,CHERRY}]={2157,2},
	[{LEMON,CHERRY,CHERRY}]={2157,2},
	[{LEMON,LEMON,CHERRY}]={2157,2},
	[{LEMON,CHERRY,LEMON}]={2157,2},
	[{CHERRY,LEMON,LEMON}]={2157,2},
		[{CHERRY,CHERRY,MANGO}]={2157,2},
	[{CHERRY,MANGO,CHERRY}]={2157,2},
	[{MANGO,CHERRY,CHERRY}]={2157,2},
	[{MANGO,MANGO,CHERRY}]={2157,2},
	[{MANGO,CHERRY,MANGO}]={2157,2},
	[{CHERRY,MANGO,MANGO}]={2157,2},
		[{CHERRY,CHERRY,MELON}]={2157,2},
	[{CHERRY,MELON,CHERRY}]={2157,2},
	[{MELON,CHERRY,CHERRY}]={2157,2},
	[{MELON,MELON,CHERRY}]={2157,2},
	[{MELON,CHERRY,MELON}]={2157,2},
	[{CHERRY,MELON,MELON}]={2157,2},
		[{CHERRY,CHERRY,ORANGE}]={2157,2},
	[{CHERRY,ORANGE,CHERRY}]={2157,2},
	[{ORANGE,CHERRY,CHERRY}]={2157,2},
	[{ORANGE,ORANGE,CHERRY}]={2157,2},
	[{ORANGE,CHERRY,ORANGE}]={2157,2},
	[{CHERRY,ORANGE,ORANGE}]={2157,2},
	
	-- LEMON ANY LEMON
		[{LEMON,LEMON,APPLE}]={2157,2},
	[{LEMON,APPLE,LEMON}]={2157,2},
	[{APPLE,LEMON,LEMON}]={2157,2},
	[{APPLE,APPLE,LEMON}]={2157,2},
	[{APPLE,LEMON,APPLE}]={2157,2},
	[{LEMON,APPLE,APPLE}]={2157,2},
		[{LEMON,LEMON,BANANA}]={2157,2},
	[{LEMON,BANANA,LEMON}]={2157,2},
	[{BANANA,LEMON,LEMON}]={2157,2},
	[{BANANA,BANANA,LEMON}]={2157,2},
	[{BANANA,LEMON,BANANA}]={2157,2},
	[{LEMON,BANANA,BANANA}]={2157,2},
		[{LEMON,LEMON,BERRY}]={2157,2},
	[{LEMON,BERRY,LEMON}]={2157,2},
	[{BERRY,LEMON,LEMON}]={2157,2},
	[{BERRY,BERRY,LEMON}]={2157,2},
	[{BERRY,LEMON,BERRY}]={2157,2},
	[{LEMON,BERRY,BERRY}]={2157,2},
		[{LEMON,LEMON,MANGO}]={2157,2},
	[{LEMON,MANGO,LEMON}]={2157,2},
	[{MANGO,LEMON,LEMON}]={2157,2},
	[{MANGO,MANGO,LEMON}]={2157,2},
	[{MANGO,LEMON,MANGO}]={2157,2},
	[{LEMON,MANGO,MANGO}]={2157,2},
		[{LEMON,LEMON,MELON}]={2157,2},
	[{LEMON,MELON,LEMON}]={2157,2},
	[{MELON,LEMON,LEMON}]={2157,2},
	[{MELON,MELON,LEMON}]={2157,2},
	[{MELON,LEMON,MELON}]={2157,2},
	[{LEMON,MELON,MELON}]={2157,2},
		[{LEMON,LEMON,ORANGE}]={2157,2},
	[{LEMON,ORANGE,LEMON}]={2157,2},
	[{ORANGE,LEMON,LEMON}]={2157,2},
	[{ORANGE,ORANGE,LEMON}]={2157,2},
	[{ORANGE,LEMON,ORANGE}]={2157,2},
	[{LEMON,ORANGE,ORANGE}]={2157,2},
	
	--MANGO ANY MANGO
		[{MANGO,MANGO,APPLE}]={2157,2},
	[{MANGO,APPLE,MANGO}]={2157,2},
	[{APPLE,MANGO,MANGO}]={2157,2},
	[{APPLE,APPLE,MANGO}]={2157,2},
	[{APPLE,MANGO,APPLE}]={2157,2},
	[{MANGO,APPLE,APPLE}]={2157,2},
		[{MANGO,MANGO,BANANA}]={2157,2},
	[{MANGO,BANANA,MANGO}]={2157,2},
	[{BANANA,MANGO,MANGO}]={2157,2},
	[{BANANA,BANANA,MANGO}]={2157,2},
	[{BANANA,MANGO,BANANA}]={2157,2},
	[{MANGO,BANANA,BANANA}]={2157,2},
		[{MANGO,MANGO,BERRY}]={2157,2},
	[{MANGO,BERRY,MANGO}]={2157,2},
	[{BERRY,MANGO,MANGO}]={2157,2},
	[{BERRY,BERRY,MANGO}]={2157,2},
	[{BERRY,MANGO,BERRY}]={2157,2},
	[{MANGO,BERRY,BERRY}]={2157,2},
		[{MANGO,MANGO,MELON}]={2157,2},
	[{MANGO,MELON,MANGO}]={2157,2},
	[{MELON,MANGO,MANGO}]={2157,2},
	[{MELON,MELON,MANGO}]={2157,2},
	[{MELON,MANGO,MELON}]={2157,2},
	[{MANGO,MELON,MELON}]={2157,2},
		[{MANGO,MANGO,ORANGE}]={2157,2},
	[{MANGO,ORANGE,MANGO}]={2157,2},
	[{ORANGE,MANGO,MANGO}]={2157,2},
	[{ORANGE,ORANGE,MANGO}]={2157,2},
	[{ORANGE,MANGO,ORANGE}]={2157,2},
	[{MANGO,ORANGE,ORANGE}]={2157,2},
	
	--MELON ANY MELON
		[{MELON,MELON,APPLE}]={2157,2},
	[{MELON,APPLE,MELON}]={2157,2},
	[{APPLE,MELON,MELON}]={2157,2},
	[{APPLE,APPLE,MELON}]={2157,2},
	[{APPLE,MELON,APPLE}]={2157,2},
	[{MELON,APPLE,APPLE}]={2157,2},
		[{MELON,MELON,BANANA}]={2157,2},
	[{MELON,BANANA,MELON}]={2157,2},
	[{BANANA,MELON,MELON}]={2157,2},
	[{BANANA,BANANA,MELON}]={2157,2},
	[{BANANA,MELON,BANANA}]={2157,2},
	[{MELON,BANANA,BANANA}]={2157,2},
		[{MELON,MELON,BERRY}]={2157,2},
	[{MELON,BERRY,MELON}]={2157,2},
	[{BERRY,MELON,MELON}]={2157,2},
	[{BERRY,BERRY,MELON}]={2157,2},
	[{BERRY,MELON,BERRY}]={2157,2},
	[{MELON,BERRY,BERRY}]={2157,2},
		[{MELON,MELON,ORANGE}]={2157,2},
	[{MELON,ORANGE,MELON}]={2157,2},
	[{ORANGE,MELON,MELON}]={2157,2},
	[{ORANGE,ORANGE,MELON}]={2157,2},
	[{ORANGE,MELON,ORANGE}]={2157,2},
	[{MELON,ORANGE,ORANGE}]={2157,2},

},
 MSG = {'Bingo!','Lucky!','Jackpot!','Winner!','Score!','Nice!'},
 
 POS = {
--Thais--
	[6297] = {direction = SOUTH, distance = 2, pos = Position(32251, 32191, 7)},
	[6298] = {direction = SOUTH, distance = 2, pos = Position(32255, 32191, 7)},
	[6299] = {direction = SOUTH, distance = 2, pos = Position(32259, 32191, 7)},
	[6300] = {direction = SOUTH, distance = 2, pos = Position(32263, 32191, 7)},
	[6301] = {direction = SOUTH, distance = 2, pos = Position(32251, 32199, 7)},
	[6302] = {direction = SOUTH, distance = 2, pos = Position(32255, 32199, 7)},
	[6303] = {direction = SOUTH, distance = 2, pos = Position(32259, 32199, 7)},
	[6304] = {direction = SOUTH, distance = 2, pos = Position(32263, 32199, 7)},
	[6305] = {direction = SOUTH, distance = 2, pos = Position(32251, 32207, 7)},
	[6306] = {direction = SOUTH, distance = 2, pos = Position(32255, 32207, 7)},
	[6307] = {direction = SOUTH, distance = 2, pos = Position(32259, 32207, 7)},
	[6308] = {direction = SOUTH, distance = 2, pos = Position(32263, 32207, 7)},
	[6309] = {direction = SOUTH, distance = 2, pos = Position(32247, 32215, 7)},
	[6310] = {direction = SOUTH, distance = 2, pos = Position(32251, 32215, 7)},
	[6311] = {direction = SOUTH, distance = 2, pos = Position(32255, 32215, 7)},
	[6312] = {direction = SOUTH, distance = 2, pos = Position(32259, 32215, 7)},
	[6313] = {direction = SOUTH, distance = 2, pos = Position(32263, 32215, 7)},
	[6314] = {direction = SOUTH, distance = 2, pos = Position(32267, 32215, 7)},
--Adriatica--
	[6316] = {direction = SOUTH, distance = 2, pos = Position(32633, 33199, 8)},
	[6317] = {direction = SOUTH, distance = 2, pos = Position(32637, 33199, 8)},
	[6318] = {direction = SOUTH, distance = 2, pos = Position(32641, 33199, 8)},
	[6319] = {direction = SOUTH, distance = 2, pos = Position(32645, 33199, 8)},
	[6320] = {direction = SOUTH, distance = 2, pos = Position(32633, 33207, 8)},
	[6321] = {direction = SOUTH, distance = 2, pos = Position(32637, 33207, 8)},
	[6322] = {direction = SOUTH, distance = 2, pos = Position(32641, 33207, 8)},
	[6323] = {direction = SOUTH, distance = 2, pos = Position(32645, 33207, 8)},
	[6324] = {direction = SOUTH, distance = 2, pos = Position(32633, 33215, 8)},
	[6325] = {direction = SOUTH, distance = 2, pos = Position(32637, 33215, 8)},
	[6326] = {direction = SOUTH, distance = 2, pos = Position(32641, 33215, 8)},
	[6327] = {direction = SOUTH, distance = 2, pos = Position(32645, 33215, 8)},
	[6328] = {direction = SOUTH, distance = 2, pos = Position(32629, 33223, 8)},
	[6329] = {direction = SOUTH, distance = 2, pos = Position(32633, 33223, 8)},
	[6330] = {direction = SOUTH, distance = 2, pos = Position(32637, 33223, 8)},
	[6331] = {direction = SOUTH, distance = 2, pos = Position(32641, 33223, 8)},
	[6332] = {direction = SOUTH, distance = 2, pos = Position(32645, 33223, 8)},
	[6333] = {direction = SOUTH, distance = 2, pos = Position(32649, 33223, 8)},
--Dicer Island--
	[6335] = {direction = SOUTH, distance = 2, pos = Position(32156, 32324, 7)},
	[6336] = {direction = SOUTH, distance = 2, pos = Position(32160, 32324, 7)},
	[6337] = {direction = SOUTH, distance = 2, pos = Position(32164, 32324, 7)},
	[6338] = {direction = SOUTH, distance = 2, pos = Position(32168, 32324, 7)},
	[6339] = {direction = SOUTH, distance = 2, pos = Position(32156, 32332, 7)},
	[6340] = {direction = SOUTH, distance = 2, pos = Position(32160, 32332, 7)},
	[6341] = {direction = SOUTH, distance = 2, pos = Position(32164, 32332, 7)},
	[6342] = {direction = SOUTH, distance = 2, pos = Position(32168, 32332, 7)},
	[6343] = {direction = SOUTH, distance = 2, pos = Position(32156, 32340, 7)},
	[6344] = {direction = SOUTH, distance = 2, pos = Position(32160, 32340, 7)},
	[6345] = {direction = SOUTH, distance = 2, pos = Position(32164, 32340, 7)},
	[6346] = {direction = SOUTH, distance = 2, pos = Position(32168, 32340, 7)},
	[6347] = {direction = SOUTH, distance = 2, pos = Position(32152, 32348, 7)},
	[6348] = {direction = SOUTH, distance = 2, pos = Position(32156, 32348, 7)},
	[6349] = {direction = SOUTH, distance = 2, pos = Position(32160, 32348, 7)},
	[6350] = {direction = SOUTH, distance = 2, pos = Position(32164, 32348, 7)},
	[6351] = {direction = SOUTH, distance = 2, pos = Position(32168, 32348, 7)},
	[6352] = {direction = SOUTH, distance = 2, pos = Position(32172, 32348, 7)},
	},
}

for lever, row in pairs(SETUP.POS) do 
 local position = row.pos:getNextPosition(row.direction, row.distance)
 for tile = 0, 2 do
 if row.direction % 2 == 0 then
 SETUP.POS[lever][tile+101] = Position(position.x+tile, position.y, position.z, 1)
 else
 SETUP.POS[lever][tile+101] = Position(position.x, position.y+tile, position.z, 1)
 end
 end
end
 
--  3. FUNCTIONS
--MAY_NOT_MOVE = 20155
--function mayNotMove(cid, bool)
-- Player(cid):setStorageValue(MAY_NOT_MOVE, bool and 1 or -1)
--end
 
function choose(...)
 local arg, ret = {...}
 if type(arg[1]) == 'table' then
 ret = arg[1][math.random(#arg[1])]
 else
 ret = arg[math.random(#arg)]
 end
 return ret
end
 
local function switchLever(lev)
return doTransformItem(lev.uid, lev.itemid == SETUP.LEVER[1] and SETUP.LEVER[2] or SETUP.LEVER[1])
end
 
local function verifyRow(cid, pos)
 local result = false
 for combo, profit in pairs(SETUP.WIN) do
 if (getTileItemById(pos[101], combo[1]).uid > 0) or (combo[1] == ANY) then
 if (getTileItemById(pos[102], combo[2]).uid > 0) or (combo[2] == ANY) then
 if (getTileItemById(pos[103], combo[3]).uid > 0) or (combo[3] == ANY) then
 result = true
 doPlayerAddItem(cid, profit[1], profit[2] or 1, true)
 doCreatureSay(cid, choose(SETUP.MSG), TALKTYPE_ORANGE_1)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Congratulations!! You won ' .. profit[2] .. ' VIP Token(s)!')
 break
 end
 end
 end
 end
 
 for tile = 101, 103 do
 doRemoveItem(getTileThingByPos(pos[tile]).uid)
 doSendMagicEffect(pos[tile], result and CONST_ME_GIFT_WRAPS or CONST_ME_EXPLOSIONHIT)
 end
 
 return not result and doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'Aww, you lost. Better luck next time! :( Try again')
end
 
local function getDirectionTo(pos1, pos2)
 local dir = SOUTH
 if(pos1.x > pos2.x) then
 dir = WEST
 if(pos1.y > pos2.y) then
 dir = NORTHWEST
 elseif(pos1.y < pos2.y) then
 dir = SOUTHWEST
 end
 elseif(pos1.x < pos2.x) then
 dir = EAST
 if(pos1.y > pos2.y) then
 dir = NORTHEAST
 elseif(pos1.y < pos2.y) then
 dir = SOUTHEAST
 end
 elseif(pos1.y > pos2.y) then
 dir = NORTH
 elseif(pos1.y < pos2.y) then
 dir = SOUTH
 end
 return dir
end
 
--  4. SCRIPT
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
 
 if getDirectionTo(player:getPosition(), fromPosition) > 3 then
 return true
 end
 
 local pid = player:getId()
 local function getLever()
 for _, id in ipairs(SETUP.LEVER) do
 local lever = getTileItemById(fromPosition, id)
 if lever.uid > 0 then
 return lever
 end
 end  
 end
 
 if item.actionid == 0 then
 doSetItemActionId(item.uid, 100)
 end
 local function doFruit(pos, id, limit)
 if not player:isPlayer() then
 doSetItemActionId(item.uid, 100)
 for tile = 100, 103 do
 if getTileThingByPos(pos[tile]).uid > 0 then
 doRemoveItem(getTileThingByPos(pos[tile]).uid)
 end
 end
 return true
 end
  
 if getTileThingByPos(pos[id]).itemid < 1 then
 doSendMagicEffect(pos[id], CONST_ME_POFF)
 local fruit = doCreateItemEx(choose(FRUITS))
 doSetItemActionId(fruit, 100)
 doTileAddItemEx(pos[id], fruit)
 else
 doTransformItem(getTileThingByPos(pos[id]).uid, choose(FRUITS))
 end
  
 if limit < 1 then
 doSendMagicEffect(pos[id], math.random(28, 30))
 doTransformItem(getTileThingByPos(pos[id]).uid, choose(FRUITS))
 switchLever(getLever())
 doSetItemActionId(getLever().uid, getLever().actionid+1)
 elseif getLever().actionid > id then
 doSendMagicEffect(pos[id], math.random(28, 30))
 doTransformItem(getTileThingByPos(pos[id]).uid, choose(FRUITS))
 else
 addEvent(doFruit, SETUP.TIME, pos, id, limit-1)
 end
 end
 
 if item.actionid == 100 then  
if not player:removeItem(2157, 1) then
return player:sendTextMessage(MESSAGE_EVENT_ORANGE, 'You need 1 VIP Token to play the Slot Machines.')
 end
 
 doSetItemActionId(item.uid, 101)
 --mayNotMove(pid, true)
 switchLever(item)
 --player:say('-1 VIP Token', TALKTYPE_ORANGE_1)
 for tile = 101, 103 do
 doFruit(SETUP.POS[item.uid], tile, (tile-100)*SETUP.LIMIT)
 end
 
 elseif isInArray({101,102,103}, item.actionid) then
 switchLever(item)
 doSetItemActionId(item.uid, item.actionid+1)
 elseif item.actionid == 104 then
 switchLever(item)
 --mayNotMove(pid, false)
 verifyRow(pid, SETUP.POS[item.uid])
 doSetItemActionId(item.uid, 100)
 end
 
 return true
end