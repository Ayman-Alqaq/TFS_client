local DamageTypes = {
    [1] = {DamageType = COMBAT_HOLYDAMAGE, DamageEffect = CONST_ANI_HOLY},
    [2] = {DamageType = COMBAT_FIREDAMAGE, DamageEffect = CONST_ANI_FIRE},
    [3] = {DamageType = COMBAT_DEATHDAMAGE, DamageEffect = CONST_ANI_DEATH},
    [4] = {DamageType = COMBAT_POISONDAMAGE, DamageEffect = CONST_ANI_POISON},
    [5] = {DamageType = COMBAT_ENERGYDAMAGE, DamageEffect = CONST_ANI_ENERGY},
    [6] = {DamageType = COMBAT_EARTHDAMAGE, DamageEffect = CONST_ANI_EARTH},
    [7] = {DamageType = COMBAT_ICEDAMAGE, DamageEffect = CONST_ANI_ICE},
	[8] = {DamageType = COMBAT_PHYSICALDAMAGE, DamageEffect = CONST_ANI_EXPLOSION},
}

 local skillTypes = {
	[WEAPON_AXE] = SKILL_AXE,
	[WEAPON_SWORD] = SKILL_SWORD,
	[WEAPON_CLUB] = SKILL_CLUB
 }

function onGetFormulaValues(player, level, maglevel)
	local weapon = player:getWeapon()
	if not weapon then
		 return false
	 end
	local skillType = skillTypes[weapon:getType():getWeaponType()]
	local skillLevel = player:getSkillLevel(skillType)
	local attack = weapon:getType():getAttack()

		min = -(((level / 5) + (skillLevel * attack * 0.06) + (maglevel * 1.1 + 13))/2)
		max = -(((level / 5) + (skillLevel * attack * 0.14) + (maglevel * 1.1 + 34))/2)

    return min, max
end
 local area = createCombatArea({
	{3, 3, 3},
	{3, 3, 3},
	{3, 3, 3}
})
local combat = {}
for k, dam_Table in pairs(DamageTypes) do
	combat[k] = Combat()
	combat[k]:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
	combat[k]:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
	combat[k]:setParameter(COMBAT_PARAM_TYPE, dam_Table.DamageType)
	combat[k]:setParameter(COMBAT_PARAM_DISTANCEEFFECT, dam_Table.DamageEffect)	
	
	
	
	-- _G Is used to manually define 'onGetFormulaValues' in this loop in doesnt seem to be able to find the function. 
	_G['onGetFormulaValues' .. k] = onGetFormulaValues
	combat[k]:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues" .. k)
	combat[k]:setArea(area)
end
 
function onUseWeapon(player, var)
    local value = player:getStorageValue(10009)
    local combatUse = combat[value]
    if not combatUse then
        return true
    end
    return combatUse:execute(player, var)
end