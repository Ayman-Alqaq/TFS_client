local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 5 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_SKILL_FIST, 5)
condition:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

function onCastSpell(creature, variant)
	return creature:addPartyCondition(combat, variant, condition, 60)
end
