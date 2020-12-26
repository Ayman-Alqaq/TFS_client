local centeroffight = {x = 33465, y = 31758, z = 7} --Castlegaard
local waitingplace = {x = 32547, y = 32166, z = 9} -- world event waiting room
local depotcenter = {x = 32345, y = 32223, z = 7} -- Thais depot center
local MinimumPlayers = 2
--local rewardpoints = 2 REWARD ITEM ID/COUNT


local function lmsclosed1()
	broadcastMessage("[Last Man Standing] Event will start in 1 minute. The event portal is located in the Thais Temple.", MESSAGE_STATUS_WARNING)
end

local function lmsclosed()

count = 0
        local spectators = getSpectators(waitingplace, 10, 10, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then    
                         count = count + 1
                       
                        end
                end
        end

if (count >= MinimumPlayers) then

broadcastMessage("[Last Man Standing] Entry portal has closed. The Battle Begins!", MESSAGE_STATUS_WARNING)

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,centeroffight)
doSendMagicEffect(center, CONST_ME_TELEPORT)
    end
       
end

else

broadcastMessage("[Last Man Standing] Not enough players to start the event! Minimum: "..MinimumPlayers.." players.", MESSAGE_STATUS_WARNING)
setGlobalStorageValue(25002, 0)

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
setPlayerStorageValue(pid, 25001, 0)

    end
end
end

return true
end

local function lmscheck()

count = 0
        local spectators = getSpectators(centeroffight, 10, 10, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then    
                         count = count + 1
                       
                        end
                end
        end

if count == 1 then

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(playerids, 25001, 0)
    end
end

        local spectators = getSpectators(centeroffight, 10, 10, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then  
            
doTeleportThing(spectator,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
broadcastMessage("[Last Man Standing] The event has ended. The winner is: "..getPlayerName(spectator)..".", MESSAGE_STATUS_WARNING)
   
--INSERT REWARD HERE
                     end
                end
        end

for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(pid, 25001, 0)
end
end

stopEvent(lmscheck) 

else
addEvent(lmscheck, 10*1000)
end
end

local function lms()
	broadcastMessage("[Last Man Standing] Event will start in 2 minutes. The event portal is located in the Thais Temple.", MESSAGE_STATUS_WARNING)

	portalwhere = {x= 32360, y=32239, z=7}
	local portal = doCreateItem(8058,1,portalwhere)
  doSetItemActionId(portal, 25001)
  doSendMagicEffect(portalwhere, CONST_ME_TELEPORT)


	iteminfo = {x= 32359, y=32239, z=7}
	local item = doCreateItem(1431,1,iteminfo)
  doSetItemActionId(item, 25002) 
  doSendMagicEffect(iteminfo, CONST_ME_TELEPORT)
  
addEvent(function() doRemoveItem(getTileItemById(portalwhere, 8058).uid) end, 120 * 1000)
addEvent(function() doSendMagicEffect(portalwhere, CONST_ME_TELEPORT) end, 120 * 1000)

addEvent(function() doRemoveItem(getTileItemById(iteminfo, 1431).uid) end, 120 * 1000)
addEvent(function() doSendMagicEffect(iteminfo, CONST_ME_TELEPORT) end, 120 * 1000)

addEvent(lmsclosed, 2*60*1000)
addEvent(lmsclosed1, 1*60*1000)
addEvent(lmscheck, 130*1000)

return true
end

function onThink(interval) 

	broadcastMessage("[Last Man Standing] Event will start in 3 minutes. The event portal is located in the Thais Temple.", MESSAGE_STATUS_WARNING)
	addEvent(lms, 60*1000)

return true
end