local events = {
'TutorialCockroach',
'ElementalSpheresOverlords',
'BigfootBurdenVersperoth',
'BigfootBurdenWarzone',
'BigfootBurdenWeeper',
'BigfootBurdenWiggler',
'SvargrondArenaKill',
'NewFrontierShardOfCorruption',
'NewFrontierTirecz',
'ServiceOfYalaharDiseasedTrio',
'ServiceOfYalaharAzerus',
'ServiceOfYalaharQuaraLeaders',
'InquisitionBosses',
'InquisitionUngreez',
'KillingInTheNameOfKills',
'MastersVoiceServants',
'SecretServiceBlackKnight',
'ThievesGuildNomad',
'WotELizardMagistratus',
'WotELizardNoble',
'WotEKeeper',
'WotEBosses',
'WotEZalamon',
'AdvanceSave',
'AdvanceRookgaard',
'PythiusTheRotten',
}

function onLogin(player)
	-- Free blessings
	freeBless = {
		level = 100,
		blessing = {1, 2, 3, 4, 5, 6}
	}
if player:getLevel() <= freeBless.level then
		for i=1,#freeBless.blessing do
			player:addBlessing(freeBless.blessing[i])
			player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
		end
	end
local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end
	loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
-- Stamina
	nextUseStaminaTime[player.uid] = 0
-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end
--Capture The Flag
	if player:getStorageValue(config["p_green_team"]) == 1 then
		player:setStorageValue(config["p_green_team"], 0)
		Game.setStorageValue(config["green_team"], Game.getStorageValue(config["green_team"]) - 1)
	elseif player:getStorageValue(config["p_red_team"]) == 1 then
		player:setStorageValue(config["p_red_team"], 0)
		Game.setStorageValue(config["p_red_team"], Game.getStorageValue(config["p_red_team"]) - 1)
	end
	
	local bonusCondition = getBonusCondition(player:getOutfit().lookType)
	if bonusCondition then
		player:addCondition(bonusCondition)
	end
	--Elemental resistance
	local resists = { {120, COMBAT_FIREDAMAGE, 20} } -- {subId, damageType, resistancePercent}
function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
		if not creature:isPlayer() then
				return primaryDamage, primaryType, secondaryDamage, secondaryType
		end
		if primaryType == COMBAT_HEALING then
				return primaryDamage, primaryType, secondaryDamage, secondaryType
		end
		for i = 1, #resists do
				if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, resists[i][1]) then
						if primaryType == resists[i][2] then
								primaryDamage = (primaryDamage - (primaryDamage * (resists[i][3] / 100)))
						end
						if secondaryType == resists[i][2] then
								secondaryDamage = (secondaryDamage - (secondaryDamage * (resists[i][3] / 100)))
						end
				end
		end
		return primaryDamage, primaryType, secondaryDamage, secondaryType
end
	
	for i = 1, #events do
		player:registerEvent(events[i])
	end
	-- Events
	player:registerEvent("bountyKIll") 
	player:registerEvent("KITNO")
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("Homestonefx") -- Homestone
	player:registerEvent("AutoLoot") -- AutoLoot
	--player:registerEvent('secureMode')
	--player:setOutfit(player:getOutfit()) -- Outfit Bonus
	player:registerEvent("resist") -- Outfit Bonus
	player:registerEvent("Promo") -- Auto Promotion
	return true
end
