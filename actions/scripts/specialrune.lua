local potions = {
	[2301] = {health = {125, 350}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 0}, -- Health Restoration Rune
	[2306] = {health = {425, 850}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 80, description = "Only players of level 80 or above may use this rune."}, -- Small Health Rune
	[2307] = {health = {1125, 1500}, vocations = {1, 2, 3, 4, 5, 6, 7, 8}, level = 220, description = "Only players of level 220 or above may use this rune."}, -- Health Rune
	
	[2269] = {mana = {75, 250}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 0}, -- Mana Restoration Rune
	[2275] = {mana = {350, 875}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 80, description = "Only players of level 80 or above may use this rune."}, -- Small Mana Rune
	[2270] = {mana = {1125, 1500}, vocations = {1, 2, 3, 4, 5, 6, 7, 8}, level = 220, description = "Only players of level 220 or above may use this rune."}, --Mana Rune
	
	[2296] = {health = {237, 425}, mana = {162, 350}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 0}, -- Spirit Restoration Rune
	[2297] = {health = {637, 1125}, mana = {612, 1125}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 120, description = "Only players of level 120 or above may use this rune."}, -- Small Spirit Rune
	[2298] = {health = {1312, 1725}, mana = {1312, 1175}, vocations = {0, 1, 2, 3, 4, 5, 6, 7, 8}, level = 300, description = "Only players of level 300 or above may use this rune."}, -- Spirit Rune

}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if type(target) == "userdata" and not target:isPlayer() then
		return false
	end

	local potion = potions[item:getId()]
	if potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getId()) then
		player:say(potion.description, TALKTYPE_MONSTER_SAY)
		return true
	end

	if potion.health or potion.mana then
		if potion.health then
			doTargetCombatHealth(0, target, COMBAT_HEALING, potion.health[1], potion.health[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2], CONST_ME_MAGIC_BLUE)
		end

		target:say("Feel the power...", TALKTYPE_MONSTER_SAY)
	end

	item:remove(1)
	return true
end