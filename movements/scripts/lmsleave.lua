local t = {
depot = {x = 32346, y = 32223, z = 7},
}

function onStepIn(cid, item, position, lastPosition)

doTeleportThing(cid, t.depot)
doSendMagicEffect(t.depot, CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have left the Last Man Standing event!!")
setPlayerStorageValue(cid, 25001, 0)
setGlobalStorageValue(25002,getGlobalStorageValue(25002)-1)


end