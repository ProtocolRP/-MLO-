local Framework = nil

if Config.Framework == 'qb-core' then
    Framework = exports[Config.FrameworkResourceName]:GetCoreObject()
elseif Config.Framework == 'esx' then
    Framework = exports[Config.FrameworkResourceName]:getSharedObject()
end

function GetPlayerIdentifier(source)
    if Config.Framework == 'qb-core' then
        local player = Framework.Functions.GetPlayer(source)
        if player then
            return player.PlayerData.citizenid
        end
    elseif Config.Framework == 'esx' then
        local xPlayer = Framework.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.getIdentifier()
        end
    end
end

function Notify(source, message, type)
    if Config.Framework == 'qb-core' then
        TriggerClientEvent('QBCore:Notify', source, message, type)
    elseif Config.Framework == 'esx' then
        local xPlayer = Framework.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.showNotification(message)
        end
    end
end