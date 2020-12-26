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
[64712] = {toPosition = Position(32624, 33248, 8)}
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
	    if player:getStorageValue(1) and not isPlayerInArea({x = 32627, y = 33242, z = 9, stackpos = 255}, {x = 32642, y = 33255, z = 9, stackpos = 255}) then
		player:teleportTo(targetTeleport.toPosition)
	    doSummonCreature("Amazon Queen", {x = 32635, y = 33248, z = 9})
	else
		player:teleportTo(fromPosition)
	end
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
	end