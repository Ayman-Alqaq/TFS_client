function spellCallback(cid, position, count)
	if Creature(cid) then
		if count > 0 or math.random(0, 1) == 1 then
			position:sendMagicEffect(CONST_ME_FIREATTACK)
			doAreaCombatHealth(cid, COMBAT_FIREDAMAGE, position, 0, -250, -250, CONST_ME_BLACKSMOKE)
			position:sendMagicEffect(CONST_ME_DRAWBLOOD)
		end

		if count < 5 then
			count = count + 1
			addEvent(spellCallback, math.random(1000, 4000), cid, position, count)
		end
	end
end

function onTargetTile(creature, position)
	spellCallback(creature:getId(), position, 0)
end

local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
