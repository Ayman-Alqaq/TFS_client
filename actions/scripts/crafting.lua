local config = {
-- Window Config
	mainTitleMsg = "Crafting System", -- Main window title
	mainMsg = "Welcome to the crafting system. Please choose a vocation to begin.", -- Main window message

	craftTitle = "Crafting System: ", -- Title of the crafting screen after player picks of vocation
	craftMsg = "Here is a list of all items that can be crafted by a ", -- Message on the crafting screen after player picks of vocation
-- End Window Config

-- Player Notifications Config
	needItems = "You do not have all the required items to make ", -- This is the message the player recieves if he does not have all required items

-- Crafting Config
	system = { 
		[1] = {vocation = "Master Sorcerer", -- This is the category can be anything.
			items = {
				[1] = {item = "wand of everblazing", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 18409, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2514, count = 1}, -- Mastermind Shield
								[3] = {item = 22396, count = 5}, -- Cluster of Solace
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 11237, count = 20}, -- book of necromantic rituals
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					
				[2] = {item = "wand of defiance",
						itemID = 18390,		
						reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2514, count = 1}, -- Mastermind Shield
								[3] = {item = 22541, count = 5}, -- pool of chitinous glue
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 11237, count = 20}, -- book of necromantic rituals
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},					
				
				[3] = {item = "yalahari mask",
						itemID = 9778,			
						reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2323, count = 1}, -- Hat of the Mad
								[3] = {item = 2131, count = 1}, -- Star Amulet
								[4] = {item = 5911, count = 100}, -- Red Piece of cloth
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					
				[4] = {item = "furious frock",
						itemID = 21725,				
						reqItems = {
								[1] = {item = 9971, count = 40}, -- Gold Ingot
								[2] = {item = 2494, count = 1}, -- Demon Armor
								[3] = {item = 2125, count = 1}, -- Crystal Necklace
								[4] = {item = 2492, count = 2}, -- Dragon Scale Mail
								[5] = {item = 18421, count = 30}, -- green crystal fragment
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					
				[5] = {item = "royal scale robe",
						itemID = 25253,				
						reqItems = {
								[1] = {item = 9971, count = 40}, -- Gold Ingot
								[2] = {item = 2494, count = 1}, -- Demon Armor
								[3] = {item = 2125, count = 1}, -- Crystal Necklace
								[4] = {item = 2492, count = 2}, -- Dragon Scale Mail
								[5] = {item = 18420, count = 30}, -- red crystal fragment
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					
				[6] = {item = "pair of soft boots",
						itemID = 6132,			
						reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 7891, count = 1}, -- Magma Boots
								[3] = {item = 13757, count = 20}, -- Coal
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
						
				[7] = {item = "spellbook of ancient arcana",
						itemID = 16112,			
						reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 8903, count = 4}, -- Spellbook of Lost Souls
								[3] = {item = 5880, count = 20}, -- Iron Ore
								[4] = {item = 7590, count = 100}, -- Great Mana Potion
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				[8] = {item = "fabled wand", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 25994, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 18409, count = 1}, -- Wand of Everblazing
								[5] = {item = 18390, count = 1}, -- Wand of Defiance
								[6] = {item = 22396, count = 50}, -- Cluster of Solace
								[7] = {item = 2157, count = 50}, -- VIP Token
								[8] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				[9] = {item = "skill rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2263, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
				[10] = {item = "enchantment rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2294, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
				[11] = {item = "boots of salvation", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2358, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 200}, -- Gold Ingot
								[2] = {item = 2157, count = 150}, -- VIP Token
								[3] = {item = 6132, count = 10}, -- Soft Boots
								[4] = {item = 2195, count = 10}, -- Boots of Haste
								[5] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				},
			},
		
		[2] = {vocation= "Elder Druid", 
			items = {
				[1] = {item = "glacial rod", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 18412, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2514, count = 1}, -- Mastermind Shield
								[3] = {item = 22396, count = 5}, -- Cluster of Solace
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 11237, count = 20}, -- book of necromantic rituals
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					
				[2] = {item = "muck rod",
						itemID = 18411,		
						reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2514, count = 1}, -- Mastermind Shield
								[3] = {item = 22541, count = 5}, -- pool of chitinous glue
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 11237, count = 20}, -- book of necromantic rituals
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},					
				
				[3] = {item = "yalahari mask",
						itemID = 9778,			
						reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2323, count = 1}, -- Hat of the Mad
								[3] = {item = 2131, count = 1}, -- Star Amulet
								[4] = {item = 5911, count = 100}, -- Red Piece of cloth
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
						},
					},
					
				[4] = {item = "furious frock",
						itemID = 21725,				
						reqItems = {
								[1] = {item = 9971, count = 40}, -- Gold Ingot
								[2] = {item = 2494, count = 1}, -- Demon Armor
								[3] = {item = 2125, count = 1}, -- Crystal Necklace
								[4] = {item = 2492, count = 2}, -- Dragon Scale Mail
								[5] = {item = 18421, count = 30}, -- green crystal fragment
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
						},
					},
					
				[5] = {item = "royal scale robe",
						itemID = 25253,				
						reqItems = {
								[1] = {item = 9971, count = 40}, -- Gold Ingot
								[2] = {item = 2494, count = 1}, -- Demon Armor
								[3] = {item = 2125, count = 1}, -- Crystal Necklace
								[4] = {item = 2492, count = 2}, -- Dragon Scale Mail
								[5] = {item = 18420, count = 30}, -- red crystal fragment
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
						},
					},
					
				[6] = {item = "pair of soft boots",
						itemID = 6132,			
						reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 7891, count = 1}, -- Magma Boots
								[3] = {item = 13757, count = 20}, -- Coal
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
						},
					},
					
				[7] = {item = "spellbook of ancient arcana",
						itemID = 16112,			
						reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 8903, count = 4}, -- Spellbook of Lost Souls
								[3] = {item = 5880, count = 20}, -- Iron Ore
								[4] = {item = 7590, count = 100}, -- Great Mana Potion
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				[8] = {item = "fabled rod", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 25998, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 18412, count = 1}, -- Glacial Rod
								[5] = {item = 18411, count = 1}, -- Muck Rod
								[6] = {item = 22396, count = 50}, -- Cluster of Solace
								[7] = {item = 2157, count = 50}, -- VIP Token
								[8] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				[9] = {item = "skill rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2263, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
				[10] = {item = "enchantment rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2294, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
				[11] = {item = "boots of salvation", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2358, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 200}, -- Gold Ingot
								[2] = {item = 2157, count = 150}, -- VIP Token
								[3] = {item = 6132, count = 10}, -- Soft Boots
								[4] = {item = 2195, count = 10}, -- Boots of Haste
								[5] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					},
				},
				
		[3] = {vocation = "Royal Paladin", 
				items = {
					[1] = {item = "thorn spitter",
							itemID = 16111,
							reqItems = {
								[1] = {item = 9971, count = 60}, -- Gold Ingot
								[2] = {item = 2455, count = 3}, -- Crossbow
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 18427, count = 20}, -- Pulverized Ore
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[2] = {item = "mycological bow",
							itemID = 18454,
							reqItems = {
								[1] = {item = 9971, count = 60}, -- Gold Ingot
								[2] = {item = 2456, count = 3}, -- bow
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 18427, count = 20}, -- Pulverized Ore
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[3] = {item = "elite draken helmet",
							itemID = 12645,		
							reqItems = {
								[1] = {item = 9971, count = 35}, -- Gold Ingot
								[2] = {item = 5880, count = 100}, -- Iron Ore
								[3] = {item = 5954, count = 30}, -- Demon Horn
								[4] = {item = 2497, count = 2}, -- Crusader Helmet
								[5] = {item = 2498, count = 2}, -- Royal Helmet
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},						
					[4] = {item = "depth lorica",
							itemID = 15407,			
							reqItems = {
								[1] = {item = 9971, count = 40}, -- Gold Ingot
								[2] = {item = 5912, count = 100}, -- Blue Cloth
								[3] = {item = 2472, count = 20}, -- Demon Horn
								[4] = {item = 8891, count = 2}, -- Paladin Armor
								[5] = {item = 2520, count = 2}, -- Demon Shield
								[6] = {item = 2157, count = 5}, -- VIP Token	
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[5] = {item = "prismatic legs",
							itemID = 18405,				
							reqItems = {
								[1] = {item = 9971, count = 35}, -- Gold Ingot
								[2] = {item = 2504, count = 1}, -- Dwarven Legs
								[3] = {item = 5809, count = 1}, -- Soul Stone
								[4] = {item = 5905, count = 30}, -- Vampire Dust
								[5] = {item = 11304, count = 2}, -- Zaoan Legs
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[6] = {item = "prismatic boots",
							itemID = 18406,				
							reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 22539, count = 20}, -- Goosebump Leather
								[3] = {item = 2645, count = 3}, -- Steel Boots
								[4] = {item = 2493, count = 1}, -- Crusader Helmet
								[5] = {item = 6132, count = 1}, -- Soft Boots
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[7] = {item = "blessed shield",
						itemID = 2523,		
						reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2514, count = 1}, -- Mastermind Shield
								[3] = {item = 22541, count = 5}, -- pool of chitinous glue
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 11237, count = 20}, -- book of necromantic rituals
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[8] = {item = "fabled bow", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 25986, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 18454, count = 1}, -- Mycological Bow
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 50}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[9] = {item = "fabled crossbow", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 25990, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 16111, count = 1}, -- Thorn Spitter
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 50}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[10] = {item = "skill rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2263, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
					[11] = {item = "enchantment rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2294, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
					[12] = {item = "boots of salvation", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2358, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 200}, -- Gold Ingot
								[2] = {item = 2157, count = 150}, -- VIP Token
								[3] = {item = 6132, count = 10}, -- Soft Boots
								[4] = {item = 2195, count = 10}, -- Boots of Haste
								[5] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[13] = {item = "pair of soft boots",
						itemID = 6132,			
						reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 7891, count = 1}, -- Magma Boots
								[3] = {item = 13757, count = 20}, -- Coal
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
						},
					},
				},
			},
		[4] = {vocation = "Elite Knight", 
				items = {
				[1] = {item = "fabled blade", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 25962, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 2400, count = 1}, -- Magic Sword
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 50}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				[2] = {item = "blessed shield",
						itemID = 2523,		
						reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2514, count = 1}, -- Mastermind Shield
								[3] = {item = 22541, count = 5}, -- pool of chitinous glue
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 11237, count = 20}, -- book of necromantic rituals
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[3] = {item = "prismatic helmet",
							itemID = 18403,		
							reqItems = {
								[1] = {item = 9971, count = 30}, -- Gold Ingot
								[2] = {item = 2498, count = 3}, -- Royal helmet
								[3] = {item = 5880, count = 100}, -- Iron ore
								[4] = {item = 11227, count = 30}, -- Shiny Stone
								[5] = {item = 11302, count = 2}, -- Zaoan Helmet
								[6] = {item = 2157, count = 5}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
						
					[4] = {item = "ornate chestplate",
							itemID = 15406,				
							reqItems = {
								[1] = {item = 9971, count = 40}, -- Gold Ingot
								[2] = {item = 2472, count = 2}, -- Magic plate armor
								[3] = {item = 5911, count = 100}, -- Red piece of cloth
								[4] = {item = 2157, count = 5}, -- VIP Token
								[5] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
				
					[5] = {item = "ornate legs",
							itemID = 15412,
							reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 2504, count = 1}, -- Dwarven legs
								[3] = {item = 5809, count = 1}, -- Soul stone
								[4] = {item = 5906, count = 20}, -- Demon dust
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},	
					[6] = {item = "depth calcei",
							itemID = 15410,				
							reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 2195, count = 1}, -- Boots of haste
								[3] = {item = 5888, count = 30}, -- piece of hell steel
								[4] = {item = 2157, count = 5}, -- VIP Token
								[5] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[7] = {item = "fabled mace",
							itemID = 25978,				
							reqItems = {
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 2452, count = 1}, -- Heavy Mace
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 50}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[8] = {item = "fabled axe",
							itemID = 25970,				
							reqItems = {
								[1] = {item = 9971, count = 50}, -- Gold Ingot
								[2] = {item = 9969, count = 1}, -- Black Skull
								[3] = {item = 5904, count = 30}, -- Magic Sulphur
								[4] = {item = 8924, count = 1}, -- Hellforged Axe
								[5] = {item = 22396, count = 50}, -- Cluster of Solace
								[6] = {item = 2157, count = 50}, -- VIP Token
								[7] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[9] = {item = "skill rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2263, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
					[10] = {item = "enchantment rune", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2294, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 1}, -- Gold Ingot
								[2] = {item = 2157, count = 5}, -- VIP Token
							},
						},
					[11] = {item = "boots of salvation", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
						itemID = 2358, -- item to be made
						reqItems = { -- items and the amounts in order to craft.
								[1] = {item = 9971, count = 200}, -- Gold Ingot
								[2] = {item = 2157, count = 150}, -- VIP Token
								[3] = {item = 6132, count = 10}, -- Soft Boots
								[4] = {item = 2195, count = 10}, -- Boots of Haste
								[5] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					[12] = {item = "pair of soft boots",
						itemID = 6132,			
						reqItems = {
								[1] = {item = 9971, count = 25}, -- Gold Ingot
								[2] = {item = 7891, count = 1}, -- Magma Boots
								[3] = {item = 13757, count = 20}, -- Coal
								[4] = {item = 2195, count = 2}, -- Boots of Haste
								[5] = {item = 2157, count = 5}, -- VIP Token
								[6] = {item = 6500, count = 100}, -- Demonic Essence
							},
						},
					},
				},
			}
	}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendMainCraftWindow(config)
    return true
end