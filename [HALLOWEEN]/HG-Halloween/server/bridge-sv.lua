
--------------------------------[Settings]--------------------------------
local NotifyType = Config.Halloween.Notify


--------------------------------[Framework]--------------------------------

Framework, QBCore, ESX = nil, nil, nil

if GetResourceState("es_extended") == "started" then
    Framework = "esx"
    ESX = exports["es_extended"]:getSharedObject()
elseif GetResourceState("qb-core") == "started" then
    Framework = "qb"
    QBCore = exports["qb-core"]:GetCoreObject()
end


--------------------------------[Currency]--------------------------------
function ToggleMoney(source, Toggle, Type, Amount)
    local Player
    if not Framework then return end

    if Framework == 'esx' then
        Player = ESX.GetPlayerFromId(source)
        Type = 'money'
    elseif Framework == 'qb' then
        Player = QBCore.Functions.GetPlayer(source)
    end

    if Toggle == 'has' then
        if Framework == 'esx' then
            return Player.getMoney()
        elseif Framework == 'qb' then
            return Player.Functions.GetMoney(Type)
        end
    elseif Toggle == 'add' then
        if Framework == 'esx' then
            Player.addAccountMoney(Type, Amount)
        elseif Framework == 'qb' then
            Player.Functions.AddMoney(Type, Amount)
        end
        return true
    elseif Toggle == 'remove' then
        if Framework == 'esx' then
            Player.removeMoney(Amount)
        elseif Framework == 'qb' then
            Player.Functions.RemoveMoney(Type, Amount)
        end
        return true
    end
end

--------------------------------[Notify]--------------------------------

if NotifyType == 'qb' then
    if not QBCore then print("^8ERROR: ^3You have selected ^8'qb'^3 as the notification system but the ^8'qb-core'^3 resource is not running.^0") return end
elseif NotifyType == 'esx' then
    if not ESX then print("^8ERROR: ^3You have selected ^8'esx'^3 as the notification system but the ^8'es_extended'^3 resource is not running.^0") return end
elseif NotifyType == 'mythic' then
    if not exports['mythic_notify'] then print("^8ERROR: ^3You have selected ^8'mythic'^3 as the notification system but the ^8'mythic_notify'^3 resource is not running.^0") return end
elseif NotifyType == 'okokNotify' then
    if not exports['okokNotify'] then print("^8ERROR: ^3You have selected ^8'okokNotify'^3 as the notification system but the ^8'okokNotify'^3 resource is not running.^0") return end
end

function Notify(src, header, des, ntype)
    if NotifyType == 'ox' then
        lib.notify(src, { title = header, description = des, type = ntype, position = "top-right" })
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:SendAlert(ntype, header, des, 2500)
    elseif NotifyType == 'qb' then
        QBCore.Functions.Notify(des, ntype, 5000)
    elseif NotifyType == 'esx' then
        ESX.ShowNotification(des)
    elseif NotifyType == 'gta' then
        local text = "~b~"..header..") ~s~ "..des
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(false, true)
    elseif NotifyType == 'okokNotify' then
        exports['okokNotify']:Alert(header, des, 5000, ntype)
    end
end

--------------------------------[Inventory]--------------------------------
local InventoryType = nil
local Inventories = {
    [1] = 'tgiann-inventory',
    [2] = 'ox_inventory',
    [3] = 'codem-inventory',
    [4] = 'qs-inventory',
    [5] = 'esx_inventoryhud',
}

local function VerifyInvType()
    InventoryType = nil
    for i = 1, #Inventories do
        if GetResourceState(Inventories[i]) == "started" then
            InventoryType = Inventories[i]
            print("^Debug: ^3Inventory system "..Inventories[i].." was started.^0")
            break
        end
    end
    if Config.Halloween.Inventory ~= "custom" and Config.Halloween.Inventory ~= InventoryType then
        print("^8ERROR: ^3Inventory system "..Config.Halloween.Inventory.." not found.^0")
    end
end
VerifyInvType()

function AddInvItem(src, item, amount, info)
    if not InventoryType then print("^8ERROR: ^3Inventory system "..Config.Halloween.Inventory.." not found.^0") return false end
    if InventoryType == "tgiann-inventory" then
        exports['tgiann-inventory']:AddItem(source, item, amount)
		TriggerClientEvent('inventory:client:ItemBox', src, item, 'add', amount)
        print('IM WORKING HERE!')
        return true
    elseif InventoryType == "ox_inventory" then
        exports.ox_inventory:AddItem(src, item, amount, info)
        return true
    elseif InventoryType == "codem-inventory" then
        exports['codem-inventory']:AddItem(src, item, amount, nil, info)
        return true
    elseif InventoryType == "qs-inventory" then
        exports['qs-inventory']:AddItem(src, item, amount, nil, info)
        return true
    elseif InventoryType == "esx_inventoryhud" then
        local Player = ESX.GetPlayerFromId(src)
        Player.addInventoryItem(item, amount)
        return true
    end
    print('WHERE AM I!!!')
    return false
end

function RemoveInvItem(src, item, amount, info)
    if not InventoryType then print("^8ERROR: ^3Inventory system "..Config.Halloween.Inventory.." not found.^0") return false end
    if InventoryType == "tgiann-inventory" then
        exports['tgiann-inventory']:RemoveItem(src, item, amount)
        return true
    elseif InventoryType == "ox_inventory" then
        exports.ox_inventory:RemoveItem(src, item, amount, info)
        return true
    elseif InventoryType == "codem-inventory" then
        exports['codem-inventory']:RemoveItem(src, item, amount)
        return true
    elseif InventoryType == "qs-inventory" then
        exports['qs-inventory']:RemoveItem(src, item, amount, nil, info)
        return true
    elseif InventoryType == "esx_inventoryhud" then
        local Player = ESX.GetPlayerFromId(src)
        Player.removeInventoryItem(item, amount)
        return true
    end
    return false
end

function GetInvItemCount(src, item)
    if not InventoryType then print("^8ERROR: ^3Inventory system "..Config.Halloween.Inventory.." not found.^0") return false end
    local Count = 0
    if InventoryType == "tgiann-inventory" then
        Count = exports['tgiann-inventory']:GetItemCount(src, item)
    elseif InventoryType == "ox_inventory" then
        Count = exports.ox_inventory:GetItemCount(src, item)
    elseif InventoryType == "codem-inventory" then
        Count = exports['codem-inventory']:GetItemsTotalAmount(src, item)
    elseif InventoryType == "qs-inventory" then
        Count = exports['qs-inventory']:GetItemTotalAmount(src, item)
    elseif InventoryType == "esx_inventoryhud" then
        local Player = ESX.GetPlayerFromId(src)
        Count = Player.getInventoryItem(item).count
    end
    return Count
end

lib.callback.register('server:halkagorib:fetchinvtype', function()
    return InventoryType
end)
