function onSay(cid, words, param)
if getPlayerBlessing(cid,5) then
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already been blessed")
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MORTAREA)
else
if doPlayerRemoveMoney(cid, 20000) == true then
	for i = 1,6 do
		doPlayerAddBlessing(cid,i)
end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have received blessings!")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_ENERGYAREA)
else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have enough gold in your backpack for blessings.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREAREA)
end
	end
	return true
end 