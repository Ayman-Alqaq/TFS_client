twdConfig = {
	loseHealth = 2, -- How much % should player lose, when the monster walk inside your base
	eventStartTime = 15, -- How long until the event starts, when player step in the teleport [seconds]
	startingCoins = 500, -- How much coins should the player start with!
	startNextWaveTime = 15, -- How long until next wave starts [seconds]
	resetEventTime = 30 -- How long until next player can enter, if someone already was in there [30 seconds] is recommended.
}

-- Write unused storage
playingGameStorage = 1000
coinStorage = 1001

-- Write unused global storage
waveLevelGlobalStorage = 100 -- Here write
totalMonsterCountGlobalStorage = 101
totalMonsterKillCountGlobalStorage = 102

-- Positions
eventRoomPosition = Position(32463, 32497, 7) -- Where should player get teleported in the event room?
eventCenterPosition = Position(32466, 32504, 7) -- Center of the event room
summonMonsterPosition = Position(32455, 32496, 7) -- Where should the monster be created?

turrets = {
-- allTurretsId = {129, 130, 268},
	-- [129] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
	-- combat = {
		-- [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {15, 30}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW},
		-- [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {40, 75}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW},
		-- [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {75, 105}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW}
		-- },
	-- cfg = {
		-- turretName = "Starter Turret",
		-- [1] = {buildPrice = 60, sellPrice = 30, upgradePrice = 120, rangeX = 3, rangeY = 3, colorId = 64, attackSpeed = 1000},
		-- [2] = {sellPrice = 60, upgradePrice = 180, rangeX = 4, rangeY = 4, colorId = 64, attackSpeed = 1000},
		-- [3] = {sellPrice = 120, upgradePrice = 240, rangeX = 6, rangeY = 6, colorId = 64, attackSpeed = 1000}
		-- }
	-- },
	-- [130] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
	-- combat = {
		-- [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {30, 60}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT},
		-- [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {80, 150}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT},
		-- [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {150, 210}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT}
		-- },
	-- cfg = {
		-- turretName = "Starter Turret",
		-- [1] = {buildPrice = 120, sellPrice = 30, upgradePrice = 180, rangeX = 3, rangeY = 3, colorId = 76, attackSpeed = 1000},
		-- [2] = {sellPrice = 60, upgradePrice = 240, rangeX = 4, rangeY = 4, colorId = 76, attackSpeed = 1000},
		-- [3] = {sellPrice = 120, upgradePrice = 300, rangeX = 6, rangeY = 6, colorId = 76, attackSpeed = 1000}
		-- }
	-- },
	-- [268] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
	-- combat = {
		-- [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {60, 120}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH},
		-- [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {160, 300}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH},
		-- [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {300, 420}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH}
		-- },
	-- cfg = {
		-- turretName = "Starter Turret",
		-- [1] = {buildPrice = 240, sellPrice = 30, upgradePrice = 360, rangeX = 3, rangeY = 3, colorId = 114, attackSpeed = 1000},
		-- [2] = {sellPrice = 60, upgradePrice = 480, rangeX = 4, rangeY = 4, colorId = 114, attackSpeed = 1000},
		-- [3] = {sellPrice = 120, upgradePrice = 600, rangeX = 6, rangeY = 6, colorId = 114, attackSpeed = 1000}
		-- }
	-- }

-- AttackTypes = target, aoe and targetAoe
-- When you create new turret, make sure to write it's looktype in the [allTurretsId]

allTurretsId = {134, 131, 137, 130},
	[134] = { -- Black Knight
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {15, 30}, magicEffect = CONST_ME_EXPLOSIONAREA, shootEffect = CONST_ANI_ARROW},
		[2] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {30, 60}, magicEffect = CONST_ME_EXPLOSIONAREA, shootEffect = CONST_ANI_ARROW},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {45, 90}, magicEffect = CONST_ME_EXPLOSIONAREA, shootEffect = CONST_ANI_ARROW}
		},
	cfg = {
		turretName = "Small Turret",
		[1] = {buildPrice = 60, sellPrice = 30, upgradePrice = 120, rangeX = 3, rangeY = 3, colorId = 68, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 180, rangeX = 4, rangeY = 4, colorId = 68, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 480, rangeX = 6, rangeY = 6, colorId = 68, attackSpeed = 1000}
		}
	},
	[131] = { -- Dwarf Soldier
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {30, 60}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT},
		[2] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {45, 90}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {60, 120}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT}
		},
	cfg = {
		turretName = "Strong Turret",
		[1] = {buildPrice = 120, sellPrice = 30, upgradePrice = 180, rangeX = 3, rangeY = 3, colorId = 64, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 240, rangeX = 4, rangeY = 4, colorId = 64, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 600, rangeX = 6, rangeY = 6, colorId = 64, attackSpeed = 1000}
		}
	},
	[137] = { -- Elf
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {45, 90}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW},
		[2] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {60, 120}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {75, 150}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW}
		},
	cfg = {
		turretName = "Great Turret",
		[1] = {buildPrice = 360, sellPrice = 30, upgradePrice = 240, rangeX = 3, rangeY = 3, colorId = 76, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 480, rangeX = 4, rangeY = 4, colorId = 76, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 720, rangeX = 6, rangeY = 6, colorId = 76, attackSpeed = 1000}
		}
	},
	[130] = { -- Wizard/Mage
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {60, 120}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH},
		[2] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {75, 150}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {90, 180}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH}
		},
	cfg = {
		turretName = "Ultimate Turret",
		[1] = {buildPrice = 480, sellPrice = 30, upgradePrice = 300, rangeX = 3, rangeY = 3, colorId = 114, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 720, rangeX = 4, rangeY = 4, colorId = 114, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 840, rangeX = 6, rangeY = 6, colorId = 114, attackSpeed = 1000}
		}
	}
}

monsters = {-- monsterName, "drop" coins, current Health + extraHealth, speed
	--Group 1
	["Orc"] = {
		coins = 10,
		extraHealth = 100,
		speed = 500
	},
	["Orc Spearman"] = {
		coins = 10,
		extraHealth = 150,
		speed = 500
	},
	["Orc Warrior"] = {
		coins = 10,
		extraHealth = 200,
		speed = 500
	},
	["Orc Berserker"] = {
		coins = 10,
		extraHealth = 250,
		speed = 500
	},
	["Orc Leader"] = {
		coins = 10,
		extraHealth = 300,
		speed = 500
	},
	["Orc Warlord"] = {
		coins = 10,
		extraHealth = 350,
		speed = 500
	},
	["Troll"] = {
		coins = 10,
		extraHealth = 200,
		speed = 1000
	},
	["Troll Legionnaire"] = {
		coins = 10,
		extraHealth = 300,
		speed = 1000
	},
	["Ferumbras"] = {
		coins = 120,
		extraHealth = 10000,
		speed = 2000
	},
	["Morgaroth"] = {
		coins = 0,
		extraHealth = 20000,
		speed = 2000
	}
}

waves = {
	maxWaveLevel = 12,
	--Group 1
	[1] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 200,
		monsters = {
			{name = "Orc", count = 10, interval = 10000}
		}
	},
	[2] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 200,
		monsters = {
			{name = "Orc", count = 5, interval = 10000},
			{name = "Orc Spearman", count = 10, interval = 10000}
		}
	},
	[3] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 200,
		monsters = {
			{name = "Orc", count = 5, interval = 10000},
			{name = "Orc Spearman", count = 5, interval = 10000},
			{name = "Orc Berserker", count = 10, interval = 10000},
			{name = "Orc Warrior", count = 10, interval = 10000}
		}
	},
	--Group 2
	[4] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 300,
		monsters = {
			{name = "Orc", count = 5, interval = 10000},
			{name = "Orc Spearman", count = 5, interval = 10000},
			{name = "Orc Berserker", count = 5, interval = 10000},
			{name = "Orc Warrior", count = 5, interval = 10000},
			{name = "Orc Leader", count = 10, interval = 10000}
		}
	},
	[5] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 400,
		monsters = {
			{name = "Orc", count = 5, interval = 10000},
			{name = "Orc Spearman", count = 5, interval = 10000},
			{name = "Orc Berserker", count = 5, interval = 10000},
			{name = "Orc Warrior", count = 5, interval = 10000},
			{name = "Orc Leader", count = 5, interval = 10000},
			{name = "Orc Warlord", count = 10, interval = 10000}
		}
	},
	[6] = {
		interval = 1000,
		goldBonus = 1000,
		expBonus = 3000,
		monsters = {
			{name = "Orc Warlord", count = 10, interval = 10000},
			{name = "Troll Legionnaire", count = 5, interval = 10000},
			{name = "Troll", count = 5, interval = 10000}

		}
	},
	--Group 3
	[7] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 3000,
		monsters = {
			{name = "Ferumbras", count = 1, interval = 10000}
		}
	},
	[8] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Orc", count = 5, interval = 10000},
			{name = "Orc Spearman", count = 5, interval = 10000},
			{name = "Orc Warrior", count = 5, interval = 10000}
		}
	},
	[9] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Orc Berserker", count = 5, interval = 10000},
			{name = "Orc Leader", count = 5, interval = 10000},
			{name = "Orc Warlord", count = 5, interval = 10000}
		}
	},
	[10] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 3000,
		monsters = {
			{name = "Troll", count = 5, interval = 10000},
			{name = "Troll Legionnaire", count = 5, interval = 10000}
		}
	},
	[11] = {
		interval = 1000,
		goldBonus = 500,
		expBonus = 3000,
		monsters = {
			{name = "Orc", count = 5, interval = 10000},
			{name = "Orc Spearman", count = 5, interval = 10000},
			{name = "Orc Berserker", count = 5, interval = 10000},
			{name = "Orc Warrior", count = 5, interval = 10000},
			{name = "Orc Leader", count = 2, interval = 10000},
			{name = "Orc Warlord", count = 2, interval = 10000},
			{name = "Troll", count = 5, interval = 10000},
			{name = "Troll Legionnaire", count = 5, interval = 10000}
		}
	},
	[12] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Morgaroth", count = 1, interval = 10000}
		}
	}
}