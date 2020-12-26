local raids = {
	-- Weekly
	--Segunda-Feira
	['Monday'] = {
		['08:00'] = {raidName = 'RatsThais'},
		['12:00'] = {raidName = 'Morgaroth'},
		['15:00'] = {raidName = 'Arachir the Ancient One'}
	},
	
	--Terça-Feira
	['Tuesday'] = {
		['14:00'] = {raidName = 'Ghazbaran'},
		['16:00'] = {raidName = 'Midnight Panther'},
		['18:00'] = {raidName = 'Orc SamBP'},
		['12:00'] = {raidName = 'Ferumbras'}
	},
	
	--Quarta-Feira
	['Wednesday'] = {
		['08:00'] = {raidName = 'Draptor'},
		['12:00'] = {raidName = 'Dragons'},
		['14:00'] = {raidName = 'Yeti'},
		['16:00'] = {raidName = 'Orshabaal'},
		['20:00'] = {raidName = 'OrcsThais'}
	},
	
	--Quinta-Feira
	['Thursday'] = {
		['12:00'] = {raidName = 'Zulazza the Corruptor'},
		['19:00'] = {raidName = 'Undead Cavebear'}
	},
	
	--Sexta-feira
	['Friday'] = {
		['06:00'] = {raidName = 'Titanica'},
		['12:00'] = {raidName = 'Draptor'},
		['15:00'] = {raidName = 'Midnight Panther'},
		['20:00'] = {raidName = 'Gaz'}
	},

	-- By date (Day/Month)
	['31/10'] = {
		['16:00'] = {raidName = 'Halloween Hare'}
	}
}	

function onThink(interval, lastExecution, thinkInterval)
	local day, date = os.date('%A'), getRealDate()

	local raidDays = {}
	if raids[day] then
		raidDays[#raidDays + 1] = raids[day]
	end
	if raids[date] then
		raidDays[#raidDays + 1] = raids[date]
	end

	if #raidDays == 0 then
		return true
	end

	for i = 1, #raidDays do
		local settings = raidDays[i][getRealTime()]
		if settings and not settings.alreadyExecuted then
			Game.startRaid(settings.raidName)
			settings.alreadyExecuted = true
		end
	end

	return true
end