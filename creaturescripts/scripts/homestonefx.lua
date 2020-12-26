function onThink(cid)
local player = Player(cid)
if (getPlayerStorageValue(cid, 2302) == 1) then
player:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
end
return true
end