dofile("data/lib/koh.lua")

function onThink(interval, lastExecution)
    if getGlobalStorageValue(KOH.status) > -1 then
        return print('ERROR: King of the Hill is already running.')
    end

 --   for n = 0, KOH.start_time-1 do
   --     addEvent(broadcastMessage, n*60*1000, KOH.msg_call:format(KOH.start_time-n .. ' minute' .. --(KOH.start_time-n > 1 and 's' or '')), MESSAGE_EVENT_ADVANCE)
   -- end
    setGlobalStorageValue(KOH.status, 0)
    addEvent(KOH.start, KOH.start_time*60*1000)
    return true
end