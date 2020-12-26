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
[64705] = {toPosition = Position(33106, 31961, 7)}
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
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33095, y = 31947, z = 7, stackpos = 255}, {x = 33111, y = 31963, z = 7, stackpos = 255}) then
		player:teleportTo(targetTeleport.toPosition)
	        doSummonCreature("razzagorn", {x = 33098, y = 31953, z = 7})
		else
			player:teleportTo(fromPosition)
		end
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end