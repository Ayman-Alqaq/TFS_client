local cfg = {
	points = 1000,
	effect = CONST_ME_GIFT_WRAPS
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    db.query("UPDATE `znote_accounts` SET `points` = `points` + '" .. cfg.points .. "' WHERE `account_id` = '" .. player:getAccountId() .. "' LIMIT 1;")
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have received ".. cfg.points .." shop points!")
    player:getPosition():sendMagicEffect(cfg.effect)
    item:remove(1)
    return true
end