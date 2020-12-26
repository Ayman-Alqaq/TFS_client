local skills = {"Magic Level", "Fist Fighting", "Club Fighting", "Sword Fighting", "Axe Fighting", "Distance Fighting", "Shielding", "Fishing"}

function Player:sendSkillVoucherWindow()
	local modaltext = "Select skill you would like to improve:"
	local modal = ModalWindow(7092, "Use rune", modaltext)

	for i = 1, #skills do
		modal:addChoice(i, skills[i])
	end

	modal:addButton(1, "Select")
	modal:setDefaultEnterButton(1)
	modal:addButton(2, "Cancel")
	modal:setDefaultEscapeButton(2)

	return modal:sendToPlayer(self)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendSkillVoucherWindow()
	return true
end