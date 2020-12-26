local resists = { 
{120, COMBAT_FIREDAMAGE, 20},
{121, COMBAT_EARTHDAMAGE, 20},
{122, COMBAT_ENERGYDAMAGE, 20},
{123, COMBAT_DEATHDAMAGE, 20},
{124, COMBAT_ICEDAMAGE, 20},
{125, COMBAT_PHYSICALDAMAGE, 20},
{126, COMBAT_HEALING, -10},
} -- {subId, damageType, resistancePercent}

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