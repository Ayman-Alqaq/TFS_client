MATCH = {
	-- do not touch --
	POS = {},
	LAST = {},
	COUNT = {},
	SCORE = {},
	SHOWN = {},
	EXHAUST = {},
	EVENT = {},
	SIZE = {5, 8}, 
	DELAY = 1,
	HIDDEN = 2260,
	TIMER = 0,
	DURATION = 15,
	------------------
	BOARD = {
		from = Position(32394, 32191, 7),
		to = Position(32398, 32198, 7)
	},
	PLAYERS = {
		from = {
			[1] = Position(32395, 32189, 7),
			[2] = Position(32396, 32189, 7),
			[3] = Position(32397, 32189, 7),
			[4] = Position(32398, 32189, 7)
		},
		to = {
			[1] = Position(32392, 32193, 7),
			[2] = Position(32400, 32193, 7),
			[3] = Position(32392, 32196, 7),
			[4] = Position(32400, 32196, 7)
		} 	
	},
	EXIT = Position(32400, 32204, 7)
}

for rune = 2261, 2316 do
	table.insert(MATCH.SHOWN, rune)
end

pause = coroutine.yield
function doSleep(co)
	if coroutine.status(co) ~= 'dead' then
		local _, delay = coroutine.resume(co)
		addEvent(doSleep, delay, co)
	end
end

function enableSleep(f)
	if type(f) == 'function' then
		local co = coroutine.create(f)
		doSleep(co)
	end
end

function getValue(v)
	return v or 0
end

function table.getIndex(t, v)
	for index, value in ipairs(t) do
		if v == value then
			return index
		end
	end
end

function table.shuffle(t)
	local j
	for i = #t, 2, -1 do
		j = math.random(i)
		t[i], t[j] = t[j], t[i]
	end
end

function isMatchRune(id)
	return isInArray(MATCH.SHOWN, id) or (id == MATCH.HIDDEN)
end

function hideRune(p) 
	local v = Tile(p):getTopVisibleThing(false)
	return isMatchRune(v:getId()) and v:transform(MATCH.HIDDEN), p:sendMagicEffect(10)
end

function controlMatchRune(cid, id)
	if getValue(MATCH.LAST[cid]) == id then
		p = MATCH.POS[cid]
		hideRune(p)
		MATCH.POS[cid] = 0
		MATCH.LAST[cid] = 0
		MATCH.COUNT[cid] = 0
		doCreatureSay(cid, "TIMEOUT", TALKTYPE_MONSTER_SAY, false, nil, p)
	end
end

function showRune(cid, rune)
	local p, u = rune:getPosition(), rune:getAttribute(ITEM_ATTRIBUTE_CHARGES)
	rune:transform(u)
	p:sendMagicEffect(10)
	local v = getValue(MATCH.LAST[cid])
	if v > 0 then
		return v == u
	end
	MATCH.LAST[cid] = u
	MATCH.POS[cid] = p
	MATCH.EVENT[cid] = addEvent(controlMatchRune, 4200, cid, u)
	return nil
end

function cleanBoard()
	for x = MATCH.BOARD.from.x, MATCH.BOARD.to.x do
		for y = MATCH.BOARD.from.y, MATCH.BOARD.to.y do 
			for _, item in ipairs(Tile(Position(x, y, MATCH.BOARD.from.z)):getItems()) do
				item:remove()
			end
		end
	end
end

function endMatch()
	local h = {}
	for _, pos in ipairs(MATCH.PLAYERS.to) do
		local player = Tile(pos):getTopCreature()
		if player ~= nil then
			local cid = player:getId()
			table.insert(h, {player:getName(), getValue(MATCH.SCORE[cid])})
			MATCH.SCORE[cid] = nil
			player:teleportTo(MATCH.EXIT)
		end
	end
	table.sort(h, function(a, b) return a[2] > b[2] end)
	local str = "Rune Match event finished!"
	for _, highscore in ipairs(h) do
		str = str .. "\n" .. highscore[1] .. " scored " .. math.floor((highscore[2]/(MATCH.SIZE[1]*MATCH.SIZE[2]))*100) .. "%"
	end
	if h[1][2] > h[2][2] then
		local topPlayer = Player(h[1][1])
		topPlayer:addItems(2160, 1)
		topPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You won 1 crystal coin!")
	Game.broadcastMessage(str, MESSAGE_EVENT_ADVANCE)
	cleanBoard()
	stopEvent(MATCH.TIMER)
	end
end

function newBoard()
	cleanBoard()
	table.shuffle(MATCH.SHOWN)
	MATCH.TIMER = addEvent(endMatch, MATCH.DURATION*60*1000)
	local i, k, l, x, y = 0, {}, MATCH.SIZE[1]*MATCH.SIZE[2], MATCH.BOARD.from.x, MATCH.BOARD.from.y
	for index = 1, (MATCH.SIZE[1]*MATCH.SIZE[2])/2 do 	
		table.insert(k, MATCH.SHOWN[index])
		table.insert(k, MATCH.SHOWN[index])
	end
	while i < l do 			
		v, p = k[math.random(#k)], Position(x, y, MATCH.BOARD.from.z) 	
		p:sendMagicEffect(10)
		table.remove(k, table.getIndex(k, v)) 	
		r = Item(doCreateItemEx(MATCH.HIDDEN, 1))
		r:setActionId(31337)
		r:setAttribute(ITEM_ATTRIBUTE_CHARGES, v)
		doTileAddItemEx(p, r:getUniqueId())
		i = i + 1
		if x == MATCH.BOARD.to.x then
			y = y + 1 		
			x = MATCH.BOARD.from.x
		else
			x = x + 1
		end
	end
end

function isBoardEmpty()
	for x = MATCH.BOARD.from.x, MATCH.BOARD.to.x do
		for y = MATCH.BOARD.from.y, MATCH.BOARD.to.y do
			local v = Tile(Position(x, y, MATCH.BOARD.from.z)):getTopVisibleThing(false)
			if (v ~= nil) and isMatchRune(v:getId()) then
				return false
			end
		end
	end
	return true
end

function onStepOut(creature, item, position, fromPosition)
	if not position:isInRange(MATCH.BOARD.from, MATCH.BOARD.to) and (MATCH.SCORE[creature:getId()] ~= nil) then
		creature:teleportTo(fromPosition)
	end
	return true
end