if Config.Halloween.PumpkinHunt.Enable then

    local PumpkinOpened = {}

    local PumpkinSpawned = {}

    local function SpawnScaryNPC(Loc)
        local Ped = PlayerPedId()
        local npcModel = `u_m_y_zombie_01`

        local Link = Config.Halloween.PumpkinHunt.Audio.ScaryNPC
        exports["xsound"]:PlayUrlPos(Link, Link, Config.Halloween.PumpkinHunt.Audio.Volume, vector3(Loc.x, Loc.y, Loc.z), false)

        RequestModel(npcModel)
        while not HasModelLoaded(npcModel) do
            Wait(0)
        end
        
        local scaryNPC = CreatePed(4, npcModel, Loc.x, Loc.y, Loc.z+1.0, Loc.w, true, false)
        SetEntityAsMissionEntity(scaryNPC, true, true)
        SetBlockingOfNonTemporaryEvents(scaryNPC, true)
        TaskCombatPed(scaryNPC, Ped, 0, 16)

        lib.requestAnimDict('anim@ingame@move_m@zombie@core')
        TaskPlayAnim(scaryNPC, 'anim@ingame@move_m@zombie@core', 'walk_up', 8.0, 1.0, -1, 1, 0, 0, 0, 0)
        SetEntityRotation(scaryNPC, 0, 0, (GetEntityHeading(Ped) -180), 0, true)

        Wait(10000)
        exports["xsound"]:Destroy(Link)
        DeleteEntity(scaryNPC)
    end

    local function PumpkinExplosion(Loc)
        local Ped = PlayerPedId()
        RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
        while not HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') do 
            Wait(50)
        end
        TaskPlayAnim(Ped, 'anim@heists@ornate_bank@thermal_charge', 'cover_eyes_intro', 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
        TaskPlayAnim(Ped, 'anim@heists@ornate_bank@thermal_charge', 'cover_eyes_loop', 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
        Wait(500)
        ClearPedTasks(Ped)
        AddExplosion(Loc.x, Loc.y, Loc.z, 2, 0.1, true, false, 0.5, true)
        SetPedToRagdoll(Ped, 2000, 2000, 0, false, false, false)
        Wait(800)
        ClearPedTasks(Ped)
        Notify(Config.Halloween.Locals.PumpkinHunt['NotifyTrick'], "", "error")
    end

    local function OpenPumpkin(Loc, Pumpkin)
        local Ped = PlayerPedId()

        local dict = "random@domestic"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(100)
        end
        TaskPlayAnim(Ped, dict, "pickup_low", 8.0, 8.0, -1, 1, 0, false, false, false)
        Wait(1500)
        DeleteEntity(Pumpkin)
        ClearPedTasks(Ped)
        
        local Luck = math.random(1, 100)
        if Luck < Config.Halloween.PumpkinHunt.Treat.Chance then
            TriggerServerEvent("server:HG-Halloween:treatplayer")
        else
            local LuckTrick = math.random(1, 100)
            if LuckTrick < 50 then
                PumpkinExplosion(Loc)
            else
                SpawnScaryNPC(Loc)
            end
        end
    end

    local function OpeningPumpkin(Loc, Pumpkin)
        local key = ("%s_%s_%s"):format(Loc.x, Loc.y, Loc.z)
        if not PumpkinOpened[key] then
            PumpkinOpened[key] = true
        
        else
            Notify(Config.Halloween.Locals.PumpkinHunt['NotifyAlreadyOpened'], "", "error")
            return
        end
        exports["xsound"]:PlayUrl("HG-Halloween-Countdown", Config.Halloween.PumpkinHunt.Audio.OpenPumpkin, Config.Halloween.PumpkinHunt.Audio.Volume, true)
        if lib.progressActive() then return end

        local Ped = PlayerPedId()
        lib.requestAnimDict('anim@heists@prison_heistig1_p1_guard_checks_bus')
        TaskPlayAnim(Ped, 'anim@heists@prison_heistig1_p1_guard_checks_bus', 'loop', 8.0, 8.0, -1, 1, 0, 0, 0, 0)

        if lib.progressCircle({
            duration = 5500,
            label = Config.Halloween.Locals.PumpkinHunt['InteractPumpkinOpen'],
            useWhileDead = false,
            canCancel = false,
            disable = {move = true},
            anim = {},
            prop = {},
        }) 
        then
            exports["xsound"]:Destroy('HG-Halloween-Countdown')
            ClearPedTasks(Ped)
            OpenPumpkin(Loc, Pumpkin)
        end
    end

    local function AddPumpkinSpawned()
        Wait(1000)
        for k, v in pairs(Config.Halloween.PumpkinHunt.Location) do
            local Pumpkin = CreateObject(Config.Halloween.PumpkinHunt.Model, v.x, v.y, v.z, false, false, false)
            SetEntityHeading(Pumpkin, v.w)
            SetEntityAsMissionEntity(Pumpkin, true, true)
            SetBlockingOfNonTemporaryEvents(Pumpkin, true)
            SetEntityInvincible(Pumpkin, true)
            PlaceObjectOnGroundProperly(Pumpkin)
            FreezeEntityPosition(Pumpkin, true)
            table.insert(PumpkinSpawned, {Pumpkin = Pumpkin, Location = v})
    
            -- ✅ Add ox_target for this pumpkin
            exports.ox_target:addLocalEntity(Pumpkin, {
                {
                    name = 'halloween_pumpkin_' .. k,
                    icon = 'fa-solid fa-pumpkin',
                    label = Config.Halloween.Locals.PumpkinHunt['InteractOpen']:format(keyName),
                    onSelect = function()
                        local Location = vector3(v.x, v.y, v.z)
                        OpeningPumpkin(Location, Pumpkin)
                    end
                }
            })
    
            Wait(100)
        end
    end
    
    AddPumpkinSpawned()


    -- Cleanup on resource stop
    AddEventHandler('onResourceStop', function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for _, v in pairs(PumpkinSpawned) do
                if DoesEntityExist(v.Pumpkin) then
                    DeleteEntity(v.Pumpkin)
                end
            end
            PumpkinSpawned = {}
        end
    end)

end
