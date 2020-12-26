local config = {
waittime = 10, -- time in seconds to use homestone again.
storage = 2301, -- storage for `waittime`
level = 6000, -- after this level you CANT use homestone.
cooldown = 5, -- how many seconds character must wait after use stone until get teleported.
}

function onUse(cid, item, fromPosition, target, toPosition, isHotkey)

local player = Player(cid)
local pos = player:getPosition()

if (player:getLevel() >= config.level) then
	player:sendCancelMessage('Only players under ' .. config.level .. ' can use homestone!')
	pos:sendMagicEffect(3)
else
if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
	--player:say('You may not teleport during combat! Find a safe zone and  try again.', TALKTYPE_MONSTER_SAY)
	player:sendCancelMessage('You may not teleport during combat! Find a safe zone and  try again.')
	pos:sendMagicEffect(3)
else
if (exhaust(cid, config.storage, config.waittime) == 0) then
 
local time = ((os.difftime(oldExhaust, newExhaust))-(50))
local hours, minutes, seconds = math.floor (time / 3600), math.floor ((time - ((math.floor (time / 3600)) * 3600))/ 60), time - ((math.floor (time/60)) * 60)
if time >= 3600 then
text = hours.." "..(hours > 1 and "hours" or "hour")..", "..minutes.." "..(minutes > 1 and "minutes" or "minute").." and "..seconds.." "..(seconds > 1 and "seconds" or "second")
elseif time >= 120 then
text = minutes.." "..(minutes > 1 and "minutes" or "minute").." and "..seconds.." "..(seconds > 1 and "seconds" or "second")
else
text = seconds.." "..(seconds > 1 and "seconds" or "second")
end
	player:sendCancelMessage('You need to wait ' .. text .. ' before you can use homestone again.')
	pos:sendMagicEffect(3)
else

function tped(cid)
local player = Player(cid)
local destination = player:getTown():getTemplePosition()
local homeid = (getPlayerTown(player))
local pos = player:getPosition()
	if not player then
	return false
	end
item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "This rune can teleport players to their home town. \n Current home: "..getTownName(homeid)..".")--(under level " .. config.level .. ")
pos:sendMagicEffect(CONST_ME_ENERGYHIT)
player:teleportTo(destination)
destination:sendMagicEffect(40)
item:remove(1)
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have succesfully teleported to ' .. getTownName(homeid) .. '.')
exhaust(cid, config.storage, config.waittime)
setPlayerStorageValue(cid, 2302, 0)
--player:allowMovement(true)
return true
end
 
addEvent(tped, (config.cooldown * 1000), cid.uid)
pos:sendMagicEffect(CONST_ME_ENERGYHIT)
doCreatureSay(cid, "Teleport in progress. Please wait...", TALKTYPE_ORANGE_1)

pos:sendMagicEffect(CONST_ME_ENERGYHIT)
setPlayerStorageValue(cid, 2302, 1)
--player:allowMovement(false)
 
end -- end re-use
 
end -- end pzlock
end -- end levelcap

return true
end -- end function