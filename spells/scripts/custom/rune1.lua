local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local skillTypes = {
	[WEAPON_AXE] = SKILL_AXE,
	[WEAPON_SWORD] = SKILL_SWORD,
	[WEAPON_CLUB] = SKILL_CLUB,
	[WEAPON_DISTANCE] = SKILL_DISTANCE
	--[WEAPON_NONE] = SKILL_FIST
}

function onTargetCreature(creature, target)
	local task = Creature(target)
	if not task then
		return false
	end
	
	local weapon = creature:getWeapon()
	if not weapon then
		return false
	end
	
	local level, maglevel = creature:getLevel(), creature:getMagicLevel()
	local skillType = skillTypes[weapon:getType():getWeaponType()]
	local skillLevel = creature:getSkillLevel(skillType)
	local attack = weapon:getType():getAttack()
	if not attack then
		attack = 65
	end
	
	local min = (level / 5) + (skillLevel * attack * 0.01) + (maglevel * 4) + 75
	local max = (level / 5) + (skillLevel * attack * 0.01) + (maglevel * 10) + 150
	
	doTargetCombatHealth(creature, target, COMBAT_HOLYDAMAGE, -min, -max, CONST_ME_NONE)
	creature:getPosition():sendDistanceEffect(target:getPosition(), CONST_ANI_SMALLHOLY)
	creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local shoots = 10

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