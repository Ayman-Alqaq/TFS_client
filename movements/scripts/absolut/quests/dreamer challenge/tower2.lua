local config = {
	[65535] = {toPosition = Position(32360, 31782, 7)}, -- Carlin
	[7811] = {toPosition = Position(32369, 32241, 7)}, -- Thais
	[7812] = {toPosition = Position(32649, 31925, 11)}, -- Kazordoon
	[7813] = {toPosition = Position(33214, 32453, 7)}, -- Darashia
	[7814] = {toPosition = Position(32732, 31634, 7)}, -- Ab'dendriel
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
	
	player:teleportTo(targetTeleport.toPosition)

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end