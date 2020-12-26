-- cfg
local togglestorage = 2557 -- must be the same as in talkaction
local dualWielding = false -- if two weapons are equipped, works with fist fighting also if both hands are empty

-- normal attack values: 2000, 1, 1
local speedMelee = 2000
local dmgMelee = 1
local dmgMeleeAmount = 1

local speedDist = 2000
local dmgDist = 1
local dmgDistAmount = 1

local speedMagic = 2000
local dmgMagic = 1
local dmgMagicAmount = 1
-- end of cfg

function Player:getBaseVoc()
	if self:getVocation():getDemotion() then
		return self:getVocation():getDemotion():getId()
	end
	return self:getVocation():getId()
end

local wandElement = {
	["earth"] = COMBAT_EARTHDAMAGE,
	["ice"] = COMBAT_ICEDAMAGE,
	["energy"] = COMBAT_ENERGYDAMAGE,
	["fire"] = COMBAT_FIREDAMAGE,
	["death"] = COMBAT_DEATHDAMAGE,
	["holy"] = COMBAT_HOLYDAMAGE,
	["physical"] = COMBAT_PHYSICALDAMAGE,
	["poison"] = COMBAT_LIFEDRAIN
}

local shootTypes = {
	["spear"] = CONST_ANI_SPEAR,
	["bolt"] = CONST_ANI_BOLT,
	["arrow"] = CONST_ANI_ARROW,
	["fire"] = CONST_ANI_FIRE,
	["energy"] = CONST_ANI_ENERGY,
	["poisonarrow"] = CONST_ANI_POISONARROW,
	["burstarrow"] = CONST_ANI_BURSTARROW,
	["throwingstar"] = CONST_ANI_THROWINGSTAR,
	["throwingknife"] = CONST_ANI_THROWINGKNIFE,
	["smallstone"] = CONST_ANI_SMALLSTONE,
	["death"] = CONST_ANI_DEATH,
	["largerock"] = CONST_ANI_LARGEROCK,
	["snowball"] = CONST_ANI_SNOWBALL,
	["powerbolt"] = CONST_ANI_POWERBOLT,
	["poison"] = CONST_ANI_POISON,
	["infernalbolt"] = CONST_ANI_INFERNALBOLT,
	["huntingspear"] = CONST_ANI_HUNTINGSPEAR,
	["enchantedspear"] = CONST_ANI_ENCHANTEDSPEAR,
	["redstar"] = CONST_ANI_REDSTAR,
	["greenstar"] = CONST_ANI_GREENSTAR,
	["royalspear"] = CONST_ANI_ROYALSPEAR,
	["sniperarrow"] = CONST_ANI_SNIPERARROW,
	["onyxarrow"] = CONST_ANI_ONYXARROW,
	["piercingbolt"] = CONST_ANI_PIERCINGBOLT,
	["whirlwindsword"] = CONST_ANI_WHIRLWINDSWORD,
	["whirlwindaxe"] = CONST_ANI_WHIRLWINDAXE,
	["whirlwindclub"] = CONST_ANI_WHIRLWINDCLUB,
	["etherealspear"] = CONST_ANI_ETHEREALSPEAR,
	["ice"] = CONST_ANI_ICE,
	["earth"] = CONST_ANI_EARTH,
	["holy"] = CONST_ANI_HOLY,
	["suddendeath"] = CONST_ANI_SUDDENDEATH,
	["flasharrow"] = CONST_ANI_FLASHARROW,
	["flammingarrow"] = CONST_ANI_FLAMMINGARROW,
	["shiverarrow"] = CONST_ANI_SHIVERARROW,
	["energyball"] = CONST_ANI_ENERGYBALL,
	["smallice"] = CONST_ANI_SMALLICE,
	["smallholy"] = CONST_ANI_SMALLHOLY,
	["smallearth"] = CONST_ANI_SMALLEARTH,
	["eartharrow"] = CONST_ANI_EARTHARROW,
	["explosion"] = CONST_ANI_EXPLOSION,
	["cake"] = CONST_ANI_CAKE,
	["tarsalarrow"] = CONST_ANI_TARSALARROW,
	["vortexbolt"] = CONST_ANI_VORTEXBOLT,
	["prismaticbolt"] = CONST_ANI_PRISMATICBOLT,
	["crystallinearrow"] = CONST_ANI_CRYSTALLINEARROW,
	["drillbolt"] = CONST_ANI_DRILLBOLT,
	["envenomedarrow"] = CONST_ANI_ENVENOMEDARROW,
	["gloothspear"] = CONST_ANI_GLOOTHSPEAR,
	["simplearrow"] = CONST_ANI_SIMPLEARROW,
}

local meleeweapons = {WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}
local wp_skillType = {
	[WEAPON_SWORD] = SKILL_SWORD,
	[WEAPON_CLUB] = SKILL_CLUB,
	[WEAPON_AXE] = SKILL_AXE
}

-- get shootType, executed on server startup and reload
local wp_shooteffects = {}
local wp_ammotype = {}
local wp_hitChance = {}

function registerShootEffectsFromItems()
	local file = 'data/items/items.xml'
	local itemId = 0
	for line in io.lines(file) do
		for mi,id,mid,name in line:gmatch('<(%a-)%s*id%s*=%s*"(%d+)"%s*(.-)%s*name%s*=%s*"(.-)"') do
			if mi == 'item' then
				itemId = tonumber(id)
			end
		end

		for key,value in line:gmatch('<attribute key="(.-)" value="(.-)"') do
			if key == "shootType" then
				wp_shooteffects[itemId] = value
			end
			
			if key == "ammoType" then
				wp_ammotype[itemId] = (value == "bolt" and 1 or 2)
			end
			
			if key == "maxHitChance" then
				wp_hitChance[itemId] = value
			end
		end
	end

	return true
end
registerShootEffectsFromItems()

local wp_otherInfo = {}
local wp_vocInfo = {}
function registerWeapons()
	local file = 'data/weapons/weapons.xml'
	local lastId = 0
	
	for line in io.lines(file) do
		for wp,id,mid,typ in line:gmatch('<(%a-)%s*id%s*=%s*"(%d+)"%s*(.-)%s*type%s*=%s*"(.-)"') do
			lastId = tonumber(id)
			if wp == 'wand' then
				for lv, mana, minv, maxv in mid:gmatch('"(%d+)".-"(%d+)".-"(%d+)".-"(%d+)"') do
					wp_otherInfo[lastId] = {element = wandElement[typ], level = tonumber(lv), mana = tonumber(mana), min = tonumber(minv), max = tonumber(maxv)}
				end
			end
		end
		
		for wp,id in line:gmatch('<(%a-)%s*id%s*=%s*"(%d+)"') do
			lastId = tonumber(id)
			if wp == 'melee' then
				if line:match('action%s*=%s*"removecharge"') then
					wp_otherInfo[lastId] = {removecharges = true}
				end
			elseif wp == 'distance' then
				if line:match('action%s*=%s*"removecount"') then
					wp_otherInfo[lastId] = {breakchance = 100}
				else
					for brkc in line:gmatch('breakchance%s*=%s*"(%d+)"') do
						wp_otherInfo[lastId] = {breakchance = tonumber(brkc)}
					end
				end
			end
		end
		
		if not wp_vocInfo[lastId] then
			wp_vocInfo[lastId] = {}
		end
		
		for voc in line:gmatch('<vocation%s*name%s*=%s*"(.-)"') do
			table.insert(wp_vocInfo[lastId], Vocation(voc):getId())
		end
	end
	return true
end
registerWeapons()

local dist_wps = {5, 6}
function Player:getShootRange(slot)
	local slotItem = player:getSlotItem(slot)
	if not slotItem then
		return 1
	end
	
	local slotwp = slotItem:getType():getWeaponType()
	if isInArray(dist_wps, slotwp) then
		local range = slotItem:getAttribute(ITEM_ATTRIBUTE_SHOOTRANGE)
		if range == 0 then
			return slotItem:getType():getShootRange()
		end
		return range
	end
	
	return 1
end

function Creature:getMonsterEfficiently(range)
	local spectators = Game.getSpectators(self:getPosition(), false, false, 0, range, 0, range)
	local targets = {}
	for i = 1, #spectators do
		if spectators[i]:isMonster() then
			if self:getPosition():isSightClear(spectators[i]:getPosition()) then
				table.insert(targets, spectators[i])
			end
		end
	end
	
	local mostAttractive = 0
	local bestTargets = {}
	for i = 1, #targets do
		local current = targets[i]
		local hp = math.floor((current:getHealth() * 100) / current:getMaxHealth())
		local points = 0
		if hp < 95 then
			points = 3
		elseif hp < 85 then
			points = 5
		elseif hp < 70 then
			points = 7
		elseif hp < 50 then
			points = 15
		elseif hp < 30 then
			points = 20
		elseif hp < 15 then
			points = 25
		elseif hp < 7 then
			points = 30
		end
		local extraPoints = 10 - current:getPosition():getDistance(self:getPosition())
		local totalPTS = points + extraPoints
		if totalPTS > mostAttractive then
			mostAttractive = totalPTS
			bestTargets = {}
			table.insert(bestTargets, current)
		elseif totalPTS == mostAttractive then
			table.insert(bestTargets, current)
		end
	end
	
	local lowest = -1
	local maintarget = 1
	for i = 1, #bestTargets do
		if lowest == -1 then
			lowest = bestTargets[i]:getHealth()
		else
			if bestTargets[i]:getHealth() < lowest then
				lowest = bestTargets[i]:getHealth()
				maintarget = i
			end
		end
	end
	return bestTargets[maintarget]
end

local hand_wps = {WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE, WEAPON_DISTANCE, WEAPON_WAND}
function ItemType:isHandHeldWeapon()
	return isInArray(hand_wps, self:getWeaponType())
end

-- should be parsed from vocations.xml on startup
-- I'm too tired of writing parsers tho
local atkFac = {
	[0] = {melee=1.0, dist=1.0},
	[1] = {melee=1.0, dist=1.0},
	[2] = {melee=1.0, dist=1.0},
	[3] = {melee=1.0, dist=1.0},
	[4] = {melee=1.0, dist=1.0},
	-- probably not in use
	[5] = {melee=1.0, dist=1.0},
	[6] = {melee=1.0, dist=1.0},
	[7] = {melee=1.0, dist=1.0},
	[8] = {melee=1.0, dist=1.0}
}

function getMaxWeaponDamage(level, attackSkill, attackValue, attackFactor)
	return math.ceil((2 * (attackValue * (attackSkill + 5.8) / 25 + (level - 1) / 10)) / attackFactor)
end

function canShootTo(pos, pos2, range)
	return pos:getDistance(pos2) <= range and pos:isSightClear(pos2)
end

function missShoot(pos)
	local npos = Position(pos.x + math.random(-1, 1), pos.y + math.random(-1, 1), pos.z + math.random(-1, 1))
	
	local tile = Tile(npos)
	if not tile then
		return pos
	end
	
	if tile:hasFlag(TILESTATE_PROTECTIONZONE) or not pos:isSightClear(npos) then
		return pos
	end
	
	if not tile:hasFlag(TILESTATE_BLOCKSOLID) then
		return npos
	end
	
	return pos
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setFormula(COMBAT_FORMULA_SKILL, 1 * dmgDist, 0, 1 * dmgDist, 0)

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(10, 2000, -1)
combat:setCondition(condition)

function autoShoot(cid, target, type, min, max, effect, shootType, range, origin, maxHitChance, secondaryType, secondaryMin, secondaryMax)
	local p = Player(cid)
	local m = Monster(target)
	if not range then
		range = 1
	end
	
	local burst = false
	local poison = false
	local extraDmg = false
	if secondaryType then
		if secondaryType == -1 then
			burst = true
		elseif secondaryType == -2 then
			poison = true
		else
			extraDmg = true
		end
	end
	
	local miss = false
	if origin then
		if origin == ORIGIN_RANGED and maxHitChance then
			if maxHitChance < 1 then
				miss = true
			else
				if maxHitChance < math.random(1, 100) then
					miss = true
				end
			end
		end
	end

	if p then
		local ppos = p:getPosition()
		if Tile(ppos):hasFlag(TILESTATE_PROTECTIONZONE) then
			return true
		end
		
		if m then
			local npos = m:getPosition()
			if canShootTo(ppos, npos, range) then
				if miss then
					npos = missShoot(npos)
					ppos:sendDistanceEffect(npos, shootType)
				else
					if shootType then
						ppos:sendDistanceEffect(npos, shootType)
					end
					
					if not burst then
						doTargetCombatHealth(cid, target, type, min, max, effect, origin)
						if extraDmg then
							doTargetCombatHealth(cid, target, secondaryType, secondaryMin, secondaryMax, effect, origin)
						end
					end
				end
				
				if poison then
					local var = Variant(m:getId())
					combat:execute(p, var)
				end
				
				if burst then
					for x = -1, 1 do
					for y = -1, 1 do
						local bPos = Position(npos.x + x, npos.y + y, npos.z)
						local bTile = Tile(bPos)
						if bTile then
							local bM = bTile:getCreatures()
							if bM then
								for i = 1, #bM do
									if bM[i]:isMonster() then
										doTargetCombatHealth(cid, bM[i]:getId(), type, min, max, effect, origin)
									end
								end
							end
							
							if not bTile:hasFlag(TILESTATE_BLOCKSOLID) then
								bPos:sendMagicEffect(CONST_ME_FIREAREA)
							end
						end
					end
					end
				end
			else
				m = Monster(p:getMonsterEfficiently(range))
				if m then
					npos = m:getPosition()
					if canShootTo(ppos, npos, range) then
						if miss then
							npos = missShoot(npos)
							ppos:sendDistanceEffect(npos, shootType)
						else
							if shootType then
								ppos:sendDistanceEffect(npos, shootType)
							end
							
							if not burst then
								doTargetCombatHealth(cid, m:getId(), type, min, max, effect, origin)
								if extraDmg then
									doTargetCombatHealth(cid, m:getId(), secondaryType, secondaryMin, secondaryMax, effect, origin)
								end
							end
						end
						
						if poison then
							local var = Variant(m:getId())
							combat:execute(p, var)
						end
				
						if burst then
							for x = -1, 1 do
							for y = -1, 1 do
								local bPos = Position(npos.x + x, npos.y + y, npos.z)
								local bTile = Tile(bPos)
								if bTile then
									local bM = bTile:getCreatures()
									if bM then
										for i = 1, #bM do
											if bM[i]:isMonster() then
												doTargetCombatHealth(cid, bM[i]:getId(), type, min, max, effect, origin)
											end
										end
									end
									
									if not bTile:hasFlag(TILESTATE_BLOCKSOLID) then
										bPos:sendMagicEffect(CONST_ME_FIREAREA)
									end
								end
							end
							end
						end
					end
				end
			end
		else
			m = Monster(p:getMonsterEfficiently(range))
			if m then
				local npos = m:getPosition()
				if canShootTo(ppos, npos, range) then
					if miss then
						npos = missShoot(npos)
						ppos:sendDistanceEffect(npos, shootType)
					else
						if shootType then
							ppos:sendDistanceEffect(npos, shootType)
						end
						
						if not burst then
							doTargetCombatHealth(cid, m:getId(), type, min, max, effect, origin)
							if extraDmg then
								doTargetCombatHealth(cid, m:getId(), secondaryType, secondaryMin, secondaryMax, effect, origin)
							end
						end
					end

					if poison then
						local var = Variant(m:getId())
						combat:execute(p, var)
					end
						
					if burst then
						for x = -1, 1 do
						for y = -1, 1 do
							local bPos = Position(npos.x + x, npos.y + y, npos.z)
							local bTile = Tile(bPos)
							if bTile then
								local bM = bTile:getCreatures()
								if bM then
									for i = 1, #bM do
										if bM[i]:isMonster() then
											doTargetCombatHealth(cid, bM[i]:getId(), type, min, max, effect, origin)
										end
									end
								end
								
								if not bTile:hasFlag(TILESTATE_BLOCKSOLID) then
									bPos:sendMagicEffect(CONST_ME_FIREAREA)
								end
							end
						end
						end
					end
				end
			end
		end
	end
end

function Player:autoAttack(slot)
	local range = 1
	local slotType = -1
	local slotItem = 0
	
	if slot ~= -1 then
		slotItem = self:getSlotItem(slot)
		if slotItem then
			slotType = slotItem:getType():getWeaponType()
			if slotType == WEAPON_DISTANCE or slotType == WEAPON_WAND then
				local attrRange = slotItem:getAttribute(ITEM_ATTRIBUTE_SHOOTRANGE)
				local itemRange = slotItem:getType():getShootRange()
				range = attrRange > 0 and attrRange or itemRange
			end
		end
	end
	
	local target = self:getMonsterEfficiently(range)
	if not target then
		return true
	end
	
	if slot == -1 then
		local tid = target:getId()
		local cid = self:getId()
		if self:getPosition():isSightClear(target:getPosition()) then
			for i = 1, dmgMeleeAmount do
				addEvent(autoShoot, i * speedMelee, cid, tid, COMBAT_PHYSICALDAMAGE, -1, math.floor(-getMaxWeaponDamage(self:getLevel(), self:getEffectiveSkillLevel(SKILL_FIST), 7, atkFac[self:getBaseVoc()].melee) * dmgMelee), nil, nil, range, ORIGIN_MELEE)
			end
			self:addSkillTries(SKILL_FIST, 1)
		end
		return true
	end

	local itid = slotItem:getId()
	if slotType == WEAPON_WAND then
		local wand = wp_otherInfo[itid]
		
		if wp_vocInfo[itid] then
			if not isInArray(wp_vocInfo[itid], self:getBaseVoc()) then
				return true
			end
		end
		
		if not wand.level then
			if self:getLevel() < 100 then
			return true
			end
		end
		
		if wand.level then
			if self:getLevel() < wand.level then
				return true
			end
		end
		
		if self:getPosition():isSightClear(target:getPosition()) then
			if wand.mana then
				if self:getMana() < wand.mana then
					return true
				end
				
				self:addMana(-wand.mana)
				self:addManaSpent(wand.mana)
			end
			
			local tid = target:getId()
			local cid = self:getId()

			for i = 1, dmgMagicAmount do
				addEvent(autoShoot, i * speedMagic, cid, tid, wand.element, math.floor(-wand.min * dmgMagic), math.floor(-wand.max * dmgMagic), nil, shootTypes[wp_shooteffects[itid]], range)
			end
		end
		return true
	end
	
	if slotType == WEAPON_DISTANCE then
		if not self:getPosition():isSightClear(target:getPosition()) then
			return true
		end

		if wp_vocInfo[itid] then
			if #wp_vocInfo[itid] > 0 then
				if not isInArray(wp_vocInfo[itid], self:getBaseVoc()) then
					return true
				end
			end
		end
		
		local level = self:getLevel()
		local skill = self:getEffectiveSkillLevel(SKILL_DISTANCE)
		
		-- bows and crossbows
		if wp_ammotype[itid] then
			local ammo = self:getSlotItem(CONST_SLOT_AMMO)
			if not ammo then
				return true
			end
			
			if ammo:getType():getWeaponType() ~= WEAPON_AMMO then
				return true
			end
			
			local ammotype = 0
			if ammo:getName():match("bolt") then
				ammotype = 1
			elseif ammo:getName():match("arrow") then
				ammotype = 2
			end
			
			if wp_ammotype[itid] ~= ammotype then
				return true
			end

			local ammoAtk = ammo:getAttribute(ITEM_ATTRIBUTE_ATTACK)
			if ammoAtk == 0 then
				ammoAtk = ammo:getType():getAttack()
			end
			
			local wpAtk = slotItem:getAttribute(ITEM_ATTRIBUTE_ATTACK)
			if wpAtk == 0 then
				wpAtk = slotItem:getType():getAttack()
			end
			
			local atk = (wpAtk or 0) + (ammoAtk or 0)
			local secondaryType = ammo:getType():getElementType()
			local secondaryAtk = ammo:getType():getElementDamage()
			
			if secondaryType then
				secondaryAtk = secondaryAtk + (wpAtk or 0)
			end
			
			local maxDmg = getMaxWeaponDamage(level, skill, atk, atkFac[self:getBaseVoc()].dist) * dmgDist
			local secondaryMaxDmg = 0
			if secondaryType then
				secondaryMaxDmg = getMaxWeaponDamage(level, skill, secondaryAtk, atkFac[self:getBaseVoc()].dist) * dmgDist
			end
			
			if level < slotItem:getType():getRequiredLevel() then
				maxDmg = maxDmg * 0.5
				if secondaryType then
					secondaryMaxDmg = secondaryMaxDmg * 0.5
				end
			end
			
			if level < ammo:getType():getRequiredLevel() then
				maxDmg = maxDmg * 0.5
				if secondaryType then
					secondaryMaxDmg = secondaryMaxDmg * 0.5
				end
			end
			
			maxDmg = math.ceil(maxDmg)
			if secondaryType then
				secondaryMaxDmg = math.ceil(secondaryMaxDmg)
			end
			
			local minDmg = math.ceil(maxDmg * 0.3)
			local secondaryMinDmg = 0
			
			if secondaryType then
				secondaryMinDmg = math.ceil(secondaryMaxDmg * 0.3)
			end
			
			local hitChance = ammo:getAttribute(ITEM_ATTRIBUTE_HITCHANCE)
			if hitChance == 0 then
				hitChance = (wp_hitChance[ammo:getId()] or 90)
			end
			
			local distance = self:getPosition():getDistance(target:getPosition())
			hitChance = math.ceil(math.min((range/distance) * ((hitChance/100) * skill), hitChance))
			local wpHitChance = slotItem:getAttribute(ITEM_ATTRIBUTE_HITCHANCE)
			if wpHitChance == 0 then
				wpHitChance = slotItem:getType():getHitChance()
			end
			
			hitChance = hitChance + (wpHitChance or 0)
			local tid = target:getId()
			local cid = self:getId()
			
			-- burst and poison arrows
			if ammo:getId() == 2546 then
				secondaryType = -1
			elseif ammo:getId() == 2545 then
				secondaryType = -2
			end
			
			for i = 1, dmgDistAmount do
				addEvent(autoShoot, i * speedDist, cid, tid, COMBAT_PHYSICALDAMAGE, math.floor(-minDmg * dmgDist), math.floor(-maxDmg * dmgDist), nil, shootTypes[wp_shooteffects[ammo:getId()]], range, ORIGIN_RANGED, hitChance, secondaryType, math.floor(-secondaryMinDmg * dmgDist), math.floor(-secondaryMaxDmg * dmgDist))
			end
			
			local breakChance = wp_otherInfo[ammo:getId()]
			if breakChance then
				if math.random(1, 100) <= breakChance.breakchance then
					ammo:remove(1)
				end
			else
				ammo:remove(1)
			end
			
			self:addSkillTries(SKILL_DISTANCE, 1)
			return true
		end
		
		-- spears, knives and stars
		local hitChance = slotItem:getAttribute(ITEM_ATTRIBUTE_HITCHANCE)
		if hitChance == 0 then
			hitChance = (wp_hitChance[itid] or 75)
		end
		
		local distance = self:getPosition():getDistance(target:getPosition())
		hitChance = math.ceil(math.min((range/distance) * ((hitChance/100) * skill), hitChance))
		
		local wpAtk = slotItem:getAttribute(ITEM_ATTRIBUTE_ATTACK)
		if wpAtk == 0 then
			wpAtk = slotItem:getType():getAttack()
		end
		
		local atk = (wpAtk or 0)
		local secondaryType = slotItem:getType():getElementType()
		local secondaryAtk = slotItem:getType():getElementDamage()
		
		local maxDmg = getMaxWeaponDamage(level, skill, atk, atkFac[self:getBaseVoc()].dist) * dmgDist
		local secondaryMaxDmg = 0
		if secondaryType then
			secondaryMaxDmg = getMaxWeaponDamage(level, skill, secondaryAtk, atkFac[self:getBaseVoc()].dist) * dmgDist
		end
		
		if level < slotItem:getType():getRequiredLevel() then
			maxDmg = maxDmg * 0.5
			if secondaryType then
				secondaryMaxDmg = secondaryMaxDmg * 0.5
			end
		end
		
		maxDmg = math.ceil(maxDmg)
		if secondaryType then
			secondaryMaxDmg = math.ceil(secondaryMaxDmg)
		end
		
		local minDmg = math.ceil(maxDmg * 0.3)
		local secondaryMinDmg = 0
		
		if secondaryType then
			secondaryMinDmg = math.ceil(secondaryMaxDmg * 0.3)
		end
		
		-- viper star
		if itid == 7366 then
			secondaryType = -2
		end
		
		local tid = target:getId()
		local cid = self:getId()
			
		for i = 1, dmgDistAmount do
			addEvent(autoShoot, i * speedDist, cid, tid, COMBAT_PHYSICALDAMAGE, math.floor(-minDmg * dmgDist), math.floor(-maxDmg * dmgDist), nil, shootTypes[wp_shooteffects[slotItem:getId()]], range, ORIGIN_RANGED, hitChance, secondaryType, math.floor(-secondaryMinDmg * dmgDist), math.floor(-secondaryMaxDmg * dmgDist))
		end
		
		local breakChance = wp_otherInfo[itid]	
		if breakChance then
			if math.random(1, 100) <= breakChance.breakchance then
				slotItem:remove(1)
			end
		else
			slotItem:remove(1)
		end
		
		self:addSkillTries(SKILL_DISTANCE, 1)
		return true
	end
	
	if isInArray(meleeweapons, slotType) then
		local wpSkill = wp_skillType[slotType]
		local level = self:getLevel()
		local skill = self:getEffectiveSkillLevel(wpSkill)
		
		if wp_vocInfo[itid] then
			if #wp_vocInfo[itid] > 0 then
				if not isInArray(wp_vocInfo[itid], self:getBaseVoc()) then
					return true
				end
			end
		end
		
		local wpAtk = slotItem:getAttribute(ITEM_ATTRIBUTE_ATTACK)
		if wpAtk == 0 then
			wpAtk = slotItem:getType():getAttack()
		end
		
		local atk = (wpAtk or 0)
		local secondaryType = slotItem:getType():getElementType()
		local secondaryAtk = slotItem:getType():getElementDamage()
		
		local maxDmg = getMaxWeaponDamage(level, skill, atk, atkFac[self:getBaseVoc()].melee) * dmgMelee
		local secondaryMaxDmg = 0
		if secondaryType then
			secondaryMaxDmg = getMaxWeaponDamage(level, skill, secondaryAtk, atkFac[self:getBaseVoc()].melee) * dmgMelee
		end
		
		if level < slotItem:getType():getRequiredLevel() then
			maxDmg = maxDmg * 0.5
			if secondaryType then
				secondaryMaxDmg = secondaryMaxDmg * 0.5
			end
		end
		
		maxDmg = math.ceil(maxDmg)
		if secondaryType then
			secondaryMaxDmg = math.ceil(secondaryMaxDmg)
		end
		
		local minDmg = math.ceil(maxDmg * 0.3)
		local secondaryMinDmg = 0
		
		if secondaryType then
			secondaryMinDmg = math.ceil(secondaryMaxDmg * 0.3)
		end
		
		local tid = target:getId()
		local cid = self:getId()
		
		for i = 1, dmgMeleeAmount do
			addEvent(autoShoot, i * speedMelee, cid, tid, COMBAT_PHYSICALDAMAGE, math.floor(-minDmg * dmgMelee), math.floor(-maxDmg * dmgMelee), nil, shootTypes[wp_shooteffects[slotItem:getId()]], range, ORIGIN_MELEE, hitChance, secondaryType, math.floor(-secondaryMinDmg * dmgMelee), math.floor(-secondaryMaxDmg * dmgMelee))
		end
		
		local charges = slotItem:getCharges()
		if charges > 0 then
			if charges == 1 then
				local broken = slotItem:getType():getDecayId()
				if broken == -1 then
					slotItem:remove()
				else
					slotItem:transform(broken)
					slotItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, 0)
				end
			else
				slotItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, charges - 1)
			end
		end
		
		self:addSkillTries(skill, 1)
		return true
	end
	return true
end

local slotA = 6 -- wp
local slotB = 5 -- shield

function autoAttackCheck(cid)
	local player = Player(cid)
	if not player then
		return true
	end

	addEvent(autoAttackCheck, 2000, cid)
	if player:getStorageValue(togglestorage) == 1 then
		if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
			if not player:getTarget() then
				local itemA = player:getSlotItem(slotA)
				local itemB = player:getSlotItem(slotB)
				
				local equippedWeapons = 0
				if itemA then
					if itemA:getType():isHandHeldWeapon() then
						equippedWeapons = equippedWeapons + 1
					end
				end
				
				if itemB then
					if itemB:getType():isHandHeldWeapon() then
						equippedWeapons = equippedWeapons + 1
					end
				end
				
				if equippedWeapons == 0 then
					player:autoAttack(-1)
					if dualWielding then
						player:autoAttack(-1)
					end
					return true
				end
				
				if equippedWeapons == 1 or not dualWielding then
					if itemA then
						if itemA:getType():isHandHeldWeapon() then
							player:autoAttack(slotA)
							return true
						end
					end
					
					player:autoAttack(slotB)
					return true
				end

				player:autoAttack(slotA)
				player:autoAttack(slotB)
				return true			
			end
		end
	end
end

function onLogin(player)
	local cid = player:getId() -- required for compability with timers
	addEvent(autoAttackCheck, 2000, cid)
	return true
end