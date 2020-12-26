function onSay(player, words, param)
local item = player:addItem(2789, 1)
if item then
    item:setActionId(1435)
end
end 