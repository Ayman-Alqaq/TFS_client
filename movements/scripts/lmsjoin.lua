local t = {
waitingroom = {x = 32547, y = 32166, z = 9},
}

function onStepIn(cid, item, position, lastPosition)

doTeleportThing(cid, t.waitingroom)
doSendMagicEffect(t.waitingroom, CONST_ME_TELEPORT)



if (getGlobalStorageValue(25002) < 0) then
setGlobalStorageValue(25002,1)
setPlayerStorageValue(cid, 25001, 1)
broadcastMessage(getCreatureName(cid).." has joined the Last Man Standing event!", MESSAGE_STATUS_WARNING)

else

setGlobalStorageValue(25002,getGlobalStorageValue(25002)+1)
setPlayerStorageValue(cid, 25001, 1)

broadcastMessage(getCreatureName(cid).." has joined the Last Man Standing event!", MESSAGE_STATUS_WARNING)
end
end