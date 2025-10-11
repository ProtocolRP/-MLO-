Framework = nil

-- Framework Detection Function
local function GetFramework()
    if Config.Framework == "ESX" then
        local ESX = nil
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        
        -- Wait for ESX to load
        while not ESX do
            Citizen.Wait(10)
        end
        
        return ESX
    elseif Config.Framework == "QBCore" then
        return exports["qb-core"]:GetCoreObject()
    elseif Config.Framework == "OLDQBCore" then
        local QBCore = nil
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)
        
        -- Wait for QBCore to load
        while not QBCore do
            Citizen.Wait(10)
        end
        
        return QBCore
    end
    
    return nil
end

-- Initialize Framework
Framework = GetFramework()

-- Modern Notification System
local function SendNotification(source, message, type, duration)
    if Config.NotificationSystem == "qb" then
        TriggerClientEvent('QBCore:Notify', source, message, type, duration or 5000)
    elseif Config.NotificationSystem == "esx" then
        TriggerClientEvent('esx:showNotification', source, message)
    elseif Config.NotificationSystem == "ox" then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Shop',
            description = message,
            type = type,
            duration = duration or 5000
        })
    else
        -- Custom notification system
        TriggerClientEvent('es-shop:notification', source, message, type, duration)
    end
end

-- Modern Item System
local function GiveItem(Player, itemModel, quantity, isESX)
    local success = false
    
    if isESX then
        -- ESX Item System
        if itemModel:find("WEAPON_") then
            -- It's a weapon
            Player.addWeapon(itemModel, 0)
            success = true
        else
            -- It's a regular item
            Player.addInventoryItem(itemModel, quantity)
            success = true
        end
    else
        -- QBCore Item System
        if itemModel:find("WEAPON_") then
            -- It's a weapon
            Player.Functions.AddItem(itemModel, 1, false, nil)
            success = true
        else
            -- It's a regular item
            Player.Functions.AddItem(itemModel, quantity, false, nil)
            success = true
        end
        
        -- Trigger inventory update for QBCore
        if success then
            local itemData = Player.Functions.GetItemByName(itemModel)
            if itemData then
                TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, itemData, "add")
            end
        end
    end
    
    return success
end

-- Count player's pumpkin coins
local function GetCoinCount(Player, isESX)
    if isESX then
        local item = Player.getInventoryItem(Config.CurrencyItem)
        return (item and item.count) or 0
    else
        local item = Player.Functions.GetItemByName(Config.CurrencyItem)
        return (item and item.amount) or 0
    end
end

-- Remove pumpkin coins (returns true on success)
local function RemoveCoins(Player, amount, isESX)
    local have = GetCoinCount(Player, isESX)
    if have < amount then return false end

    if isESX then
        Player.removeInventoryItem(Config.CurrencyItem, amount)
        return true
    else
        local removed = Player.Functions.RemoveItem(Config.CurrencyItem, amount)
        if removed then
            -- Optional: show item box animation in qb-inventory
            local src = Player.PlayerData and Player.PlayerData.source
            if src then
                TriggerClientEvent('inventory:client:ItemBox', src, Player.Functions.GetItemByName(Config.CurrencyItem), "remove")
            end
            return true
        end
        return false
    end
end

local function GetPlayerCoinBalance(Player, isESX)
    return GetCoinCount(Player, isESX)
end


-- Find Item in Config
local function FindItemInConfig(itemId)
    for shopKey, shopData in pairs(Config.Items) do
        if shopData.Items then
            for _, item in pairs(shopData.Items) do
                if item.id == itemId then
                    return item
                end
            end
        end
    end
    return nil
end

-- Wait for Framework to be ready
Citizen.CreateThread(function()
    while not Framework do
        Citizen.Wait(100)
    end
    
    print("[ES-SHOP] Framework loaded: " .. Config.Framework)
    
    -- Framework Detection and Initialization
    if Config.Framework == "ESX" then
        -- Get User Money Callback
        Framework.RegisterServerCallback("es-shop:getUserMoney", function(source, cb)
            local xPlayer = Framework.GetPlayerFromId(source)
            if xPlayer then
                local cash, bank = GetPlayerMoneyWithMethod(xPlayer, "cash", true), GetPlayerMoneyWithMethod(xPlayer, "bank", true)
                cb(cash, bank)
            else
                cb(0, 0)
            end
        end)

        -- Buy Item Callback
        Framework.RegisterServerCallback("es-shop:buyItem", function(source, cb, data)
            print("[ES-SHOP] Buy item callback triggered", json.encode(data))
            
            local xPlayer = Framework.GetPlayerFromId(source)
            if not xPlayer then
                print("[ES-SHOP] Player not found")
                cb(false, "Player not found")
                return
            end

            local item = FindItemInConfig(data.id)
            if not item then
                print("[ES-SHOP] Item not found:", data.id)
                cb(false, "Item not found")
                SendNotification(source, "Item not found in shop!", "error")
                return
            end

            local quantity = data.quantity or 1
            local totalPrice = item.price * quantity

            -- Check money
            local cash, bank = GetPlayerMoneyWithMethod(xPlayer, "cash", true), GetPlayerMoneyWithMethod(xPlayer, "bank", true)
            if cash < totalPrice then
                print("[ES-SHOP] Not enough money:", cash, totalPrice)
                cb(false, "Not enough money")
                SendNotification(source, "Not enough money! Need $" .. totalPrice, "error")
                return
            end

            -- Check level requirement
            if Config.ShopFeatures.EnableLevelRestrictions and item.level then
                local playerLevel = xPlayer.get('level') or 1
                if playerLevel < item.level then
                    cb(false, "Level requirement not met")
                    SendNotification(source, "Level " .. item.level .. " required!", "error")
                    return
                end
            end

            -- Process purchase
            if RemovePlayerMoneyWithMethod(xPlayer, totalPrice, "cash", true) then
                local success = GiveItem(xPlayer, item.model, quantity, true)
                
                if success then
                    local newCash, newBank = GetPlayerMoneyWithMethod(xPlayer, "cash", true), GetPlayerMoneyWithMethod(xPlayer, "bank", true)
                    print("[ES-SHOP] Purchase successful:", item.name, quantity, totalPrice)
                    
                    cb(true, "Purchase successful", {
                        cash = newCash,
                        bank = newBank,
                        item = item,
                        quantity = quantity
                    })
                    
                    SendNotification(source, "Purchased " .. quantity .. "x " .. item.name .. " for $" .. totalPrice, "success")
                    
                    -- Log the purchase
                    print(string.format("[ES-SHOP] Player %s purchased %dx %s for $%d", 
                        xPlayer.identifier, quantity, item.name, totalPrice))
                else
                    -- Refund money if item giving failed
                    xPlayer.addMoney(totalPrice)
                    cb(false, "Failed to give item")
                    SendNotification(source, "Failed to give item! Money refunded.", "error")
                end
            else
                cb(false, "Payment failed")
                SendNotification(source, "Payment failed!", "error")
            end
        end)

        -- Buy Multiple Items (Cart) Callback
        Framework.RegisterServerCallback("es-shop:buyCart", function(source, cb, cartData)
            print("[ES-SHOP] Buy cart callback triggered", json.encode(cartData))
            
            local xPlayer = Framework.GetPlayerFromId(source)
            if not xPlayer then
                cb(false, "Player not found")
                return
            end

            -- Extract payment method and items
            local paymentMethod = cartData.paymentMethod or "cash"
            local items = cartData.items or cartData
            
            print("[ES-SHOP] Payment method:", paymentMethod)
            print("[ES-SHOP] Items to process:", json.encode(items))
            
            local totalPrice = 0
            local validItems = {}

            -- Validate all items and calculate total price
            for _, cartItem in pairs(items) do
                print("[ES-SHOP] Processing cart item:", json.encode(cartItem))
                local item = FindItemInConfig(cartItem.id)
                if item then
                    print("[ES-SHOP] Item found:", item.name, "Price:", item.price, "Quantity:", cartItem.quantity)
                    table.insert(validItems, {
                        item = item,
                        quantity = cartItem.quantity
                    })
                    totalPrice = totalPrice + (item.price * cartItem.quantity)
                else
                    print("[ES-SHOP] Item not found with ID:", cartItem.id)
                end
            end

            print("[ES-SHOP] Valid items count:", #validItems, "Total price:", totalPrice)

            if #validItems == 0 then
                cb(false, "No valid items in cart")
                SendNotification(source, "No valid items in cart!", "error")
                return
            end

            -- Check money based on payment method
            local currentBalance = GetPlayerMoneyWithMethod(xPlayer, paymentMethod, true)
            if currentBalance < totalPrice then
                cb(false, "Not enough money")
                SendNotification(source, "Not enough " .. paymentMethod .. "! Need $" .. totalPrice, "error")
                return
            end

            -- Process purchase with selected payment method
            if RemovePlayerMoneyWithMethod(xPlayer, totalPrice, paymentMethod, true) then
                local successCount = 0
                local failedItems = {}

                for _, validItem in pairs(validItems) do
                    local success = GiveItem(xPlayer, validItem.item.model, validItem.quantity, true)
                    if success then
                        successCount = successCount + 1
                    else
                        table.insert(failedItems, validItem.item.name)
                    end
                end

                local newCash, newBank = GetPlayerMoneyWithMethod(xPlayer, "cash", true), GetPlayerMoneyWithMethod(xPlayer, "bank", true)
                cb(true, "Purchase completed", {
                    cash = newCash,
                    bank = newBank,
                    successCount = successCount,
                    failedItems = failedItems
                })

                if #failedItems > 0 then
                    SendNotification(source, "Some items failed to be given: " .. table.concat(failedItems, ", "), "error")
                else
                    SendNotification(source, "Successfully purchased " .. successCount .. " items for $" .. totalPrice .. " via " .. paymentMethod:upper(), "success")
                end
            else
                cb(false, "Payment failed")
                SendNotification(source, "Payment failed!", "error")
            end
        end)

    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        -- Get User Money Callback
        Framework.Functions.CreateCallback("es-shop:getUserMoney", function(source, cb)
            local Player = Framework.Functions.GetPlayer(source)
            if Player then
                local coins = GetPlayerCoinBalance(Player, false)
                cb(coins, 0) -- second value kept for compatibility
            else
                cb(0, 0)
            end
        end)


        -- Buy Item Callback
        -- Buy Item Callback (QBCore, coins only)
        Framework.Functions.CreateCallback("es-shop:buyItem", function(source, cb, data)
            print("[ES-SHOP] Buy item callback triggered", json.encode(data))
        
            local Player = Framework.Functions.GetPlayer(source)
            if not Player then
                print("[ES-SHOP] Player not found")
                cb(false, "Player not found")
                return
            end
        
            local item = FindItemInConfig(data.id)
            if not item then
                print("[ES-SHOP] Item not found:", data.id)
                cb(false, "Item not found")
                SendNotification(source, "Item not found in shop!", "error")
                return
            end
        
            local quantity = data.quantity or 1
            local totalPrice = (item.price or 0) * quantity
        
            -- Check level requirement (if enabled)
            if Config.ShopFeatures and Config.ShopFeatures.EnableLevelRestrictions and item.level then
                local playerLevel = (Player.PlayerData and Player.PlayerData.metadata and Player.PlayerData.metadata.level) or 1
                if playerLevel < item.level then
                    cb(false, "Level requirement not met")
                    SendNotification(source, "Level " .. item.level .. " required!", "error")
                    return
                end
            end
        
            -- Check coins
            local coins = GetPlayerCoinBalance(Player, false)
            if coins < totalPrice then
                print("[ES-SHOP] Not enough coins:", coins, totalPrice)
                cb(false, "Not enough coins")
                SendNotification(source, "Not enough pumpkin coins! Need x" .. totalPrice, "error")
                return
            end
        
            -- Process purchase with coins
            if RemoveCoins(Player, totalPrice, false) then
                local success = GiveItem(Player, item.model, quantity, false)
            
                if success then
                    local newCoins = GetPlayerCoinBalance(Player, false)
                    print("[ES-SHOP] Purchase successful:", item.name, quantity, totalPrice)
                
                    cb(true, "Purchase successful", {
                        coins = newCoins,          -- for UIs that can show coin balance
                        cash = 0, bank = 0,        -- kept for backward UI compatibility
                        item = item,
                        quantity = quantity
                    })
                
                    SendNotification(source, ("Purchased %dx %s for x%d pumpkin coins"):format(quantity, item.name, totalPrice), "success")
                
                    -- Log the purchase
                    print(string.format(
                        "[ES-SHOP] Player %s purchased %dx %s for x%d pumpkin coins",
                        Player.PlayerData.citizenid, quantity, item.name, totalPrice
                    ))
                else
                    -- Refund coins if giving failed
                    Player.Functions.AddItem(Config.CurrencyItem, totalPrice)
                    local src = Player.PlayerData and Player.PlayerData.source
                    if src then
                        TriggerClientEvent('inventory:client:ItemBox', src, Player.Functions.GetItemByName(Config.CurrencyItem), "add")
                    end
                
                    cb(false, "Failed to give item")
                    SendNotification(source, "Failed to give item! Coins refunded.", "error")
                end
            else
                cb(false, "Payment failed")
                SendNotification(source, "Coin payment failed!", "error")
            end
        end)


        -- Buy Multiple Items (Cart) Callback
        -- Buy Multiple Items (Cart) Callback (QBCore, coins only)
        Framework.Functions.CreateCallback("es-shop:buyCart", function(source, cb, cartData)
            print("[ES-SHOP] Buy cart callback triggered", json.encode(cartData))
        
            local Player = Framework.Functions.GetPlayer(source)
            if not Player then
                cb(false, "Player not found")
                return
            end
        
            -- Always pay with pumpkin coins; ignore/override any provided payment method
            local items = cartData.items or cartData
            local totalPrice = 0
            local validItems = {}
        
            -- Validate all items and calculate total price
            for _, cartItem in pairs(items) do
                print("[ES-SHOP] Processing cart item:", json.encode(cartItem))
                local item = FindItemInConfig(cartItem.id)
                local qty = cartItem.quantity or 1
            
                if item and (item.price ~= nil) then
                    print("[ES-SHOP] Item found:", item.name, "Price:", item.price, "Quantity:", qty)
                
                    -- Optional stock check
                    if Config.ShopFeatures and Config.ShopFeatures.EnableStock and item.itemStock then
                        if item.itemStock < qty then
                            print("[ES-SHOP] Out of stock:", item.name)
                            SendNotification(source, ("Not enough stock for %s!"):format(item.name), "error")
                        else
                            table.insert(validItems, { item = item, quantity = qty })
                            totalPrice = totalPrice + (item.price * qty)
                        end
                    else
                        table.insert(validItems, { item = item, quantity = qty })
                        totalPrice = totalPrice + (item.price * qty)
                    end
                else
                    print("[ES-SHOP] Item not found with ID:", cartItem.id)
                end
            end
        
            print("[ES-SHOP] Valid items count:", #validItems, "Total price:", totalPrice)
        
            if #validItems == 0 then
                cb(false, "No valid items in cart")
                SendNotification(source, "No valid items in cart!", "error")
                return
            end
        
            -- Check coins
            local coins = GetPlayerCoinBalance(Player, false)
            if coins < totalPrice then
                cb(false, "Not enough coins")
                SendNotification(source, "Not enough pumpkin coins! Need x" .. totalPrice, "error")
                return
            end
        
            -- Charge coins once
            if not RemoveCoins(Player, totalPrice, false) then
                cb(false, "Payment failed")
                SendNotification(source, "Coin payment failed!", "error")
                return
            end
        
            -- Give items
            local successCount = 0
            local failedItems = {}
        
            for _, v in pairs(validItems) do
                local ok = GiveItem(Player, v.item.model, v.quantity, false)
                if ok then
                    successCount = successCount + 1
                
                    -- Optional stock decrement
                    if Config.ShopFeatures and Config.ShopFeatures.EnableStock and v.item.itemStock then
                        v.item.itemStock = math.max(0, v.item.itemStock - v.quantity)
                    end
                else
                    table.insert(failedItems, v.item.name)
                end
            end
        
            local newCoins = GetPlayerCoinBalance(Player, false)
        
            cb(true, "Purchase completed", {
                coins = newCoins,      -- for UIs that can show coin balance
                cash = 0, bank = 0,    -- kept for backward UI compatibility
                successCount = successCount,
                failedItems = failedItems
            })
        
            if #failedItems > 0 then
                SendNotification(source, "Some items failed to be given: " .. table.concat(failedItems, ", "), "error")
            else
                SendNotification(source, "Successfully purchased " .. successCount .. " items for x" .. totalPrice .. " pumpkin coins", "success")
            end
        end)
    end

    -- Legacy support for old "control" callback
    if Config.Framework == "ESX" then
        Framework.RegisterServerCallback("control", function(source, cb, data)
            -- Convert old format to new format
            local newData = {
                id = data.id or data.item_id,
                quantity = data.quantity or 1
            }
            
            Framework.TriggerServerCallback("es-shop:buyItem", source, function(success, message, result)
                if success then
                    cb(true, result.cash, result.bank)
                else
                    cb(false, 0, 0)
                end
            end, newData)
        end)
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.CreateCallback("control", function(source, cb, data)
            -- Convert old format to new format
            local newData = {
                id = data.id or data.item_id,
                quantity = data.quantity or 1
            }
            
            Framework.Functions.TriggerCallback("es-shop:buyItem", source, function(success, message, result)
                if success then
                    cb(true, result.cash, result.bank)
                else
                    cb(false, 0, 0)
                end
            end, newData)
        end)
    end
end)
