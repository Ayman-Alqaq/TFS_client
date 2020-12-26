local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onTargetCreature(creature, target)
    local level, maglevel = creature:getLevel(), creature:getMagicLevel()

	local min = (level / 5) + (maglevel * 4.3) + 32
	local max = (level / 5) + (maglevel * 7.4) + 48	

    doTargetCombatHealth(creature, target, COMBAT_DEATHDAMAGE, -min, -max, CONST_ME_NONE)
    creature:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_SUDDENDEATH)
	creature:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
    return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local shoots = 1

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