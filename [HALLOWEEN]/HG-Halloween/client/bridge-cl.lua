
--------------------------------[Settings]--------------------------------
local NotifyType = Config.Halloween.Notify


--------------------------------[Notify]--------------------------------

if NotifyType == 'qb' then
    if not QBCore then print("^8ERROR: ^3You have selected ^8'qb'^3 as the notification system but the ^8'qb-core'^3 resource is not running.^0") return end
elseif NotifyType == 'esx' then
    if not ESX then print("^8ERROR: ^3You have selected ^8'esx'^3 as the notification system but the ^8'es_extended'^3 resource is not running.^0") return end
elseif NotifyType == 'mythic' then
    if not exports['mythic_notify'] then print("^8ERROR: ^3You have selected ^8'mythic'^3 as the notification system but the ^8'mythic_notify'^3 resource is not running.^0") return end
elseif NotifyType == 'okokNotify ' then
    if not exports['okokNotify'] then print("^8ERROR: ^3You have selected ^8'okokNotify'^3 as the notification system but the ^8'okokNotify'^3 resource is not running.^0") return end
end

function Notify(header, des, ntype)
    if NotifyType == 'ox' then
        lib.notify({ title = header, description = des, type = ntype })
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
if Config.Halloween.Inventory == 'tgiann-inventory' then
    if not QBCore then print("^8ERROR: ^3You have selected ^8'tgiann-inventory'^3 as the inventory system but the ^8'qb-core'^3 resource is not running.^0") return end
elseif Config.Halloween.Inventory == 'ox_inventory' then
    if not exports.ox_inventory then print("^8ERROR: ^3You have selected ^8'ox_inventory'^3 as the inventory system but the ^8'ox_inventory'^3 resource is not running.^0") return end
elseif Config.Halloween.Inventory == 'codem-inventory' then
    if not exports['codem-inventory'] then print("^8ERROR: ^3You have selected ^8'codem-inventory'^3 as the inventory system but the ^8'codem-inventory'^3 resource is not running.^0") return end
elseif Config.Halloween.Inventory == 'qs-inventory' then
    if not exports['qs-inventory'] then print("^8ERROR: ^3You have selected ^8'qs-inventory'^3 as the inventory system but the ^8'qs-inventory'^3 resource is not running.^0") return end
elseif Config.Halloween.Inventory == 'esx_inventoryhud' then
    if not ESX then print("^8ERROR: ^3You have selected ^8'esx_inventoryhud'^3 as the inventory system but the ^8'es_extended'^3 resource is not running.^0") return end
end


function ItemInfo(Item)
    local Data = lib.callback.await('server:halkagorib:fetchinvtype', false)
    if Data then
        if Data == 'tgiann-inventory' then
            return QBCore.Shared.Items[Item]
        elseif Data == 'ox_inventory' then
            return exports.ox_inventory:Items(Item)
        elseif Data == 'codem-inventory' then
            return exports['codem-inventory']:GetItem(Item)
        elseif Data == 'qs-inventory' then
            return exports['qs-inventory']:GetItem(Item)
        elseif Data == 'esx_inventoryhud' then
            return ESX.GetItems()[Item]
        end
    end
end