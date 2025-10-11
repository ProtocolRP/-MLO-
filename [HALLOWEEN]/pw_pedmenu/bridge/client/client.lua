local zones = {}
local Framework = nil

if Config.Framework == 'qb-core' then
    Framework = exports[Config.FrameworkResourceName]:GetCoreObject()
elseif Config.Framework == 'esx' then
    Framework = exports[Config.FrameworkResourceName]:getSharedObject()
end

function GetPlayerName()
    if Config.Framework == 'qb-core' then
        local playerData = Framework.Functions.GetPlayerData()
        if playerData and playerData.charinfo then
            return playerData.charinfo.firstname .. " " .. playerData.charinfo.lastname
        else
            return "Unknown"
        end
    elseif Config.Framework == 'esx' then
        local playerData = Framework.GetPlayerData()
        if playerData and playerData.firstName and playerData.lastName then
            return playerData.firstName .. " " .. playerData.lastName
        else
            return "Unknown"
        end
    end
end

function GetPlayerGender()
    if Config.Framework == 'qb-core' then
        local playerData = Framework.Functions.GetPlayerData()
        if playerData and playerData.charinfo and playerData.charinfo.gender then
            return playerData.charinfo.gender
        else
            return nil
        end
    elseif Config.Framework == 'esx' then
        local playerData = Framework.GetPlayerData()
        if playerData and playerData.sex then
            return playerData.sex
        else
            return nil
        end
    end
end

function Notify(message, type)
    if Config.Framework == 'qb-core' then
        Framework.Functions.Notify(message, type)
    elseif Config.Framework == 'esx' then
        Framework.ShowNotification(message, type)
    end
end

function CreateZonePedMenuLocation()
    for k, v in pairs(Config.PedMenuLocation) do
        local coords = vec3(v.coords.x, v.coords.y, v.coords.z)
        zones[k] = lib.zones.sphere({
            coords = coords,
            radius = v.radius,
            debug = v.debug,
            inside = function()
                insideZone = true
                lib.showTextUI('[E] Open ped menu')
            end,
            onExit = function()
                insideZone = false
                lib.hideTextUI()
            end
        })
    end
end

CreateThread(function()
    CreateZonePedMenuLocation()
end)