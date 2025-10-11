
local playerDimensions = {}
HalloweenMissionActive = 0

AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= "HG-Halloween") then
		print("^8ERROR: ^3Rename this resource to ^8'HG-Halloween'^3 to work properly.^0")
        return
    end
end)

lib.callback.register('server:HG-Halloween:getstatus', function(source)
    return HalloweenMissionActive
end)

RegisterNetEvent('server:HG-Halloween:EnterInstance', function(instanceId)
    local src = source
    local originalBucket = GetPlayerRoutingBucket(src)
    playerDimensions[src] = originalBucket
    SetPlayerRoutingBucket(src, instanceId)
end)

RegisterNetEvent('server:HG-Halloween:ExitInstance', function()
    local src = source
    if playerDimensions[src] then
        SetPlayerRoutingBucket(src, playerDimensions[src])
        playerDimensions[src] = nil
    else
        print("Error: No original dimension found for player.")
    end
end)

