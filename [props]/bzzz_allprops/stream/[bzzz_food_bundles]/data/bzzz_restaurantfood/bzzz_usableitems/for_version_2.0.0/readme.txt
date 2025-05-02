1) If you're using version '2.0.0', it's necessary to add an additional section to the client.lua file.
This is so that the mouth moves while eating. Of course, you can use the old config, but your mouth won't move.

--------   ADD CLIENT.LUA - BZZZ_USABLEITEMS verison 2.0.0.    ----------------------

RegisterNetEvent('bzzz_usableitems:onEatPlates')
AddEventHandler('bzzz_usableitems:onEatPlates', function(basicInfo, firstProp, secondProp)
    if not IsAnimated then
        IsAnimated = true

        CreateThread(function()
            local playerPed = PlayerPedId()
            local x, y, z = table.unpack(GetEntityCoords(playerPed))

            if secondProp and secondProp.propName then
                local boneIndex2 = GetPedBoneIndex(playerPed, secondProp.boneIndex)
                prop2 = CreateObject(secondProp.propName, x, y, z + 0.2, true, true, true)
                AttachEntityToEntity(prop2, playerPed, boneIndex2, secondProp.xPos, secondProp.yPos, secondProp.zPos, secondProp.xRot, secondProp.yRot, secondProp.zRot, true, true, false, true, 1, true)
            end

            local boneIndex = GetPedBoneIndex(playerPed, firstProp.boneIndex)
            local prop = CreateObject(firstProp.propName, x, y, z + 0.2, true, true, true)
            AttachEntityToEntity(prop, playerPed, boneIndex, firstProp.xPos, firstProp.yPos, firstProp.zPos, firstProp.xRot, firstProp.yRot, firstProp.zRot, true, true, false, true, 1, true)

            ESX.Streaming.RequestAnimDict(basicInfo.animationDictEat, function()
                TaskPlayAnim(playerPed, basicInfo.animationDictEat, basicInfo.animationNameEat, 8.0, -8, -1, 49, 0, 0, 0, 0)
                PlayFacialAnim(playerPed, basicInfo.animationNameChewing, basicInfo.animationDictChewing)

                Wait(6000)
                IsAnimated = false
                ClearPedSecondaryTask(playerPed)
                DeleteObject(prop)
                DeleteObject(prop2)
            end)
        end)
    end
end)

--------------------------------------------------------------------------------------



2) Also, edit the server.lua file.
Insert the code into the function!


--------   ADD SERVER.LUA - BZZZ_USABLEITEMS verison 2.0.0.    ----------------------

for k, v in pairs(Config.Items['FoodPlates']) do

        ESX.RegisterUsableItem(k, function(source)
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            xPlayer.removeInventoryItem(k, 1)

            TriggerClientEvent('esx_status:add', _source, 'hunger', v.basicInfo.amountToAdd)
            TriggerClientEvent('bzzz_usableitems:onEatPlates', _source, v.basicInfo, v.firstProp, v.secondProp or nil)
			xPlayer.showNotification('~q~Bon appetit!')
        end)
    end		
	
--------------------------------------------------------------------------------------



3) Paste the entire code from the file 'restaurant_code_for_usableitems.lua' into the configuration file in 'bzzz_usableitems'.

After all changes, you must restart the server. It is never enough to restart the script only in txadmin.



