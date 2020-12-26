local togglestorage = 2557
local delaystorage = 2558

function onSay(player, words, param)
-- this is to avoid duplicated auto attack
local stor = player:getStorageValue(delaystorage)
if stor > os.time() then
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Please wait " .. stor - os.time() .. " seconds before trying again.")
return false
end
player:setStorageValue(delaystorage, os.time() + 5)
if player:getStorageValue(togglestorage) == 1 then
player:setStorageValue(togglestorage, 0)
player:sendTextMessage(MESSAGE_INFO_DESCR, "Auto attack disabled.")
return false
end
player:setStorageValue(togglestorage, 1)
player:sendTextMessage(MESSAGE_INFO_DESCR, "Auto attack enabled.")
return false
end