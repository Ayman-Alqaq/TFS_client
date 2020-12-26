local rewards = {
	[SKILL_FIST] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54776},
		{lvl = 300, items = {{2365, 2}}, storage = 54797}
	},
	[SKILL_CLUB] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54777},
		{lvl = 300, items = {{25978, 1}}, storage = 54791}
	},
	[SKILL_SWORD] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54778},
		{lvl = 300, items = {{26270, 1}}, storage = 54792}
	},
	[SKILL_AXE] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54779},
		{lvl = 300, items = {{26284, 1}}, storage = 54793}
	},
	[SKILL_DISTANCE] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54780},
		{lvl = 300, items = {{26311, 1}}, storage = 54794}
	},
	[SKILL_SHIELD] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54781},
		{lvl = 300, items = {{2523, 1}}, storage = 54795}
	},
	[SKILL_FISHING] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54782},
		
	},
	[SKILL_MAGLEVEL] = {
		{lvl = 200, items = {{2157, 5}, {2263, 1}}, storage = 54783},
		{lvl = 300, items = {{2358, 1}, {22424, 1}}, storage = 54796}
	},
	[SKILL_LEVEL] = {
		{lvl = 100, items = {{2157, 5}, {2263, 1}, {2160, 1}}, storage = 54784},
		{lvl = 200, items = {{2157, 5}, {2263, 1}, {2160, 5}}, storage = 54785},
		{lvl = 300, items = {{2157, 5}, {2263, 1}, {2160, 5}}, storage = 54786},
		{lvl = 400, items = {{2157, 5}, {2263, 1}, {2160, 10}}, storage = 54787},
		{lvl = 500, items = {{2157, 5}, {2263, 1}, {2160, 10}, {2299, 1}, {2284, 1}}, storage = 54788},
		{lvl = 750, items = {{2157, 15}, {2263, 5}, {2160, 25}}, storage = 54789},
		{lvl = 1000, items = {{2469, 1}, {2646, 1}, {2157, 50}, {2471,1}}, storage = 54790},
	},
}

function onAdvance(player, skill, oldlevel, newlevel)
	local rewardstr = "Items received: "
	local reward_t = {}
	if rewards[skill] then
		for j = 1, #rewards[skill] do
			local r = rewards[skill][j]
			if not r then
				return true
			end

			if newlevel >= r.lvl then
				if player:getStorageValue(r.storage) < 1 then
					player:setStorageValue(r.storage, 1)
					for i = 1, #r.items do
						local itt = ItemType(r.items[i][1])
						if itt then
							player:addItem(r.items[i][1], r.items[i][2])
							table.insert(reward_t, itt:getName() .. (r.items[i][2] > 1 and " x" .. r.items[i][2] or ""))
						end
					end
				end
			end
		end
	
		if #reward_t > 0 then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, rewardstr .. table.concat(reward_t, ", "))
		end
	end
	return true
end

function onLogin(player)
	player:registerEvent("onadvance_reward")
	return true
end