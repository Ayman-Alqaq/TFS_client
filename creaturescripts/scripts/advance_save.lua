local config = {
	heal = true,
	save = true,
	effect = true
}
-- local spells = {
--     [20] = {{"Exori Mort", "Exori Vis"}, 88888}, -- [level] = {{spellnames}, storage}
--     [30] = {"Exori Flam", 88889} -- [level] = {spellname, storage}
-- }
function onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	if config.effect then
		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		player:say('LEVEL UP!', TALKTYPE_MONSTER_SAY)
	end

	if config.heal then
		player:addHealth(player:getMaxHealth())
	end

	if config.save then
		player:save()
	end
	return true
end
-- function onAdvance(player, skill, oldLevel, newLevel)
--     local learned = {}
--     for level, v in pairs(spells) do
--         if (player:getStorageValue(v[2]) == -1) and (newLevel >= level) then
--             if type(v[1] == "table") then
--                 local spellstr = {}
--                 for i = 1, #v[1] do
--                     spellstr[#spellstr+1] = v[1][i] .. (i < #v[1] and ", " or ".")
--                 end
--                 learned[#learned+1] = string.format("[%d]: %s", level, table.concat(spellstr))
--             else
--                 learned[#learned+1] = string.format("[%d]: %s", level, v[1])
--             end
--             player:setStorageValue(v[2], 1)
--         end
--     end
--     if #learned > 0 then
--         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have learned new spells:")
--         for i = 1, #learned do
--             player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, table.concat(learned))
--         end
--     end
--     return true
-- end