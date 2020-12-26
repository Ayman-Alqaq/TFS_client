local condition = Condition(CONDITION_DAZZLED)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(5, 3000, -25)
condition:addDamage(1, 5000, -666)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
combat:setFormula(COMBAT_FORMULA_LEVELMAGIC, -1.3, -30, -1.7, 0)
combat:setCondition(condition)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
