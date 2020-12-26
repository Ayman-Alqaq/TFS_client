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
[64702] = {toPosition = Position(33024, 31936, 7)}
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
	
	if (player:removeItem(2157, 1)) then
	    if player:getStorageValue(1) and not isPlayerInArea({x = 33014, y = 31922, z = 7, stackpos = 255}, {x = 33030, y = 31938, z = 7, stackpos = 255}) then
		player:teleportTo(targetTeleport.toPosition)
	    doSummonCreature("shulgrax", {x = 33017, y = 31927, z = 7})
	else
		player:teleportTo(fromPosition)
	end
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
	end