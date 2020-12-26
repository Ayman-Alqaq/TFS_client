dofile("data/lib/koh.lua")

function onPrepareDeath(creature, killer)	
    local killerCreature, player = Creature(killer), Player(creature)
    if killerCreature == nil then
        killerName = "field item"
    else
        local master = killerCreature:getMaster()
        if master and (master ~= killerCreature) and master:isPlayer() then
            killerCreature = master            
        end
        killerName = killerCreature:getName()
    end

    corpse = doCreateItem(player:getSex() == 1 and 3058 or 3065, 1, player:getPosition())
    Item(corpse):setAttribute("description", "You recognize " .. player:getName() .. ". He was killed by " .. killerName .. ".")

    if (killerCreature ~= nil) and killerCreature:isPlayer() then
        KOH.addFrag(killer)
        player:sendChannelMessage('', KOH.msg_defeat:format(killerName .. ' just killed you'), 7, KOH.channel)
        sendChannelMessage(KOH.channel, 14, KOH.msg_kill:format(killerName, player:getName(), KOH.getFrags(killerCreature)))        
    else
        player:sendChannelMessage('', KOH.msg_defeat:format('You just died'), 7, KOH.channel)
    end
    KOH.teleport(player, KOH.arena.from, KOH.arena.to)
    KOH.heal(player)
    return false
end