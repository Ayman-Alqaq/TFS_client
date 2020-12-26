local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

 local skillTypes = {
	[WEAPON_AXE] = SKILL_AXE,
	[WEAPON_SWORD] = SKILL_SWORD,
	[WEAPON_CLUB] = SKILL_CLUB
 }

function onTargetCreature(creature, target)
	local weapon = creature:getWeapon()
	if not weapon then
		 return false
	 end
    local level, maglevel = creature:getLevel(), creature:getMagicLevel()
	local skillType = skillTypes[weapon:getType():getWeaponType()]
	local skillLevel = creature:getSkillLevel(skillType)
	local attack = weapon:getType():getAttack()
	
	local min = 2 * ((level / 5) + (skillLevel * attack * 0.06) + (maglevel * 1.1 + 13))
	local max = 2 * ((level / 5) + (skillLevel * attack * 0.14) + (maglevel * 1.1 + 34))
	
    doTargetCombatHealth(creature, target, COMBAT_PHYSICALDAMAGE, -min, -max, CONST_ME_NONE)
    creature:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_THROWINGKNIFE)
	creature:getPosition():sendMagicEffect(CONST_ME_HITAREA)
    return true
end


combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local shoots = 5

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