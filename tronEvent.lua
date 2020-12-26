local RED_TRON = 1
local YELLOW_TRON = 2
local PURPLE_TRON = 3

local config = {
	playerSpeed = 1500,
	tronSpeed = 100,
	reward = {
		{id = 2160, count = 1},
		{id = 2152, count = 5},
		{id = 2148, count = 10}
	},
	position = {
		playerPosition = { -- Position of the tiles, when they press the lever
			Position(32409, 32197, 7),
			Position(32411, 32197, 7),
			Position(32410, 32198, 7)
		},
		newPosition = { -- Starter position, when they get teleported inside 
			[RED_TRON] = Position(33687, 32147, 7),
			[YELLOW_TRON] = Position(33623, 32181, 7),
			[PURPLE_TRON] = Position(33690, 32218, 7)
		},
		arenaPosition = {
			fromPosition = Position(33615, 32141, 7), -- Top left of the area
			toPosition = Position(33699, 32228, 7) -- Bottom right of the area
		}
	}
}


if not tronEvent then
	tronEvent = {
		players = {},

		joinCount = 0,
		running = false,

		eventStorage = 2000,
		colorStorage = 2001,
		lifeStorage = 2002,

		color = {
			[RED_TRON] = {field = 1492, colorName = "Red"},
			[YELLOW_TRON] = {field = 1500, colorName = "Yellow"},
			[PURPLE_TRON] = {field = 1506, colorName = "Purple"}
		},
		tronDirection = {
			[DIRECTION_NORTH] = 7132, 
			[DIRECTION_EAST] = 7131, 
			[DIRECTION_SOUTH] = 7132, 
			[DIRECTION_WEST] = 7131
		},
	}
end

function tronEvent.getPlayerColor(self, player)
	return player:getStorageValue(self.colorStorage)
end

function tronEvent.addReward(self, player)
	for i = 1, #config.reward do
		local reward = config.reward[i]
		player:addItem(reward.id, reward.count)
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been rewarded for winning the Tron event.")
end

function tronEvent.onUseLever(self, player)
	if self.running then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "There is already someone in the event.")
		return false
	end

	-- Are the players on the tiles?
	local storePlayers = {}
	for i = 1, #config.position.playerPosition do
		local playerTile = Tile(config.position.playerPosition[i]):getTopCreature()
		if not playerTile or not playerTile:isPlayer() then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 3 players.")
			return false
		end

		storePlayers[#storePlayers + 1] = playerTile
	end

	for i = 1, #storePlayers do
		self:addPlayer(storePlayers[i])
	end

	self:broadcastMessage(MESSAGE_INFO_DESCR, "Welcome to the Tron Event! The following commands are available:\n!tron boost -- To speed up.\n!tron jump -- To jump over fields.\nIt is strongly recommended that you bind these commands to your hotkeys.")
	addEvent(tronEvent.startCountdown, 13 * 1000, self, 3)
	return true
end

local tronOutfitCondition = Condition(CONDITION_OUTFIT, CONDITIONID_COMBAT)
tronOutfitCondition:setTicks(-1)

function tronEvent.addPlayer(self, player)
	-- Increase the join count by "+1"
	self.joinCount = self.joinCount + 1

	-- Add Storages
	player:setStorageValue(self.eventStorage, 1)
	player:setStorageValue(self.colorStorage, self.joinCount)
	player:setStorageValue(self.lifeStorage, 3)

	-- Teleport
	local startPosition = config.position.newPosition[self.joinCount]
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	player:teleportTo(startPosition)
	startPosition:sendMagicEffect(CONST_ME_TELEPORT)

	-- Remove Speed
	player:changeSpeed(-player:getSpeed())

	-- Store player
	self.players[#self.players + 1] = player:getId()
end

function tronEvent.moveTron(self, cid)
	local player = Player(cid)
	if not player then
		return
	end

	-- Has no event storage, then stop it
	if player:getStorageValue(self.eventStorage) ~= 1 then
		return
	end

	-- Store Last Position, so we can add the fields behind the tron
	local lastPosition = player:getPosition()

	-- Direction to move
	local direction = player:getDirection()
	doMoveCreature(cid, direction)

	-- Lets add the color field, behind the tron, with player id as attribute
	local colorId = self:getPlayerColor(player)
	if colorId == -1 then
		return
	end

	local colorField = Game.createItem(self.color[colorId].field, 1, lastPosition)
	if colorField then
		colorField:setAttribute(ITEM_ATTRIBUTE_TEXT, cid)
	end

	-- Outfit
	tronOutfitCondition:setOutfit(self.tronDirection[direction])
	player:addCondition(tronOutfitCondition)

	addEvent(tronEvent.moveTron, config.tronSpeed, self, cid)
end

function tronEvent.addTron(self, player)
	-- Add speed
	player:changeSpeed(config.playerSpeed)

	-- Move the tron
	self:moveTron(player:getId())
end

function tronEvent.onPlayerDeath(self, player, killerId)
	-- Clear the field of this tron
	local arenaPosition = config.position.arenaPosition
	for x = arenaPosition.fromPosition.x, arenaPosition.toPosition.x do
		for y = arenaPosition.fromPosition.y, arenaPosition.toPosition.y do
			for z = arenaPosition.fromPosition.z, arenaPosition.toPosition.z do
				local tile = Tile(x, y, z)
				if tile then
					for _, item in ipairs(tile:getItems()) do
						-- Remove the fields
						if item:getType():getType() == ITEM_TYPE_MAGICFIELD then
							if item:getId() == self.color[self:getPlayerColor(player)].field then
								item:remove()
							end
						end
					end
				end
			end
		end
	end

	-- Remove life point
	local life = math.max(1, player:getStorageValue(self.lifeStorage))
	player:setStorageValue(self.lifeStorage, life - 1)

	-- Teleport starting position
	local position = config.position.newPosition[self:getPlayerColor(player)]
	player:teleportTo(position)
	position:sendMagicEffect(CONST_ME_TELEPORT)

	local playerName, killerName = player:getName(), "undefined"
	local playerColor, killerColor = self.color[self:getPlayerColor(player)].colorName, "undefined"

	local killer = Player(killerId)
	if killer then
		killerName = killer:getName()
		killerColor = self.color[self:getPlayerColor(killer)].colorName

		-- Send Message
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You were killed by %s[%s] - %d life left.", killerName, killerColor, life - 1))
		killer:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You killed %s[%s]", playerName, playerColor))
	end

	-- Broadcast "Death"
	if life > 1 then
		self:broadcastMessage(MESSAGE_INFO_DESCR, string.format("[Tron Event]: %s[%s] were killed by %s[%s].", playerName, playerColor, killerName, killerColor))
	else
		self:broadcastMessage(MESSAGE_INFO_DESCR, string.format("[Tron Event]: %s[%s]! Has been eliminated by %s[%s].", playerName, playerColor, killerName, killerColor))
		self:releasePlayer(player)
	end
end

function tronEvent.onPlayerCommands(self, player, keyword)
	if keyword == "jump" then
		-- Do action
	elseif keyword == "boost" then
		-- Do action
	else
		player:sendCancelMessage("Insufficient parameters.")
	end
end

function tronEvent.broadcastMessage(self, messageType, message)
	if #self.players == 0 then
		return
	end

	if messageType == nil then
		messageType = MESSAGE_STATUS_WARNING
	end

	for i = 1, #self.players do
		local tmpPlayer = Player(self.players[i])
		if tmpPlayer then
			tmpPlayer:sendTextMessage(messageType, message)
		end
	end
end

function tronEvent.removePlayer(self, playerId)
	if #self.players == 0 then
		return
	end

	for i = 1, #self.players do
		if self.players[i] == playerId then
			table.remove(self.players, i)
			return
		end
	end
end

function tronEvent.releasePlayer(self, player)
	-- Remove Storages
	player:setStorageValue(self.eventStorage, -1)
	player:setStorageValue(self.colorStorage, -1)
	player:setStorageValue(self.lifeStorage, -1)

	-- Remove outfit
	player:removeCondition(CONDITION_OUTFIT, CONDITIONID_COMBAT)

	-- Change back speed
	player:changeSpeed(-player:getSpeed())
	player:changeSpeed(player:getBaseSpeed())

	-- Teleport player to temple
	local templePosition = player:getTown():getTemplePosition()
	player:teleportTo(templePosition)
	templePosition:sendMagicEffect(CONST_ME_TELEPORT, player)

	-- Remove from player table
	self:removePlayer(player:getId())

	-- Last player, then stop the event. We got a winner
	if #self.players == 1 then
		-- Fetch winner
		for i = 1, #self.players do
			local tmpPlayer = Player(self.players[i])
			if tmpPlayer then
				self:addReward(tmpPlayer)
				self:releasePlayer(tmpPlayer)
			end
		end

		self:reset()
	end
			
end

function tronEvent.startCountdown(self, count)
	for i = 1, #self.players do
		local tmpPlayer = Player(self.players[i])
		if tmpPlayer then
			tmpPlayer:say(string.format("%s", count == 0 and "GO!" or count), TALKTYPE_MONSTER_SAY)
			if count == 0 then
				self:start()
				return
			end
		end
	end

	addEvent(tronEvent.startCountdown, 1000, self, count - 1)
end
	
function tronEvent.start(self)
	self.running = true

	for i = 1, #self.players do
		local tmpPlayer = Player(self.players[i])
		if tmpPlayer then
			self:addTron(tmpPlayer)
		end
	end
end

function tronEvent.reset(self)
	self.players = {}
	self.running = false
	self.joinCount = 0
end