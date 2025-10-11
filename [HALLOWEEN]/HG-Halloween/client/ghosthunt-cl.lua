
local function GhostPhotoComp()
    lib.registerContext({
        id = 'ghostcomp_menu',
        title = Config.Halloween.Locals.GhostHunt['MenuTitle'],
        menu = 'MissionMainMenu_menu',
        options = {
            {
                title = Config.Halloween.Locals.GhostHunt['GHMenu1Title'],
                description = Config.Halloween.Locals.GhostHunt['GHMenu1Des'],
                icon = 'fa fa-external-link-square',
                onSelect = function()
                    lib.alertDialog({
                        header = Config.Halloween.Locals.GhostHunt['MenuTitle'],
                        content = Config.Halloween.Locals.GhostHunt['GHMenu1ContentDes'],
                        centered = true,
                        cancel = true
                    })
                end,
            },
            {
                title = Config.Halloween.Locals.GhostHunt['GHMenu2Title'],
                description = Config.Halloween.Locals.GhostHunt['GHMenu2Des'],
                icon = 'fa fa-id-card',
                onSelect = function()
                    lib.callback('server:HG-Halloween:ghosthuntinfo', nil, function(Data)
                        if Data and #Data > 0 then
                            local EntriesList = {}
                            for k, v in pairs(Data) do
                                EntriesList[#EntriesList + 1] = {
                                    title = v.name,
                                    description = 'Found: (' .. v.found .. '/' .. #Config.Halloween.GhostHunt.GhostsLocation .. ')',
                                    icon = 'fa fa-camera-retro',
                                    readOnly = true
                                }
                            end
                            lib.registerContext({
                                id = 'ghostcomp_entries',
                                title = Config.Halloween.Locals.GhostHunt['GHMenu2Head'],
                                menu = 'ghostcomp_menu',
                                options = EntriesList
                            })
                            lib.showContext('ghostcomp_entries')
                        else
                            Notify(nil, Config.Halloween.Locals.GhostHunt['GHMenu3NoWinner'], '', 'error')
                        end
                    end)
                end,
            },
            {
                title = Config.Halloween.Locals.GhostHunt['GHMenu3Title'],
                description = Config.Halloween.Locals.GhostHunt['GHMenu3Des'],
                icon = 'fa fa-trophy',
                onSelect = function()
                    lib.callback('server:HG-Halloween:winners', nil, function(Data)
                        if Data and #Data > 0 then
                            local WinnerList = {}
                            for k, v in pairs(Data) do
                                WinnerList[#WinnerList + 1] = {
                                    title = v.name,
                                    description = v.date,
                                    icon = 'fa fa-medal',
                                    readOnly = true
                                }
                            end
                            lib.registerContext({
                                id = 'ghostcomp_winners',
                                title = Config.Halloween.Locals.GhostHunt['GHMenu3Head'],
                                menu = 'ghostcomp_menu',
                                options = WinnerList
                            })
                            lib.showContext('ghostcomp_winners')
                        else
                            Notify(nil, Config.Halloween.Locals.GhostHunt['GHMenu3NoWinner'], '', 'error')
                        end
                    end)
                end,
            }
        }
    })
    lib.showContext('ghostcomp_menu')
end

local function MissionMainMenu()
    lib.registerContext({
        id = 'MissionMainMenu_menu',
        title = '🎃 Halloween Mission Hub',
        options = {
            {
                title = Config.Halloween.Locals.GhostHunt['MenuTitle'],
                description = Config.Halloween.Locals.GhostHunt['MenuDesc'],
                disabled = not Config.Halloween.GhostHunt.Enable,
                onSelect = function()
                    local Alert = lib.alertDialog({
                        header =  Config.Halloween.Locals.GhostHunt['InfoHeader'],
                        content = Config.Halloween.Locals.GhostHunt['InfoContent'],
                        centered = true,
                        cancel = 'cancel',
                    })
                    if Alert == 'confirm' then
                        GhostPhotoComp()
                    end
                end,
            },
            {
                title = Config.Halloween.Locals.PumpkinHunt['MenuTitle'],
                description = Config.Halloween.Locals.PumpkinHunt['MenuDesc'],
                disabled = not Config.Halloween.PumpkinHunt.Enable,
                onSelect = function()
                    local Alert = lib.alertDialog({
                        header = Config.Halloween.Locals.PumpkinHunt['InfoHeader'],
                        content = Config.Halloween.Locals.PumpkinHunt['InfoContent'],
                        centered = true,
                        cancel = 'cancel',
                    })
                end,
            },
            {
                title = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                description = Config.Halloween.Locals.HauntedHouse['MenuDesc'],
                disabled = not Config.Halloween.Mission.Enable,
                onSelect = function()
                    local Alert = lib.alertDialog({
                        header = Config.Halloween.Locals.HauntedHouse['InfoHeader'],
                        content = Config.Halloween.Locals.HauntedHouse['InfoContent'],
                        centered = true,
                    })
                    if Alert == 'confirm' then
                        SetNewWaypoint(Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y)
                        Notify(Config.Halloween.Locals.HauntedHouse['NotifyLocation'], '', 'success')
                    end
                end,
            },
        }
    })
    lib.showContext('MissionMainMenu_menu')
end

CreateThread(function()
    lib.requestModel(Config.Halloween.GhostHunt.NPC.Model)

    local NPC = CreatePed(
        4,
        GetHashKey(Config.Halloween.GhostHunt.NPC.Model),
        Config.Halloween.GhostHunt.NPC.Coords.x,
        Config.Halloween.GhostHunt.NPC.Coords.y,
        Config.Halloween.GhostHunt.NPC.Coords.z,
        Config.Halloween.GhostHunt.NPC.Coords.w,
        false, true
    )

    SetEntityAsMissionEntity(NPC, true, true)
    SetBlockingOfNonTemporaryEvents(NPC, true)
    SetEntityInvincible(NPC, true)
    FreezeEntityPosition(NPC, true)

    -- ✅ Register ox_target after NPC is created
    exports.ox_target:addLocalEntity(NPC, {
        {
            name = 'halloween_ghosthunt_menu',
            icon = 'fa-solid fa-ghost',
            label = Config.Halloween.Locals.Main['MainMenuOpen']:format(keyName),
            onSelect = function()
                MissionMainMenu()
            end
        }
    })
end)



if Config.Halloween.GhostHunt.Enable then

    local GhostSpawned = {}
    local GhostAdded = false
    local GhostRemoved = false
    local function AddGhostSpawned()
        Wait(1000)
        for k, v in pairs(Config.Halloween.GhostHunt.GhostsLocation) do
            local Ghost = CreateObject(Config.Halloween.GhostHunt.GhostModel, v.x, v.y, v.z, false, false, false)
            SetEntityHeading(Ghost, v.w)
            SetEntityAsMissionEntity(Ghost, true, true)
            SetBlockingOfNonTemporaryEvents(Ghost, true)
            SetEntityInvincible(Ghost, true)
            FreezeEntityPosition(Ghost, true)
            table.insert(GhostSpawned, {Ghost = Ghost, Location = v})
            Wait(10)
        end
    end
    local function RemoveGhostSpawned()
        if GhostRemoved then return end
        for k, v in pairs(GhostSpawned) do
            DeleteEntity(v.Ghost)
            Wait(10)
        end
        GhostRemoved = true
        GhostAdded = false
    end

    CreateThread(function()
        while true do
            Wait(5000)
            local Hour = GetClockHours()
            if Config.Halloween.GhostHunt.NightSpawn then
                if Hour >= 20 or Hour <= 6 then
                    if not GhostAdded then
                        GhostAdded = true
                        GhostRemoved = false
                        AddGhostSpawned()
                    end
                elseif not GhostRemoved then
                    GhostRemoved = true
                    GhostAdded = false
                    RemoveGhostSpawned()
                end
            else
                if not GhostAdded then
                    GhostAdded = true
                    GhostRemoved = false
                    AddGhostSpawned()
                end
            end
        end
    end)


    AddEventHandler('onResourceStop', function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for k, v in pairs(GhostSpawned) do
                DeleteEntity(v.Ghost)
                Wait(5)
            end
        end
    end)

    local function TakePicture(k)
        local Ped = PlayerPedId()
        local loc = Config.Halloween.GhostHunt.GhostsLocation[k]
        TaskTurnPedToFaceCoord(Ped, loc.x, loc.y, loc.z, -1)
        Wait(500)

        --Anim
        local dict = "amb@world_human_paparazzi@male@base"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(100)
        end
        TaskPlayAnim(Ped, dict, "base", 8.0, 8.0, -1, 1, 0, false, false, false)
        --Prop
        local model = "prop_pap_camera_01"
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(1)
        end
        local Prop = CreateObject(GetHashKey(model), GetEntityCoords(Ped), true, true, true)
        AttachEntityToEntity(Prop, Ped, GetPedBoneIndex(Ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 2, true)
        Wait(2000)

        --Particle effect
        local PtfxAsset = "scr_bike_business"
        local PtfxName = "scr_bike_cfid_camera_flash"
        RequestNamedPtfxAsset(PtfxAsset)
        while not HasNamedPtfxAssetLoaded(PtfxAsset) do
            Wait(1)
        end
        UseParticleFxAssetNextCall(PtfxAsset)
        StartParticleFxLoopedOnEntity(PtfxName, Prop, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
    
        --Delete the Ghost Prop
        for k, v in pairs(Config.Halloween.GhostHunt.GhostsLocation) do
            local Distance = #(GetEntityCoords(Ped) - vector3(v.x, v.y, v.z))
            if Distance < 25.0 then
                if GhostSpawned[k] then
                    DeleteEntity(GhostSpawned[k].Ghost)
                    table.remove(GhostSpawned, k)
                    break
                end
            end
        end

        Wait(2000)
        ClearPedTasks(Ped)
        DeleteEntity(Prop)

        TriggerServerEvent('server:HG-Halloween:foundghost', k)
    end

    RegisterCommand(Config.Halloween.GhostHunt.PhotoCommand, function()
        local Ped = PlayerPedId()
        local Pos = GetEntityCoords(Ped)
        
        for k, v in pairs(Config.Halloween.GhostHunt.GhostsLocation) do
            local Distance = #(Pos - vector3(v.x, v.y, v.z))
            if Distance < 25.0 then
                TakePicture(k)
                return
            end
        end
        Notify(Config.Halloween.Locals.GhostHunt['NotifyNoClose'], '', 'error')
    end, false)



    --Create Blip
    if Config.Halloween.GhostHunt.Blip.Enable then
        CreateThread(function()
            local Blip = AddBlipForCoord(Config.Halloween.GhostHunt.NPC.Coords.x, Config.Halloween.GhostHunt.NPC.Coords.y, Config.Halloween.GhostHunt.NPC.Coords.z)
            SetBlipSprite(Blip, Config.Halloween.GhostHunt.Blip.Sprite)
            SetBlipDisplay(Blip, 4)
            SetBlipScale(Blip, Config.Halloween.GhostHunt.Blip.Scale)
            SetBlipColour(Blip, Config.Halloween.GhostHunt.Blip.Color)
            SetBlipAsShortRange(Blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Halloween.GhostHunt.Blip.Name)
            EndTextCommandSetBlipName(Blip)
        end)
    end

end