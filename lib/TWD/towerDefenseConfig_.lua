twdConfig = {
	loseHealth = 10, -- How much % should player lose, when the monster walk inside your base
	eventStartTime = 15, -- How long until the event starts, when player step in the teleport [seconds]
	startingCoins = 500, -- How much coins should the player start with!
	startNextWaveTime = 15, -- How long until next wave starts [seconds]
	resetEventTime = 10 -- How long until next player can enter, if someone already was in there [30 seconds] is recommended.
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
-- AttackTypes = target, aoe and targetAoe
-- When you create new turret, make sure to write it's looktype in the [allTurretsId]

allTurretsId = {129, 130, 268},
	[129] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {15, 30}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW},
		[2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {40, 75}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {75, 105}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_ARROW}
		},
	cfg = {
		turretName = "Starter Turret",
		[1] = {buildPrice = 60, sellPrice = 30, upgradePrice = 120, rangeX = 3, rangeY = 3, colorId = 64, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 180, rangeX = 4, rangeY = 4, colorId = 64, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 240, rangeX = 6, rangeY = 6, colorId = 64, attackSpeed = 1000}
		}
	},
	[130] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {30, 60}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT},
		[2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {80, 150}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {150, 210}, magicEffect = CONST_ME_ENERGYAREA, shootEffect = CONST_ANI_BOLT}
		},
	cfg = {
		turretName = "Starter Turret",
		[1] = {buildPrice = 120, sellPrice = 30, upgradePrice = 180, rangeX = 3, rangeY = 3, colorId = 76, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 240, rangeX = 4, rangeY = 4, colorId = 76, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 300, rangeX = 6, rangeY = 6, colorId = 76, attackSpeed = 1000}
		}
	},
	[268] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
	combat = {
		[1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {60, 120}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH},
		[2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {160, 300}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH},
		[3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {300, 420}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH}
		},
	cfg = {
		turretName = "Starter Turret",
		[1] = {buildPrice = 240, sellPrice = 30, upgradePrice = 360, rangeX = 3, rangeY = 3, colorId = 114, attackSpeed = 1000},
		[2] = {sellPrice = 60, upgradePrice = 480, rangeX = 4, rangeY = 4, colorId = 114, attackSpeed = 1000},
		[3] = {sellPrice = 120, upgradePrice = 600, rangeX = 6, rangeY = 6, colorId = 114, attackSpeed = 1000}
		}
	}
}

monsters = {-- monsterName, "drop" coins, current Health + extraHealth, speed
	--Group 1
	["Mutated Rat"] = {
		coins = 10,
		extraHealth = 0,
		speed = 100
	},
	["Werewolf"] = {
		coins = 20,
		extraHealth = 0,
		speed = 200
	},
	["Midnight Panther"] = {
		coins = 30,
		extraHealth = 0,
		speed = 300
	},
	--Group 2
	["Draptor"] = {
		coins = 30,
		extraHealth = 0,
		speed = 300
	},
	["Dragon"] = {
		coins = 30,
		extraHealth = 0,
		speed = 300
	},
	["Dragon Lord"] = {
		coins = 30,
		extraHealth = 0,
		speed = 300
	},
	["Undead Dragon"] = {
		coins = 30,
		extraHealth = 0,
		speed = 300
	},
	["Ghastly Dragon"] = {
		coins = 30,
		extraHealth = 0,
		speed = 300
	},	
	--Group 3
	["Grim Reaper"] = {
		coins = 60,
		extraHealth = 0,
		speed = 400
	},
	["Behemoth"] = {
		coins = 60,
		extraHealth = 0,
		speed = 300
	},
	
	["Demon"] = {
		coins = 60,
		extraHealth = 0,
		speed = 400
	},
	["Juggernaut"] = {
		coins = 60,
		extraHealth = 0,
		speed = 400
	}
}

waves = {
	maxWaveLevel = 12,
	--Group 1
	[1] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 200,
		monsters = {
			{name = "Mutated Rat", count = 10, interval = 10000}
		}
	},
	[2] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 200,
		monsters = {
			{name = "Werewolf", count = 10, interval = 10000}
		}
	},
	[3] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 200,
		monsters = {
			{name = "Midnight Panther", count = 10, interval = 10000}
		}
	},
	--Group 2
	[4] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 300,
		monsters = {
			{name = "Dragon", count = 10, interval = 10000},
			{name = "Dragon Lord", count = 10, interval = 10000}
		}
	},
	[5] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 400,
		monsters = {
			{name = "Draptor", count = 10, interval = 10000}
		}
	},
	[6] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Undead Dragon", count = 5, interval = 10000},
			{name = "Ghastly Dragon", count = 5, interval = 10000}
		}
	},
	--Group 3
	[7] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Grim Reaper", count = 10, interval = 10000}
		}
	},
	[8] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Behemoth", count = 10, interval = 10000}
		}
	},
	[9] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Demon", count = 10, interval = 10000}
		}
	},
	[10] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Juggernaut", count = 5, interval = 10000}
		}
	},
	[11] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Behemoth", count = 15, interval = 10000},
			{name = "Juggernaut", count = 5, interval = 10000},
			{name = "Ghastly Dragon", count = 5, interval = 10000}
		}
	},
	[12] = {
		interval = 1000,
		goldBonus = 200,
		expBonus = 3000,
		monsters = {
			{name = "Grim Reaper", count = 5, interval = 10000},
			{name = "Demon", count = 5, interval = 10000},
			{name = "Juggernaut", count = 5, interval = 10000},
			{name = "Undead Dragon", count = 5, interval = 10000},
			{name = "Ghastly Dragon", count = 5, interval = 10000}
		}
	}
}