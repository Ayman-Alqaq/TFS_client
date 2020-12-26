--[[
    Information:
        Teleport and both pressure plates inside and out all with the same action ID,
        make sure to register AID in movements.xml.
        NOTE: If someone dies inside the arena and logs back in before timer ends
         it will teleport them to the exit position. So you should include a
         statement like this in your logout creature event:
            
            if player:getStorageValue(50010) > 0 then
                player:setStorageValue(50010, 0)
            end
--]]

local config = {
    timer = 5*60*1000, -- Number of minutes in arena
    signId = 1429, -- Item id of sign
    tokenId = 2157, -- Item id required to enter
    cost = 1, -- Number of items required
    storage = 50010 --Storage value to cancel events
}

local storages = {
    vipRoom = {},
    event = {}
}

local function vipRoomDecay(mobName, cid, position)
    for k, v in pairs(storages.vipRoom[mobName]) do
        local creature = Monster(v) -- Assign creature to the room from the monster array
        if creature then -- If a monster is in the room,
            creature:remove() -- Remove the monster
        end
    end
    
    storages.vipRoom[mobName] = nil

    local player = Player(cid) -- Assign player ID to player variable
    if player and player:getStorageValue(config.storage) == 1 then --If player is in room when time expires
        player:teleportTo(position) -- Kick player from arena
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'Times up.') -- Show message "times up"
        player:setStorageValue(config.storage, 0)
    end
end

function onStepIn(creature, item, toPosition, fromPosition)
    if not creature:isPlayer() then
        return false
    end

    local player = Player(creature)
    
    if item:isTeleport() then
        
		player:teleportTo(Position(toPosition.x, toPosition.y+2, toPosition.z)) --Exit Arena Pos
		player:setStorageValue(config.storage, 0)
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'Exiting arena...')

        if storages.event[player:getId()] then
            stopEvent(storages.event[player:getId()])
            storages.event[player:getId()] = nil
        end

        local sign = Tile(Position(toPosition.x-7,toPosition.y+2,toPosition.z)):getItemById(config.signId)
        local mobName = sign:getAttribute(ITEM_ATTRIBUTE_TEXT)
        
        for k, v in pairs(storages.vipRoom[mobName]) do
            local creature = Monster(v) -- Assign creature to the room from the monster array
            if creature then -- If a monster is in the room,
                creature:remove() -- Remove the monster
            end
        end

        storages.vipRoom[mobName] = nil        
    else
        local position = player:getPosition()        
        
        local signOutside = Tile(Position(position.x-1,position.y,position.z)):getItemById(config.signId)
        local signInside = Tile(Position(position.x-1,position.y+2,position.z)):getItemById(config.signId)
        local sign = signOutside or signInside --Assign signs to sign
        local mobName = sign:getAttribute(ITEM_ATTRIBUTE_TEXT)
        
        if signOutside then
            if not storages.vipRoom[mobName] then
                if player:getItemCount(config.tokenId) >= config.cost then
                    player:removeItem(config.tokenId, config.cost) -- Take required item and count from player
                    player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have '..config.timer/(60*1000)..' minutes in this arena. Step on the red switch pad to spawn more creatures.')
                    player:teleportTo(Position(position.x, position.y-2, position.z)) --Send player into arena
                    player:setStorageValue(config.storage, 1)
                    
                    storages.event[player:getId()] = addEvent(vipRoomDecay, config.timer, mobName, player:getId(), fromPosition)
                else
                    player:sendTextMessage(MESSAGE_INFO_DESCR, 'You require a VIP token to enter the arena.')
                    player:teleportTo(fromPosition, true) -- Send player back to starting position
                end
            else
                player:sendTextMessage(MESSAGE_INFO_DESCR, 'This arena is currently in use. Please wait.')
                player:teleportTo(fromPosition, true) -- Send player back to starting position
            end
        elseif signInside then
            local spawnPosition = Position(position.x+4, position.y-5, position.z) -- Where to spawn creature
            if not storages.vipRoom[mobName] then
                storages.vipRoom[mobName] = {}
            end
            storages.vipRoom[mobName][#storages.vipRoom[mobName]+1] = Game.createMonster(mobName, spawnPosition, false, true):getId()
        end            
    end
    return false	
end