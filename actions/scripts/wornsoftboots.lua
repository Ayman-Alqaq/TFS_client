local config = {
	old = 10021, --id of worn soft boots
	new = 6132, --id of Soft Boots
	cost = 20000
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if not player then
		return false
	end

	if (player:getItemCount(config.old) > 0 and player:removeMoney(config.cost)) then
			player:addItem(config.new)
			player:removeItem(config.old, 1)
	end
		player:sendCancelMessage("You need worn soft boots and " .. config.cost .. " gold coins to repair your soft boots.")
	end