local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)
combat:setArea(createCombatArea(AREA_CROSS1X1))

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
