-->[[ 
    --> CONSTANTS 
--<]]
    KOH = {
        --minutes to begin event
            start_time = 5,
        --minutes to finish event
            finish_time = 5,
        --min players required for event
            min_players = 2,
        --max players allowed in event
            max_players = 10,
        --custom channel to broadcast event messages
            channel = 30,
        --delay in minutes to broadcast event stats
            event_info = 3,
        --mininum level of player
            player_level = 100,
        --reward for winner team
            reward = {2157, 5},
        --allow players with same IP in event? [false = allow, true = don't allow]
            ip_check = true,
    -->[[ 
        --> STORAGES & DATA
    --<]]   
        --event's stat globalstorage
            status = 1003,
        --player's frags storage key
            frags = 20001,
        --player's highscores storage key
            highscore = 20002,
    -->[[ 
        --> STRINGS (do not alter %d or %s)
    --<]] 
            msg_call = 'King of the Hill will begin in %s! Head to the world event waiting room (Teleport is located in Thais Temple) to join the event.',
            msg_join = '[King of the Hill] %s has joined the event.',
            msg_cancel = 'King of the Hill was cancelled due to insufficient players.',
            msg_begin = 'King of the Hill has started!',
            msg_finish = 'King of the Hill will finish in %d minutes...',
            msg_win = 'King of the Hill has finished and %s is the winner with %d frag(s)!',
            msg_draw = 'King of the Hill has ended in a draw with no winner...',
            msg_kill = '[King of the Hill] %s has killed %s (%d frag(s)).',
            msg_stat = '[King of the Hill] Top killers:%s.',
            msg_defeat = '[King of the Hill] %s.',
            msg_bonus = '[King of the Hill] You have been awarded with x%d %s.',
    -->[[ 
        --> POSITIONS (map wait_room with PZ+NO-LOGOUT, arena with PVP+NO-LOGOUT)
    --<]]
            wait_room = {from = Position(32540, 32159, 9), to = Position(32554, 32172, 9)},
            arena = {from = Position(32172, 32253, 9), to = Position(32198, 32279, 9)},
    -->[[ 
        --> FUNCTIONS
    --<]]           
            broadcast = function (msg, class)
                for _, player in ipairs(Game.getPlayers()) do
                    player:sendChannelMessage('', msg, class, KOH.channel)
                end
            end,
                                  
            hasDuplicateIP = function (player1)
                for _, player2 in ipairs(Game.getPlayers()) do
                    if player2:getPosition():isInRange(KOH.wait_room.from, KOH.wait_room.to) then
                        if player1:getIp() == player2:getIp() then
                            return true
                        elseif player2:getIp() == 0 then
                            player2:remove()
                        end
                    end
                end
                return false
            end,
                        
            getPlayers = function (onlyName)
                local t = {}
                for _, player in ipairs(Game.getPlayers()) do
                    if player:getPosition():isInRange(KOH.arena.from, KOH.arena.to) then
                        table.insert(t, onlyName and player:getName() or player)
                    end
                end
                return t
            end,

            getFrags = function (player)
                return math.max(0, player:getStorageValue(KOH.frags))
            end,

            addFrag = function (player)
                local v = math.max(0, player:getStorageValue(KOH.frags)) + 1
                player:setStorageValue(KOH.frags, v)
                player:say('+1 ('.. v ..')' , TALKTYPE_MONSTER_YELL)
            end,

            teleport = function (player, from, to)
                player:teleportTo(Position(math.random(from.x, to.x), math.random(from.y, to.y), from.z))
            end,
                                               
            heal = function (player)
                player:addHealth(player:getMaxHealth())
                player:addMana(player:getMaxMana())
                local condition = 1
                player:removeCondition(condition)
                for n = 1, 27 do
                    condition = condition * 2                    
                    player:removeCondition(condition)
                end
            end,
            
            onEnd = function (player)
                KOH.heal(player)
                player:unregisterEvent('koh_death')
                player:teleportTo(player:getTown():getTemplePosition())
            end,
                                    
            sendLongMessage = function (array, class, init)
                local strings, i, position, added = {""}, 1, 1, false
                for index = 1, #array do
                    if(added) then
                        if(i > (position * 10)) then
                            strings[position] = strings[position] .. ","
                            position = position + 1
                            strings[position] = ""
                        else
                            strings[position] = i == 1 and "" or strings[position] .. ", "
                        end
                    end
                    strings[position] = strings[position] .. array[index]
                    i = i + 1
                    added = true
                end
                for i, str in ipairs(strings) do
                    if(str:sub(str:len()) ~= ",") then
                        str = str .. "."
                    end
                    sendChannelMessage(KOH.channel, class, (init and i == 1) and (init .. str) or str)
                end
            end,

            getHighscores = function ()
                local t = {}
                for index, player in ipairs(KOH.getPlayers()) do
                    t[index] = {}
                    table.insert(t[index], player)
                    table.insert(t[index], player:getName())
                    table.insert(t[index], KOH.getFrags(player))
                end
                table.sort(t, function(a, b) return a[3] > b[3] end)
                return t[1][3] > 0 and t or " None"
            end,

            info_event = function ()
                if getGlobalStorageValue(KOH.status) == 1 then
                    local v = KOH.getHighscores()
                    if type(v) == "table" then
                        local top = ""
                        for index = 1, 3 do
                            if v[index] and (v[index][3]) > 0 then
                                top = top .. " " .. v[index][2] .. " [".. v[index][3] .." frag(s)]"
                                if v[index + 1] and (v[index + 1][3]) > 0 then
                                    top = top .. " -"
                                end
                            end
                        end
                        v = top
                    end
                    addEvent(KOH.info_event, KOH.event_info*60*1000)  
                    sendChannelMessage(KOH.channel, 8, KOH.msg_stat:format(v))
                end
            end,
                                                               
            cancel = function ()
                setGlobalStorageValue(KOH.status, -1)
                for _, player in ipairs(Game.getPlayers()) do
                    if player:getPosition():isInRange(KOH.wait_room.from, KOH.wait_room.to) then
                        player:teleportTo(player:getTown():getTemplePosition())
                    end
                end     
            end,
                        
            start = function ()
                if getGlobalStorageValue(KOH.status) == 0 then
                    local players = {}
                    for _, player in ipairs(Game.getPlayers()) do
                        if player:getPosition():isInRange(KOH.wait_room.from, KOH.wait_room.to) then
                            table.insert(players, player)
                        end
                    end
                    
                    if #players < KOH.min_players then
                        KOH.cancel()
                        return broadcastMessage(KOH.msg_cancel, MESSAGE_EVENT_ADVANCE)
                    end

                    sendChannelMessage(KOH.channel, 14, KOH.msg_begin)                    
                    setGlobalStorageValue(KOH.status, 1)
                    broadcastMessage(KOH.msg_begin, MESSAGE_EVENT_ADVANCE)
                    addEvent(KOH.info_event, KOH.event_info*60*1000)                    
                    
                    for _, player in ipairs(players) do
                        player:openChannel(KOH.channel)
                        player:registerEvent('koh_death')
                        player:setStorageValue(KOH.frags, 0)
                        KOH.teleport(player, KOH.arena.from, KOH.arena.to)
                        player:say('FIGHT!', TALKTYPE_MONSTER_YELL)                        
                    end
                    KOH.sendLongMessage(KOH.getPlayers(true), 8, '[Players in KoH] ')

                    addEvent(KOH.finish, KOH.finish_time*60*1000)
                    addEvent(sendChannelMessage, (KOH.finish_time-2)*60*1000, KOH.channel, 14, KOH.msg_finish:format(2))
                end
            end,

            finish = function ()
                if getGlobalStorageValue(KOH.status) == 1 then
                    local topKiller = KOH.getHighscores()
                    if (type(topKiller) == "table") and (topKiller[1][3] > topKiller[2][3]) then
                        topKiller[1][1]:addItem(KOH.reward[1], KOH.reward[2])
                        topKiller[1][1]:sendChannelMessage('', KOH.msg_bonus:format(KOH.reward[2], ItemType(KOH.reward[1]):getName()), 14, KOH.channel)
                        broadcastMessage(KOH.msg_win:format(topKiller[1][2], topKiller[1][3]), MESSAGE_EVENT_ADVANCE)
                    else
                        broadcastMessage(KOH.msg_draw, MESSAGE_EVENT_ADVANCE)
                    end

                    for _, player in ipairs(KOH.getPlayers()) do
                        KOH.onEnd(player)
                        local k, v = KOH.getFrags(player), math.max(0, player:getStorageValue(KOH.highscore))
                        if k > v then
                            player:setStorageValue(KOH.highscore, k)
                            player:sendChannelMessage('', 'You got a new highscore of '.. k .. ' frag(s)!', 7, KOH.channel)
                        else
                            player:sendChannelMessage('', 'Your best score of all times is '.. v .. ' frag(s).', 7, KOH.channel)
                        end
                    end
                    setGlobalStorageValue(KOH.status, -1)
                end
            end,            
        }

function Position:isInRange(fromPosition, toPosition)
    return (self.x >= fromPosition.x and self.y >= fromPosition.y and self.z >= fromPosition.z
        and self.x <= toPosition.x and self.y <= toPosition.y and self.z <= toPosition.z)
end