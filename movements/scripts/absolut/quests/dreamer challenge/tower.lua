local config = {
	[3048] = {toPosition = Position(32360, 31782, 7)}, -- Carlin
	[3049] = {toPosition = Position(32659, 33229, 7)}, -- Adriatica
	[3051] = {toPosition = Position(32649, 31925, 11)}, -- Kazordoon
	[3052] = {toPosition = Position(32732, 31634, 7)}, -- Ab'dendriel
	[3053] = {toPosition = Position(32181, 32436, 7)}, -- Fibula
	[3054] = {toPosition = Position(33214, 32453, 7)}, -- Darashia
	[3055] = {toPosition = Position(33194, 32853, 8)}, -- Ankrahmun
	[3056] = {toPosition = Position(32417, 32139, 15)}, -- Mintwallin
	[65523] = {toPosition = Position(33020, 31522, 11)},--Farmine
	[65524] = {toPosition = Position(33217, 31811, 8)}, --Edron
	[65525] = {toPosition = Position(32955, 32074, 7)}, --Venore
	[65526] = {toPosition = Position(21155, 16535, 7)}, --Trainer
	[65527] = {toPosition = Position(32506, 32387, 7)}, --Hunter Island
	[65528] = {toPosition = Position(33513, 32363, 6)}, --Roshamuul	
	[65529] = {toPosition = Position(32215, 31134, 7)}, --Svargrond
	[65530] = {toPosition = Position(32592, 32743, 7)}, --Port Hope
	[65531] = {toPosition = Position(32793, 31247, 5)}, --Yalahar
	[65532] = {toPosition = Position(33605, 31897, 7)}, --Rathleton
	[65533] = {toPosition = Position(33447, 31323, 9)}, --Gray Beach
	[65534] = {toPosition = Position(32315, 32825, 7)}, --Liberty Bay
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
	
	if (player:removeItem(5022, 1)) then
		player:teleportTo(targetTeleport.toPosition)
	else
		player:teleportTo(fromPosition)
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end