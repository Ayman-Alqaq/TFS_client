function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.itemid == 1945 then
        if tronEvent:onUseLever(player) == false then
            return true
        end
    end
 
    item:transform(item.itemid == 1945 and 1946 or 1945)
    return true
end