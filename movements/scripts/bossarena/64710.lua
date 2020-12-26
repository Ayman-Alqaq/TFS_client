local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creature.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

local config = {
[64710] = {toPosition = Position(32610, 33384, 8)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetTeleport = config[item.uid]
	if not targetTeleport then
		return true
	end
	
	if (player:removeItem(2157, 10)) then
	    if player:getStorageValue(1) and not isPlayerInArea({x = 32585, y = 33370, z = 9, stackpos = 255}, {x = 32607, y = 33391, z = 9, stackpos = 255}) then
		player:teleportTo(targetTeleport.toPosition)
	    doSummonCreature("Orshabaal", {x = 32593, y = 33378, z = 9})
	else
		player:teleportTo(fromPosition)
	end
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
	end