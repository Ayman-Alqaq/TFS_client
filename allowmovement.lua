local function allowMovementEvent(cid, allow, oldPosition)
	local creature = Creature(cid)
	if not creature then
		return false
	end

	if allow then
		return stopEvent(event)
	else
		stopEvent(event)
	end

	creature:teleportTo(oldPosition, true)
	creature:sendCancelMessage('You cannot move.')
 
	event = addEvent(allowMovementEvent, 100, cid, allow, oldPosition)
end

function Creature.allowMovement(self, allow)
	allowMovementEvent(self:getId(), allow, self:getPosition())
end