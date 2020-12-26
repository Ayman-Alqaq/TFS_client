--Outfit Bonus--
function createBonusCondition(id, params)
	local condition = Condition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT)
	condition:setParameter(CONDITION_PARAM_TICKS, -1)
	condition:setParameter(CONDITION_PARAM_SUBID, id)
	for i = 1, #params do
		local param = params[i].param
		local value = params[i].value
		condition:setParameter(param, value)
	end
	return condition
end

outfitBonuses = {
	--Citizen
	[{128, 136}] = createBonusCondition(1, {
			{param = CONDITION_PARAM_SPEED, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5}
		}
	),
	-- Hunter
	[{129, 137}] = createBonusCondition(2, {
			{param = CONDITION_PARAM_SKILL_DISTANCE, value = 5},
			{param = CONDITION_PARAM_SPEED, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 50}
		}
	),
	-- Mage
	[{130, 138}] = createBonusCondition(3, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 200},
			{param = CONDITION_PARAM_SPEED, value = 50}
		}
	),
	--Knight
	[{131, 139}] = createBonusCondition(4, {
			{param = CONDITION_PARAM_SKILL_CLUB, value = 5},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100}
		}
	),
	--Nobleman
	[{132, 140}] = createBonusCondition(5, {
			{param = CONDITION_PARAM_SKILL_CLUB, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 10},
			{param = CONDITION_PARAM_SPEED, value = 5}
		}
	),
	--Summoner
	[{133, 141}] = createBonusCondition(6, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100},
			{param = CONDITION_PARAM_SPEED, value = 50}
		}
	),
	--Warrior
	[{134, 142}] = createBonusCondition(7, {
			{param = CONDITION_PARAM_SKILL_SWORD, value = 5},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100}
		}
	),
	--Barbarian
	[{143, 147}] = createBonusCondition(8, {
			{param = CONDITION_PARAM_SKILL_AXE, value = 5},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 50}
		}
	),
	--Druid
	[{144, 148}] = createBonusCondition(9, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100},
			{param = CONDITION_PARAM_SPEED, value = 25}
		}
	),
	--Wizard
	[{145, 149}] = createBonusCondition(10, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 100},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5}
		}
	),
	--Oriental
	[{146, 150}] = createBonusCondition(11, {
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 200},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 200},
			{param = CONDITION_PARAM_SPEED, value = 5}
		}
	),
	--Pirate
	[{151, 155}] = createBonusCondition(12, {
			{param = CONDITION_PARAM_SKILL_CLUB, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100},
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTS, value = 25}
		}
	),
	--Assassin
	[{152, 156}] = createBonusCondition(13, {
			{param = CONDITION_PARAM_SPEED, value = 50},
			{param = CONDITION_PARAM_SKILL_DISTANCE, value = 5},
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5}
		}
	),
	--Beggar
	[{153, 157}] = createBonusCondition(14, {
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 200},
			{param = CONDITION_PARAM_SPEED, value = 100},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5}
		}
	),
	--Shaman
	[{154, 158}] = createBonusCondition(15, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_SPEED, value = 10},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 50}
		}
	),
	--Norseman
	[{251, 252}] = createBonusCondition(16, {
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 200},
			{param = CONDITION_PARAM_SKILL_FISHING, value = 10}
		}
	),
	--Nightmare
	[{268, 269}] = createBonusCondition(17, {
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5},
			{param = CONDITION_PARAM_SKILL_AXE, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100}
		}
	),
	--Jester
	[{273, 270}] = createBonusCondition(18, {
			{param = CONDITION_PARAM_SPEED, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100},
			{param = CONDITION_PARAM_SKILL_FISHING, value = 10}
		}
	),
	--Brotherhood
	[{278, 279}] = createBonusCondition(19, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_SPEED, value = 50},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 10}
		}
	),
	--Demon Hunter
	[{289, 288}] = createBonusCondition(20, {
			{param = CONDITION_PARAM_SPEED, value = 10},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 200},
			{param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, value = 120}
		}
	),
	--Yalahari
	[{324, 325}] = createBonusCondition(21, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_SPEED, value = 5},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, value = 120}
		}
	),
	--Warmaster
	[{335, 336}] = createBonusCondition(22, {
			{param = CONDITION_PARAM_STAT_MAGICPOINTS, value = 5},
			{param = CONDITION_PARAM_SPEED, value = 15},
			{param = CONDITION_PARAM_STAT_MAXHITPOINTS, value = 100}
		}
	),
	--Wayfarer
	[{367, 366}] = createBonusCondition(23, {
			{param = CONDITION_PARAM_SPEED, value = 10},
			{param = CONDITION_PARAM_SKILL_SHIELD, value = 5},
			{param = CONDITION_PARAM_SKILL_SWORD, value = 5}

		}
	),
}

function getBonusCondition(outfit)
	for outfits, bonus in pairs(outfitBonuses) do
		if table.contains(outfits, outfit) then
			return bonus
		end
	end
	return nil
end

function Creature:onChangeOutfit(outfit)
	if not self:isPlayer() then
		return true
	end
	
	local oldOutfit = self:getOutfit()
	
	if oldOutfit.lookType == outfit.lookType then
		return true
	end
	
	if outfit.lookType == 267 then
        return true
    end
	
	local previousBonusCondition = getBonusCondition(self:getOutfit().lookType)
	local newBonusCondition = getBonusCondition(outfit.lookType)
	
	local hp, mp = nil, nil
	hp = self:getHealth()
	mp = self:getMana()
	
	if previousBonusCondition then
			hp = self:getHealth()
			mp = self:getMana()
		self:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_DEFAULT, previousBonusCondition:getSubId())
	end
	
	if newBonusCondition then
			self:addCondition(newBonusCondition)
		if oldOutfit.lookType ~= 267 then	
		if self:getMaxHealth() <= hp then
			self:addHealth(hp)
		end
		if self:getMaxMana() <= mp then
			self:addMana(mp)
		end
		end
		if oldOutfit.lookType == 267 then
			self:addCondition(newBonusCondition)
			self:addHealth(hp)
			self:addMana(mp)
			return true
		end
	end
	
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
return RETURNVALUE_NOERROR
end

function Creature:onTargetCombat(target)
return RETURNVALUE_NOERROR
end
