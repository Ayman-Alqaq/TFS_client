function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not Player(creature) or not Player(attacker) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if attacker:hasSecureMode() then
        return 0, 0, 0, 0
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end