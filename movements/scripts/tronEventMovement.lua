function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if player == nil then
        return false
    end
 
    position:sendMagicEffect(CONST_ME_FIREAREA)
    tronEvent:onPlayerDeath(player, tonumber(item:getAttribute(ITEM_ATTRIBUTE_TEXT)) or 0)
    return true
end