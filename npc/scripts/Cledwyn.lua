 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {25172, 13030}, -- Draken Doll
		  
          item2 = {25172, 25177}, -- Earthheart Cuirass
		  item15 = {25172, 25178},-- Earthheart Hauberk
		  item3 = {25172, 25179}, -- Earthheart Platemail
		  item4 = {25172, 25191}, -- Earthmind Raiment		  
		  item5 = {25172, 25187}, -- Earthsoul Tabard
		  
		  item6 = {25172, 25174}, -- Fireheart Cuirass
		  item7 = {25172, 25175}, -- Fireheart Hauberk
		  item8 = {25172, 25176}, -- Fireheart Platemail
		  item9 = {25172, 25190}, -- Firemind Raiment
		  item10 = {25172, 25186}, -- Firesoul Tabard
		  
		  item11 = {25172, 25183}, -- Frostheart Cuirass
		  item12 = {25172, 25184}, -- Frostheart Hauberk
		  item13 = {25172, 25185}, -- Frostheart Platemail
		  item16 = {25172, 25193}, -- Frostmind Raiment
		  item14 = {25172, 25189}, -- Frostsoul Tabard
		 
		  item17 = {25172, 25180}, -- Thunderheart Cuirass
		  item18 = {25172, 25181}, -- Thunderheart Hauberk
		  item19 = {25172, 25182}, -- Thunderheart Platemail
		  item20 = {25172, 25192},-- Thundermind Raiment
		  item21 = {25172, 25188} -- Thundersoul Tabard
}
local counts = {
          count1 = {100, 1}, -- count1 Quantity that will be ordered and that will be given in the first exchange
          count2 = {100, 1}, -- count2 Quantity that will be ordered and that will be given in the first exchange
		  count3 = {100, 1}, -- count3 Quantity that will be ordered and that will be given in the first exchange
		  count4 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange		  
		  count5 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count6 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count7 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count8 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count9 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange		  
		  count10 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count11 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count12 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count13 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count14 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count15 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count16 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count17 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count18 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count19 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count20 = {100, 1}, -- count4 Quantity that will be ordered and that will be given in the first exchange
		  count21 = {100, 1} -- count4 Quantity that will be ordered and that will be given in the first exchange
		 
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if  msgcontains(msg, 'earthheart cuirass') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You have exchanged '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemName(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemName(items.item2[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthheart hauberk') then
                    if getPlayerItemCount(cid, items.item15[1]) >= counts.count15[1] then
                              doPlayerRemoveItem(cid, items.item15[1], counts.count15[1])
                              doPlayerAddItem(cid, items.item15[2], counts.count15[2])
                              selfSay('You have exchanged '.. counts.count15[1] ..' '.. getItemName(items.item15[1]) ..' for '.. counts.count15[2] ..' '.. getItemName(items.item15[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count15[1] ..' '.. getItemName(items.item15[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthheart platemail') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('You have exchanged '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..' for '.. counts.count3[2] ..' '.. getItemName(items.item3[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count3[1] ..' '.. getItemName(items.item3[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthmind raiment') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('You have exchanged '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..' for '.. counts.count4[2] ..' '.. getItemName(items.item4[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count4[1] ..' '.. getItemName(items.item4[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'earthsoul tabard') then
                    if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('You have exchanged '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..' for '.. counts.count5[2] ..' '.. getItemName(items.item5[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count5[1] ..' '.. getItemName(items.item5[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart cuirass') then
                    if getPlayerItemCount(cid, items.item6[1]) >= counts.count6[1] then
                              doPlayerRemoveItem(cid, items.item6[1], counts.count6[1])
                              doPlayerAddItem(cid, items.item6[2], counts.count6[2])
                              selfSay('You have exchanged '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..' for '.. counts.count6[2] ..' '.. getItemName(items.item6[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count6[1] ..' '.. getItemName(items.item6[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart hauberk') then
                    if getPlayerItemCount(cid, items.item7[1]) >= counts.count7[1] then
                              doPlayerRemoveItem(cid, items.item7[1], counts.count7[1])
                              doPlayerAddItem(cid, items.item7[2], counts.count7[2])
                              selfSay('You have exchanged '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..' for '.. counts.count7[2] ..' '.. getItemName(items.item7[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count7[1] ..' '.. getItemName(items.item7[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'fireheart platemail') then
                    if getPlayerItemCount(cid, items.item8[1]) >= counts.count8[1] then
                              doPlayerRemoveItem(cid, items.item8[1], counts.count8[1])
                              doPlayerAddItem(cid, items.item8[2], counts.count8[2])
                              selfSay('You just swap '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..' for '.. counts.count8[2] ..' '.. getItemName(items.item8[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count8[1] ..' '.. getItemName(items.item8[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'firemind raiment') then
                    if getPlayerItemCount(cid, items.item9[1]) >= counts.count9[1] then
                              doPlayerRemoveItem(cid, items.item9[1], counts.count9[1])
                              doPlayerAddItem(cid, items.item9[2], counts.count9[2])
                              selfSay('You have exchanged '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..' for '.. counts.count9[2] ..' '.. getItemName(items.item9[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count9[1] ..' '.. getItemName(items.item9[1]) ..'.', cid)
                    end
					
					-- Dolls 
					elseif msgcontains(msg, 'firesoul tabard') then
                    if getPlayerItemCount(cid, items.item10[1]) >= counts.count10[1] then
                              doPlayerRemoveItem(cid, items.item10[1], counts.count10[1])
                              doPlayerAddItem(cid, items.item10[2], counts.count10[2])
                              selfSay('You have exchanged '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..' for '.. counts.count10[2] ..' '.. getItemName(items.item10[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count10[1] ..' '.. getItemName(items.item10[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart cuirass') then
                    if getPlayerItemCount(cid, items.item11[1]) >= counts.count11[1] then
                              doPlayerRemoveItem(cid, items.item11[1], counts.count11[1])
                              doPlayerAddItem(cid, items.item11[2], counts.count11[2])
                              selfSay('You have exchanged '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..' for '.. counts.count11[2] ..' '.. getItemName(items.item11[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count11[1] ..' '.. getItemName(items.item11[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart hauberk') then
                    if getPlayerItemCount(cid, items.item12[1]) >= counts.count12[1] then
                              doPlayerRemoveItem(cid, items.item12[1], counts.count12[1])
                              doPlayerAddItem(cid, items.item12[2], counts.count12[2])
                              selfSay('You have exchanged '.. counts.count12[1] ..' '.. getItemName(items.item12[1]) ..' for '.. counts.count12[2] ..' '.. getItemName(items.item12[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count12[1] ..' '.. getItemName(items.item12[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostheart platemail') then
                    if getPlayerItemCount(cid, items.item13[1]) >= counts.count13[1] then
                              doPlayerRemoveItem(cid, items.item13[1], counts.count13[1])
                              doPlayerAddItem(cid, items.item13[2], counts.count13[2])
                              selfSay('You have exchanged '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..' for '.. counts.count13[2] ..' '.. getItemName(items.item13[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostmind raiment') then
                    if getPlayerItemCount(cid, items.item16[1]) >= counts.count16[1] then
                              doPlayerRemoveItem(cid, items.item16[1], counts.count16[1])
                              doPlayerAddItem(cid, items.item16[2], counts.count16[2])
                              selfSay('You have exchanged '.. counts.count16[1] ..' '.. getItemName(items.item16[1]) ..' for '.. counts.count16[2] ..' '.. getItemName(items.item16[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count16[1] ..' '.. getItemName(items.item16[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thunderheart cuirass') then
                    if getPlayerItemCount(cid, items.item17[1]) >= counts.count17[1] then
                              doPlayerRemoveItem(cid, items.item17[1], counts.count17[1])
                              doPlayerAddItem(cid, items.item17[2], counts.count17[2])
                              selfSay('You have exchanged '.. counts.count17[1] ..' '.. getItemName(items.item17[1]) ..' for '.. counts.count17[2] ..' '.. getItemName(items.item17[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count17[1] ..' '.. getItemName(items.item17[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thunderheart hauberk') then
                    if getPlayerItemCount(cid, items.item18[1]) >= counts.count18[1] then
                              doPlayerRemoveItem(cid, items.item18[1], counts.count18[1])
                              doPlayerAddItem(cid, items.item18[2], counts.count18[2])
                              selfSay('You have exchanged '.. counts.count18[1] ..' '.. getItemName(items.item18[1]) ..' for '.. counts.count18[2] ..' '.. getItemName(items.item18[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count18[1] ..' '.. getItemName(items.item18[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thunderheart platemail') then
                    if getPlayerItemCount(cid, items.item19[1]) >= counts.count19[1] then
                              doPlayerRemoveItem(cid, items.item19[1], counts.count19[1])
                              doPlayerAddItem(cid, items.item19[2], counts.count19[2])
                              selfSay('You have exchanged '.. counts.count19[1] ..' '.. getItemName(items.item19[1]) ..' for '.. counts.count19[2] ..' '.. getItemName(items.item19[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count19[1] ..' '.. getItemName(items.item19[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thundermind raiment') then
                    if getPlayerItemCount(cid, items.item20[1]) >= counts.count20[1] then
                              doPlayerRemoveItem(cid, items.item20[1], counts.count20[1])
                              doPlayerAddItem(cid, items.item20[2], counts.count20[2])
                              selfSay('You have exchanged '.. counts.count20[1] ..' '.. getItemName(items.item20[1]) ..' for '.. counts.count20[2] ..' '.. getItemName(items.item20[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count20[1] ..' '.. getItemName(items.item20[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'thundersoul tabard') then
                    if getPlayerItemCount(cid, items.item21[1]) >= counts.count21[1] then
                              doPlayerRemoveItem(cid, items.item21[1], counts.count21[1])
                              doPlayerAddItem(cid, items.item21[2], counts.count21[2])
                              selfSay('You have exchanged '.. counts.count21[1] ..' '.. getItemName(items.item21[1]) ..' for '.. counts.count21[2] ..' '.. getItemName(items.item21[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count21[1] ..' '.. getItemName(items.item21[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'draken doll') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('You have exchanged '.. counts.count1[1] ..' '.. getItemName(items.item1[1]) ..' for '.. counts.count1[2] ..' '.. getItemName(items.item1[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count13[1] ..' '.. getItemName(items.item13[1]) ..'.', cid)
                    end
					
					elseif msgcontains(msg, 'frostsoul tabard') then
                    if getPlayerItemCount(cid, items.item14[1]) >= counts.count14[1] then
                              doPlayerRemoveItem(cid, items.item14[1], counts.count14[1])
                              doPlayerAddItem(cid, items.item14[2], counts.count14[2])
                              selfSay('You have exchanged '.. counts.count14[1] ..' '.. getItemName(items.item14[1]) ..' for '.. counts.count14[2] ..' '.. getItemName(items.item14[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count14[1] ..' '.. getItemName(items.item14[1]) ..'.', cid)
                    end
					
					
					
          end
		  
          return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())