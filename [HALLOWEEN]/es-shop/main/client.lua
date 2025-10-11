local Framework, display = nil, false

-- Framework Detection
if Config.Framework == "ESX" then
    Citizen.CreateThread(function()
        while not Framework do
            TriggerEvent("esx:getSharedObject", function(obj) Framework = obj end)
            Citizen.Wait(4)
        end
        print("[ES-SHOP] Client ESX Framework loaded")
    end)
elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
    if Config.Framework == "OLDQBCore" then
        while not Framework do
            TriggerEvent("QBCore:GetObject", function(obj) Framework = obj end)
            Citizen.Wait(4)
        end
    else
        Framework = exports["qb-core"]:GetCoreObject()
    end
    print("[ES-SHOP] Client QBCore Framework loaded")
end

-- Modern Progress Bar System
local function ShowProgressBar(text, duration)
    return Citizen.CreateThread(function()
        if Config.BuySettings.UseProgressBar then
            if exports['progressbar'] then
                exports['progressbar']:Progress({
                    name = "shop_purchase",
                    duration = duration,
                    label = text,
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                })
                Citizen.Wait(duration)
            elseif exports['ox_lib'] then
                lib.progressBar({
                    duration = duration,
                    label = text,
                    useWhileDead = false,
                    canCancel = false,
                })
            else
                -- Fallback to simple wait
                Citizen.Wait(duration)
            end
        end
    end)
end

-- Modern Notification System (Client-side)
RegisterNetEvent('es-shop:notification')
AddEventHandler('es-shop:notification', function(message, type, duration)
    if Config.NotificationSystem == "custom" then
        -- Custom notification implementation
        SendNUIMessage({
            type = "notification",
            message = message,
            notificationType = type,
            duration = duration
        })
    end
end)

-- Modern Buy Single Item
RegisterNUICallback("buyItem", function(data, cb)
    print("[ES-SHOP] Client buyItem triggered:", json.encode(data))
    
    -- Start progress bar if enabled (non-blocking)
    if Config.BuySettings.UseProgressBar then
        ShowProgressBar("Purchasing item...", Config.BuySettings.ProgressBarDuration)
    end
    
    if Config.Framework == "ESX" then
        Framework.TriggerServerCallback("es-shop:buyItem", function(success, message, result)
            print("[ES-SHOP] Client received buyItem response:", success, message)
            
            if success then
                -- Update player balance in UI
                SendNUIMessage({
                    type = "updateBalance",
                    cash = result.cash,
                    bank = result.bank
                })
                
                -- Show purchase effects
                if Config.BuySettings.ShowPurchaseEffects then
                    SendNUIMessage({
                        type = "purchaseEffect",
                        item = result.item,
                        quantity = result.quantity
                    })
                end
                
                cb({ success = true, message = message, result = result })
            else
                cb({ success = false, message = message })
            end
        end, data)
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.TriggerCallback("es-shop:buyItem", function(success, message, result)
            print("[ES-SHOP] Client received buyItem response:", success, message)
            
            if success then
                -- Update player balance in UI
                SendNUIMessage({
                    type = "updateBalance",
                    cash = result.cash,
                    bank = result.bank
                })
                
                -- Show purchase effects
                if Config.BuySettings.ShowPurchaseEffects then
                    SendNUIMessage({
                        type = "purchaseEffect",
                        item = result.item,
                        quantity = result.quantity
                    })
                end
                
                cb({ success = true, message = message, result = result })
            else
                cb({ success = false, message = message })
            end
        end, data)
    else
        -- No framework detected, return error
        cb({ success = false, message = "Framework not detected" })
    end
end)

-- Modern Buy Cart (Multiple Items)
RegisterNUICallback("buyCart", function(data, cb)
    print("[ES-SHOP] Client buyCart triggered:", json.encode(data))
    
    -- Start progress bar if enabled (non-blocking)
    if Config.BuySettings.UseProgressBar then
        ShowProgressBar("Processing cart purchase...", Config.BuySettings.ProgressBarDuration + 500)
    end
    
    if Config.Framework == "ESX" then
        Framework.TriggerServerCallback("es-shop:buyCart", function(success, message, result)
            print("[ES-SHOP] Client received buyCart response:", success, message)
            
            if success then
                -- Update player balance in UI
                SendNUIMessage({
                    type = "updateBalance",
                    cash = result.cash,
                    bank = result.bank
                })
                
                -- Show purchase effects
                if Config.BuySettings.ShowPurchaseEffects then
                    SendNUIMessage({
                        type = "cartPurchaseEffect",
                        successCount = result.successCount,
                        failedItems = result.failedItems
                    })
                end
                
                cb({ success = true, message = message, result = result })
            else
                cb({ success = false, message = message })
            end
        end, data)
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.TriggerCallback("es-shop:buyCart", function(success, message, result)
            print("[ES-SHOP] Client received buyCart response:", success, message)
            
            if success then
                -- Update player balance in UI
                SendNUIMessage({
                    type = "updateBalance",
                    cash = result.cash,
                    bank = result.bank
                })
                
                -- Show purchase effects
                if Config.BuySettings.ShowPurchaseEffects then
                    SendNUIMessage({
                        type = "cartPurchaseEffect",
                        successCount = result.successCount,
                        failedItems = result.failedItems
                    })
                end
                
                cb({ success = true, message = message, result = result })
            else
                cb({ success = false, message = message })
            end
        end, data)
    else
        -- No framework detected, return error
        cb({ success = false, message = "Framework not detected" })
    end
end)

-- Get User Money
RegisterNUICallback("getUserMoney", function(data, cb)
    print("[ES-SHOP] Client getUserMoney triggered")
    
    if Config.Framework == "ESX" then
        Framework.TriggerServerCallback("es-shop:getUserMoney", function(cash, bank)
            print("[ES-SHOP] Client received money:", cash, bank)
            cb({ cash = cash, bank = bank })
        end)
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.TriggerCallback("es-shop:getUserMoney", function(cash, bank)
            print("[ES-SHOP] Client received money:", cash, bank)
            cb({ cash = cash, bank = bank })
        end)
    else
        cb({ cash = 0, bank = 0 })
    end
end)

-- Legacy Buy Support (for backward compatibility)
RegisterNUICallback("buy", function(data, cb)
    print("[ES-SHOP] Legacy buy callback triggered, redirecting to buyItem")
    
    -- Convert old format to new format if needed
    local newData = {
        id = data.id or data.item_id,
        quantity = data.quantity or 1
    }
    
    -- Trigger the new buyItem callback
    TriggerEvent('es-shop:buyItemInternal', newData, cb)
end)

-- Internal event for buyItem to avoid circular calls
RegisterNetEvent('es-shop:buyItemInternal')
AddEventHandler('es-shop:buyItemInternal', function(data, cb)
    -- Use the legacy control callback for backward compatibility
    if Config.Framework == "ESX" then
        Framework.TriggerServerCallback("control", function(result, userCash, userBank)
            if result then
                SendNUIMessage({type = "updateBalance", cash = userCash, bank = userBank})
                cb({success = true, item = data})
            else
                cb({success = false, message = 'Not Enough Money'})
                TriggerEvent('QBCore:Notify', 'Not Enough Money On It', 'error', 3000)
            end
        end, data)
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Framework.Functions.TriggerCallback("control", function(result, userCash, userBank)
            if result then
                SendNUIMessage({type = "updateBalance", cash = userCash, bank = userBank})
                cb({success = true, item = data})
            else
                cb({success = false, message = 'Not Enough Money'})
                TriggerEvent('QBCore:Notify', 'Not Enough Money On It', 'error', 3000)
            end
        end, data)
    end
end)


RegisterNUICallback("exit", function() SetDisplay(false) end)

CreateThread(function()
    Wait(1000)
    Config.Functions.CreateBlips()

    for _, v in ipairs(Config.Locations) do
        local model = GetHashKey(v.hash)
        LoadModel(model)

        local ped = CreatePed(4, model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.heading, false, true)
        SetEntityAsMissionEntity(ped, true, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        -- ox_target registration
        exports.ox_target:addLocalEntity(ped, {
            {
                label = 'Open Shop',
                icon = 'fas fa-shopping-cart',
                distance = 2.0,
                onSelect = function()
                    local shopData = Config.Items[v.shop]
                    local categories = Config.Categories[v.shop]
        
                    SendNUIMessage({
                        type = "ui",
                        shop = shopData,
                        categories = categories,
                        shopName = v.ui
                    })
                    SetDisplay(true)
                end
            }
        })

        SetModelAsNoLongerNeeded(model)
    end
end)


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
end

function LoadModel(model)
    if type(model) == "string" then model = GetHashKey(model) end
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
end

function DrawText3D(x, y, z, text, scale, font, r, g, b, a)
    -- Varsayılan değerler
    scale = scale or 1.0
    font = font or 4       -- GTA V default font (4), 0-7 arasında değişir
    r = r or 255
    g = g or 255
    b = b or 255
    a = a or 255

    local onScreen, screenX, screenY = World3dToScreen2d(x, y, z)
    if not onScreen then return end

    local camCoords = GetGameplayCamCoords()
    local dist = #(vector3(camCoords.x, camCoords.y, camCoords.z) - vector3(x, y, z))
    
    -- Daha stabil ölçek hesaplama
    local fov = GetGameplayCamFov()
    local scaleMultiplier = (1 / dist) * (1 / fov) * 100 * scale

    SetTextScale(0.0, 0.55 * scaleMultiplier) -- daha okunaklı bir sabitle değiştirildi
    SetTextFont(font)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(screenX, screenY)
end
