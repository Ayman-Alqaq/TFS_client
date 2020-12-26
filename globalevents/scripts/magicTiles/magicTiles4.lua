local lobbyPos = Position(32539, 32544, 7) --Center of area

function onThink(interval)
    local players = Game.getSpectators(lobbyPos, false, true, 30, 30, 15, 15)
    if players[1] ~= nil then
        for i = 1, #players do
            local player = Player(players[i])
            local mana, maxMana = player:getMana(), player:getMaxMana()
            local health, maxHealth = player:getHealth(), player:getMaxHealth()
            if mana ~= maxMana then
                player:addMana(maxMana - mana)
            end
            if health ~= maxHealth then
                player:addHealth(maxHealth - health)
            end
        end
    end
    return true
end
