local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onTargetCreature(creature, target)
    local level, maglevel = creature:getLevel(), creature:getMagicLevel()

	local min = (level / 5) + (maglevel * 8) + 50
	local max = (level / 5) + (maglevel * 12) + 75

    doTargetCombatHealth(creature, target, COMBAT_FIREDAMAGE, -min, -max, CONST_ME_NONE)
    creature:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_FIRE)
	creature:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
    return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local shoots = 3

local function spell(cid)
    local creature = Creature(cid)
    if not creature then
        return true
    end

    combat:execute(creature, Variant(creature:getPosition()))
    return true
end

function onCastSpell(creature, variant)
    for i = 1, shoots do
        addEvent(spell, i * 250, creature.uid)
    end
	return true
end