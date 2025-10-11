local AllKeys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= "HG-Halloween") then
        print("ERROR: Rename this resource to 'HG-Halloween' to work properly.")
        return
    end
end)

local function ResetEverything()
    HalloweenMissionActive = false
    BlackoutActive = false
    FPVThreadOn = false
    CurrentMessageID = 1
    MessageRead = {}
end

-- Get the key name
local function GetKeyName(val)
    for k, v in pairs(AllKeys) do
        if v == val then
            return k
        end
    end
    return nil -- in case no match is found
end
keyName = GetKeyName(Config.Halloween.InteractiveKey)


HalloweenMissionActive = false
local BlackoutActive = false
local FPVThreadOn = false

local Zone1 = false
local Zone2 = false
local ZoneCustom1 = false
local ZoneCustom2 = false
local ZoneCustom3 = false
local AnimAttack1 = false
local Room1 = false
local Room2 = false

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local Sound = {
    On = false,
    Link = "https://youtu.be/Il09UPCyxMc?si=xKyl0bA7nZq_oq0_",
    Name = "HG-Halloween-House-BG"
}

CreateThread(function()
    while true do
        Wait(5000)
        if HalloweenMissionActive then
            if not Sound.On then
                Sound.On = true
                exports["xsound"]:PlayUrl(Sound.Name, Sound.Link, Config.Halloween.Mission.Volume.Music, true)
            end
        else
            if Sound.On then
                Sound.On = false
                exports["xsound"]:Destroy(Sound.Name)
            end
        end
    end
end)

local function DisableNPCTalking(NPC)
    SetPedCanPlayAmbientAnims(NPC, false)
    SetPedCanPlayAmbientBaseAnims(NPC, false)
    DisablePedPainAudio(NPC, true)
    SetAmbientVoiceName(NPC, "SILENT_GENE")
    StopPedSpeaking(NPC, true)
end

local function RunZombies(Model, Start, End)
    local Link = "https://youtu.be/b74E7KBTBw0?si=bBtoGFEQBTK-VGgG"
    exports["xsound"]:PlayUrlPos(Link, Link, Config.Halloween.Mission.Volume.Ghost, vector3(Start.x, Start.y, Start.z), false)
    Wait(1000)
    lib.requestModel(Model)
    local NPC = CreatePed(4, Model, Start.x, Start.y, Start.z, Start.w, true, false)
    DisableNPCTalking(NPC)
    SetEntityAsMissionEntity(NPC, true, true)
    TaskGoToCoordAnyMeans(NPC, End.x, End.y, End.z, 3.0, 0, 0, 786603, 0xbf800000)
    SetPedMoveRateOverride(NPC, 5.0)
    SetRunSprintMultiplierForPlayer(NPC, 2.49)
    while GetDistanceBetweenCoords(GetEntityCoords(NPC), End.x, End.y, End.z, true) > 1.0 do
        Wait(10)
    end
    exports["xsound"]:Destroy(Link)
    DeleteEntity(NPC)
end

local function PerformAttack(NPC, targetPed)
    local health = GetEntityHealth(targetPed)
    
    TaskPlayAnim(NPC, "move_jump", "dive_start_run", 8.0, -8.0, -1, 0, 0.0, 0, 0, 0)
    Wait(400)
    SetPedToRagdoll(NPC, 1000, 1000, 0, 0, 0, 0)

    SetPedToRagdoll(targetPed, 5000, 5000, 0, false, false, false)
    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.08)
    TaskCombatPed(NPC, targetPed, 0, 16)

    lib.requestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    TaskPlayAnim(NPC, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, 1.0, -1, 1, 0, 0, 0, 0)

    Wait(5000)
    DoScreenFadeOut(500)
    Wait(700)
    DeleteEntity(NPC)
    Wait(800)
    DoScreenFadeIn(500)
    SetEntityHealth(targetPed, health - 10)
end

local function AnimAttackZombies(Model, Start, targetPed, Anim)
    lib.requestModel(Model)
    
    local NPC = CreatePed(4, Model, Start.x, Start.y, Start.z, Start.w, true, false)
    DisableNPCTalking(NPC)
    SetEntityAsMissionEntity(NPC, true, true)

    SetPedCombatAttributes(NPC, 46, true) -- Makes NPC aggressive
    SetPedCombatAttributes(NPC, 5, true)  -- Always fights
    SetPedCombatAbility(NPC, 100)         -- Set the combat ability to max
    SetPedCombatMovement(NPC, 2)          -- Allows NPC to move during combat
    SetPedCombatRange(NPC, 2)             -- Set combat range to close combat
    SetPedTargetLossResponse(NPC, 1)      -- NPC keeps attacking the player after initial attack
    
    TaskCombatPed(NPC, targetPed, 0, 16)

    --Animation
    lib.requestAnimDict(Anim.dic)
    TaskPlayAnim(NPC, Anim.dic, Anim.anim, 8.0, 1.0, -1, 1, 0, 0, 0, 0)

    CreateThread(function()
        while DoesEntityExist(NPC) and GetEntityHealth(NPC) > 0 do
            Wait(500) -- Check every 500ms

            -- Calculate the direction between the NPC and the player
            local npcCoords = GetEntityCoords(NPC)
            local playerCoords = GetEntityCoords(targetPed)
            local headingToPlayer = GetHeadingFromVector_2d(playerCoords.x - npcCoords.x, playerCoords.y - npcCoords.y)
            
            -- Update NPC rotation to face the player
            SetEntityHeading(NPC, headingToPlayer)

            -- Reapply the walking animation to ensure the NPC keeps moving while facing the player
            if not IsEntityPlayingAnim(NPC, Anim.dic, Anim.anim, 3) then
                TaskPlayAnim(NPC, Anim.dic, Anim.anim, 8.0, 1.0, -1, 1, 0, 0, 0, 0)
            end

            -- If the NPC is close enough to the player, trigger the attack
            if GetDistanceBetweenCoords(npcCoords, playerCoords, true) <= 3.5 then
                break -- Exit the loop when close enough
            end
        end

        -- Perform attack when close
        if DoesEntityExist(NPC) then
            PerformAttack(NPC, targetPed)
        end
    end)
end

if Config.Halloween.Mission.Enable then


    -- Zone 1
    lib.zones.poly({
        points = {
            vector3(2453.91, 4969.23, 46.81),
            vector3(2452.11, 4971.13, 46.81),
            vector3(2454.53, 4973.36, 46.81),
            vector3(2456.33, 4971.68, 46.81),
        },
        thickness = 2,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not Zone1 then
                local Model = "u_m_o_filmnoir"
                local Start = vector4(2452.87, 4979.27, 45.81, 210.43)
                local End = vector3(2456.7, 4973.2, 46.92)
                RunZombies(Model, Start, End)
                Zone1 = true
            end
        end,
    })

    -- Zone 2
    lib.zones.poly({
        points = {
            vector3(2455.71, 4974.0, 46.81),
            vector3(2453.15, 4976.46, 46.81),
            vector3(2456.25, 4976.81, 46.81),
            vector3(2458.06, 4975.26, 46.81),
        },
        thickness = 2,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not Zone2 then
                local Model = "u_m_o_filmnoir"
                local Start = vector4(2442.83, 4975.48, 45.81, 240.16)
                local End = vector3(2449.32, 4970.91, 46.45)
                RunZombies(Model, Start, End)
                Zone2 = true
            end
        end,
    })

    -- ZoneCustom 1
    lib.zones.sphere({
        coords = vec3(2438.66, 4963.74, 46.81),
        radius = 2,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not ZoneCustom1 then
                local Model = "u_m_o_filmnoir"
                local Start = vector4(2432.33, 4961.58, 45.82, 264.83)
                local Ped = PlayerPedId()
                local Anim = {
                    dic = "zombies_animations",
                    anim = "zombi_walk_01"
                }
                local Link = "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS"
                exports["xsound"]:PlayUrlPos(Link, Link, Config.Halloween.Mission.Volume.Ghost, vector3(Start.x, Start.y, Start.z), false)
                AnimAttackZombies(Model, Start, Ped, Anim)
                ZoneCustom1 = true
                exports["xsound"]:PlayUrl("HG-Halloween-House-play-with-me", "https://files.fivemerr.com/audios/b697a7ae-5216-45d7-98ee-0df9e7dd6c2e.ogg", Config.Halloween.Mission.Volume.Voice, false)
            end
        end,
    })

    -- ZoneCustom 2
    lib.zones.sphere({
        coords = vec3(2430.37, 4961.7, 46.6),
        radius = 1,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not ZoneCustom2 then
                local Model = "m23_1_prop_m31_ghostzombie_01a"
                local Start = vector4(2427.34, 4964.35, 47.30, 224.55)
                local Link = "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS"
                exports["xsound"]:PlayUrlPos(Link, Link, Config.Halloween.Mission.Volume.Ghost, vector3(Start.x, Start.y, Start.z), false)
                
                lib.requestModel(Model)
                local CreateModel = CreateObject(Model, Start.x, Start.y, Start.z, true, true, true)
                SetEntityRotation(CreateModel, 180.0, 0.0, Start.w, 2, true)
                FreezeEntityPosition(CreateModel, true)
                SetModelAsNoLongerNeeded(CreateModel)
                Wait(2500)
                DeleteEntity(CreateModel)
                exports["xsound"]:Destroy(Link)
                ZoneCustom2 = true
            end
        end,
    })

    -- ZoneCustom 2
    lib.zones.sphere({
        coords = vec3(2451.45, 4982.99, 47.77),
        radius = 1,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not ZoneCustom3 then
                local Model = "u_m_o_filmnoir"
                local Start = vector4(2447.09, 4976.12, 50.56, 314.11)
                local End = vector3(2449.68, 4979.0, 51.01)
                local Link = "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS"
                exports["xsound"]:PlayUrlPos(Link, Link, Config.Halloween.Mission.Volume.Ghost, vector3(Start.x, Start.y, Start.z), false)
                
                lib.requestModel(Model)
                local NPC = CreatePed(4, Model, Start.x, Start.y, Start.z, Start.w, true, false)
                DisableNPCTalking(NPC)
                SetEntityAsMissionEntity(NPC, true, true)

                TaskGoToCoordAnyMeans(NPC, End.x, End.y, End.z, 3.0, 0, 0, 786603, 0xbf800000)
                SetPedMoveRateOverride(NPC, 5.0)
                SetRunSprintMultiplierForPlayer(NPC, 2.49)

                while GetDistanceBetweenCoords(GetEntityCoords(NPC), End.x, End.y, End.z, true) > 1.5 do
                    Wait(10)
                end

                SetPedToRagdoll(NPC, 9000, 9000, 0, 0, 0, 0)
                Wait(10000)
                DeleteEntity(NPC)
                exports["xsound"]:Destroy(Link)
                ZoneCustom3 = true
            end
        end,
    })


    -- Anim Attacks
    lib.zones.sphere({
        coords = vec3(2448.0, 4976.37, 46.83),
        radius = 1,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not AnimAttack1 then
                local Model = "u_m_o_filmnoir"
                local Start = vector4(2446.23, 4982.84, 45.81, 167.75)
                local Ped = PlayerPedId()
                local Anim = {
                    dic = "zombies_animations",
                    anim = "crawl_01"
                }
                local Link = "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS"
                exports["xsound"]:PlayUrlPos(Link, Link, Config.Halloween.Mission.Volume.Ghost, vector3(Start.x, Start.y, Start.z), false)
                AnimAttackZombies(Model, Start, Ped, Anim)
                AnimAttack1 = true
            end
        end,
    })

    local function FPVThread()
        CreateThread(function()
            while true do
                Wait(500)
                if FPVThreadOn and HalloweenMissionActive then
                    local currentView = GetFollowPedCamViewMode()
                    if currentView ~= 4 then
                        SetFollowPedCamViewMode(4)
                    end
                else
                    SetFollowPedCamViewMode(1)
                    break
                end
            end
        end)
    end

    local function RemoveBlackout()
        BlackoutActive = false
        HalloweenMissionActive = false
        SetArtificialLightsState(false)
        ClearTimecycleModifier()

        -- Reset weather and time
        ClearOverrideWeather()
        SetWeatherTypeNow("CLEAR")
        NetworkClearClockTimeOverride()

        Zone1 = false
        Zone2 = false
        ZoneCustom1 = false
        ZoneCustom2 = false
        ZoneCustom3 = false
        AnimAttack1 = false
        Room1 = false
        Room2 = false
    end

    local function AddBlackout()
        BlackoutActive = true
        FPVThreadOn = true
        FPVThread()
        CreateThread(function()
            while BlackoutActive do
                Wait(0)
                SetArtificialLightsState(true)
                SetTimecycleModifier("nightvision")
                SetTimecycleModifierStrength(0.5)
                NetworkOverrideClockTime(23, 0, 0)
                SetWeatherTypeNowPersist("HALLOWEEN")
            end
        end)
    end

    local function EnterInstance()
        local Num = math.random(1111, 9999)
        TriggerServerEvent('server:HG-Halloween:EnterInstance', Num)
    end

    local function ExitInstance()
        TriggerServerEvent('server:HG-Halloween:ExitInstance')
    end

    local function StartMission()
        local playerPed = PlayerPedId()

        local Wep = GetSelectedPedWeapon(playerPed)
        if Wep ~= GetHashKey("weapon_flashlight") then
            Notify(Config.Halloween.Locals.HauntedHouse['noflashlight'], '', 'error')
            return
        end
        HalloweenMissionActive = true
        DoScreenFadeOut(500)
        Wait(500)
        SetEntityCoords(playerPed, 2453.98, 4969.81, 46.81, false, false, false, false)

        EnterInstance()

        Wait(500)
        DoScreenFadeIn(500)
        AddBlackout()
    end

    CreateThread(function()
        local Model = "u_m_y_zombie_01"
        RequestModel(Model)
        while not HasModelLoaded(Model) do
            Wait(1)
        end
        local NPCPed = CreatePed(0, Model, Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y, Config.Halloween.Mission.StartCoords.z, Config.Halloween.Mission.StartCoords.w, false, false)
        FreezeEntityPosition(NPCPed, true)
        SetEntityInvincible(NPCPed, true)
        SetBlockingOfNonTemporaryEvents(NPCPed, true)
    end)

-- Remove or comment out the inside = / onEnter etc parts that rely on the key press

-- Instead, after your NPC or spawn logic, do:
exports.ox_target:addBoxZone({
    coords = vector3(Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y, Config.Halloween.Mission.StartCoords.z + 1),
    size = vector3(2, 3, 2),
    rotation = Config.Halloween.Mission.StartCoords.w,
    debug = Config.Halloween.Debug,
    options = {
        {
            name = 'halloween_start_mission',
            icon = 'fa-solid fa-ghost',  -- you can pick an appropriate icon
            label = Config.Halloween.Locals.Main['MainMenuOpen']:format(keyName),  -- or a fixed “Start Mission” label
            onSelect = function(data)
                local Alert = lib.alertDialog({
                    header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                    content = Config.Halloween.Locals.HauntedHouse['MissionStart'],
                    centered = true,
                    cancel = 'cancel',
                })
                if Alert == 'confirm' then
                    StartMission()
                end
            end
        }
    }
})



    local function SpawnAndDestroyNPCs()
        local TotalTime = 50000 -- Total time for the loop (50 seconds)
        local StartTime = GetGameTimer()
        local Data = {
            {
                Model = "u_m_y_zombie_01",
                Start = vector4(2454.08, 4985.32, 45.81, 92.94),
                End = vector3(2450.44, 4985.38, 46.81),
            },
            {
                Model = "u_m_y_zombie_01",
                Start = vector4(2442.61, 4981.33, 45.81, 274.93),
                End = vector3(2447.13, 4981.23, 46.81),
            },
        }
    
        CreateThread(function()
            while GetGameTimer() - StartTime < TotalTime do
                for _, npc in ipairs(Data) do
                    local NPCModel = npc.Model
                    local SpawnCoords = npc.Start
                    local EndCoords = npc.End
    
                    lib.requestModel(NPCModel)
                    local NPC = CreatePed(4, GetHashKey(NPCModel), SpawnCoords.x, SpawnCoords.y, SpawnCoords.z, SpawnCoords.w, false, true)
                    SetEntityAsMissionEntity(NPC, true, true) -- Set NPC as a mission entity to remove it later
                    TaskGoStraightToCoord(NPC, EndCoords.x, EndCoords.y, EndCoords.z, 1.0, -1, 0.0, 0.0)
    
                    lib.requestAnimDict("zombies_animations")
                    TaskPlayAnim(NPC, "zombies_animations", "zombi_walk_01", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
    
                    local NPCDestroyed = false

                    while not NPCDestroyed do
                        local NPCPos = GetEntityCoords(NPC)
                        local Distance = #(NPCPos - EndCoords)
                        if Distance < 1.5 then
                            -- NPC reached the destination, set it on fire and remove it after burning
                            TaskStandStill(NPC, -1)
                            local fireID = StartEntityFire(NPC)
                            SetEntityProofs(NPC, false, true, false, false, false, false, false, false)
                            SetPedToRagdoll(NPC, 5000, 5000, 0, true, true, false)
                            Wait(300)
                            StopEntityFire(NPC)
                            DeleteEntity(NPC)
                            NPCDestroyed = true
                        end
                        Wait(500) -- Check every 500ms to see if the NPC has reached the destination
                    end

                    Wait(2000)
                    if GetGameTimer() - StartTime >= TotalTime then
                        break
                    end
                end
            end
        end)
    end
    

    local candles = {}
    local candleModel = `v_res_m_candle`  -- Change this to another candle model if needed
    local particleEffect = "cs_ex1_cargo_fire"  -- The particle effect to be applied on the candle
    local particlecode = "scr_exile1"  -- The particle effect to be applied on the candle

    -- Function to create a circle of candles with particle effects
    local function CreateCandleCircle(centerPos, radius, numCandles, duration)
        local angleStep = (2 * math.pi) / numCandles  -- Divide the circle into equal parts (angles)

        -- Load the candle model
        RequestModel(candleModel)
        while not HasModelLoaded(candleModel) do
            Wait(0)
        end

        -- Load the particle effect
        RequestNamedPtfxAsset(particlecode)
        while not HasNamedPtfxAssetLoaded(particlecode) do
            Wait(0)
        end

        -- Place candles around the circle
        for i = 1, numCandles do
            local angle = angleStep * i
            local xOffset = radius * math.cos(angle)
            local yOffset = radius * math.sin(angle)
            local candlePos = vector3(centerPos.x + xOffset, centerPos.y + yOffset, centerPos.z)

            -- Spawn the candle prop and store it
            local candle = CreateObject(candleModel, candlePos.x, candlePos.y, candlePos.z, true, true, false)
            PlaceObjectOnGroundProperly(candle)  -- Ensure the candle is placed on the ground
            FreezeEntityPosition(candle, true)  -- Make sure the candle stays in place
            table.insert(candles, candle)

            -- Start the fire particle effect on the candle
            UseParticleFxAssetNextCall(particlecode)
            StartParticleFxLoopedOnEntity(particleEffect, candle, 0.0, 0.0, 1.3, 0.0, 0.0, 0.0, 0.4, false, false, false)
        end
        Wait(1000)
        DoScreenFadeIn(500)

        lib.requestModel("u_m_y_zombie_01")
        local NPCKnock = CreatePed(4, "u_m_y_zombie_01", 2443.24, 4989.83, 45.13, 243.05, true, false)
        DisableNPCTalking(NPCKnock)
        SetEntityAsMissionEntity(NPCKnock, true, true)
        lib.requestAnimDict("missheistfbi3b_ig7")
        TaskPlayAnim(NPCKnock, "missheistfbi3b_ig7", "lift_fibagent_loop", 8.0, 1.0, -1, 1, 0, 0, 0, 0)
        
        SpawnAndDestroyNPCs()

        Wait(duration * 1000)

        DoScreenFadeOut(500)
        Wait(1000)
        for _, candle in pairs(candles) do
            DeleteObject(candle)
        end
        candles = {}

        DeleteEntity(NPCKnock)

        local Ped = PlayerPedId()
        DoScreenFadeIn(500)
        Wait(1000)
        SetCamEffect(0)
        FreezeEntityPosition(Ped, false)
        ClearPedTasksImmediately(Ped)
        RemoveBlackout()
        Wait(4000)
        local alert = lib.alertDialog({
            header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
            content = Config.Halloween.Locals.HauntedHouse['Step8b'],
            centered = true,
        })
        DoScreenFadeOut(500)
        Wait(1000)
        ExitInstance()
        SetEntityCoords(Ped, Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y, Config.Halloween.Mission.StartCoords.z, false, false, false, false)
        DoScreenFadeIn(500)
        ResetEverything()
        Wait(1000)
    end

    -- Function to start the candle circle for 1 minute
    local function StartCandleCircle(centerPos, radius)
        BlackoutActive = false
        FPVThreadOn = false
        SetArtificialLightsState(false)
        ClearTimecycleModifier()

        SetTimecycleModifierStrength(0.5)
        NetworkOverrideClockTime(23, 0, 0)
        CreateCandleCircle(centerPos, radius, 12, 66)  -- Create a candle circle with 12 candles, radius 1.8, lasting 60 seconds
    end



    local MessageRead = {}
    local CurrentMessageID = 1

    local HalloweenHouse = {
        [1] = {
            Pos = vector3(2450.95, 4971.84, 47.00),
            Msg = Config.Halloween.Locals.HauntedHouse['Step1a'],
            Audio = {
                Name = "HG-Halloween-House-can-you-see-me",
                Link = "https://files.fivemerr.com/audios/3bdee0af-c761-4d0b-8cff-4f3b0c094646.ogg"
            },
            Action = false
        },
        [2] = {
            Pos = vector3(2447.15, 4971.07, 47.00),
            Msg = Config.Halloween.Locals.HauntedHouse['Step2a'],
            Audio = {
                Name = "HG-Halloween-House-find-me",
                Link = "https://files.fivemerr.com/audios/c33b69d3-0bde-456f-b4f0-11664bf6c67a.ogg"
            },
            Action = false
        },
        [3] = {
            Pos = vector3(2434.24, 4965.01, 41.75),
            Msg = Config.Halloween.Locals.HauntedHouse['Step3a'],
            Audio = {
                Name = "HG-Halloween-House-i-am-here",
                Link = "https://files.fivemerr.com/audios/d142d273-11ab-4506-a5d4-227ef194ee52.ogg"
            },
            Action = true
        },
        [4] = {
            Pos = vector3(2432.23, 4968.24, 42.38),
            Msg = Config.Halloween.Locals.HauntedHouse['Step4a'],
            Audio = {
                Name = "HG-Halloween-House-rhyme",
                Link = "https://files.fivemerr.com/audios/795e3acf-0ebb-4f93-a648-64ca1ede9492.ogg"
            },
            Action = true
        },
        [5] = {
            Pos = vector3(2452.79, 4978.76, 51.49),
            Msg = Config.Halloween.Locals.HauntedHouse['Step5a'],
            Audio = nil,
            Action = false
        },
        [6] = {
            Pos = vector3(2441.8, 4976.2, 46.99),
            Msg = Config.Halloween.Locals.HauntedHouse['Step6a'],
            Audio = nil,
            Action = false
        },
        [7] = {
            Pos = vector3(2454.8, 4993.93, 46.21),
            Msg = Config.Halloween.Locals.HauntedHouse['Step7a'],
            Audio = nil,
            Action = false
        },
        [8] = {
            Pos = vector3(vector3(2448.1, 4983.28, 46.45)),
            Msg = Config.Halloween.Locals.HauntedHouse['Step8a'],
            Audio = {
                Name = "HG-Halloween-House-Sura",
                Link = "https://files.fivemerr.com/audios/3884a349-a24c-4918-bf1f-a120964428d1.ogg"
            },
            Action = true
        },
    }

    local function CreateProp(M, ...)
        RequestModel(M)
        while not HasModelLoaded(M) do Wait(0) end
        local obj = CreateObject(M, ...)
        SetModelAsNoLongerNeeded(M)
        return obj
    end

    local function ThrowProp(prop, targetLoc, speed)
        local propPos = GetEntityCoords(prop)
        local direction = vector3(
            targetLoc.x - propPos.x,
            targetLoc.y - propPos.y,
            targetLoc.z - propPos.z
        )
        local magnitude = #(direction)
        local normalizedDirection = vector3(
            direction.x / magnitude,
            direction.y / magnitude,
            direction.z / magnitude
        )
        SetEntityVelocity(prop, normalizedDirection.x * speed, normalizedDirection.y * speed, normalizedDirection.z * speed)
    end

    local function CompleteTask(ID, Pos)
        if ID == 3 then
            Wait(10000)
            local alert = lib.alertDialog({
                header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                content = Config.Halloween.Locals.HauntedHouse['Step3b'],
                centered = true,
            })
        elseif ID == 4 then
            FPVThreadOn = false
            ToggleLightSwitch(1)
            local Ped = PlayerPedId()
            lib.requestAnimDict('mini@repair')
            TaskPlayAnim(Ped, 'mini@repair', 'fixing_a_ped', 8.0, 1.0, -1, 1, 0, 0, 0, 0)
            FreezeEntityPosition(Ped, true)
            Wait(15000)

            local PropLoc1 = vector3(2431.07, 4962.76, 42.35)
            local PropLoc2 = vector3(2431.09, 4966.13, 42.5)
            local TargetLoc = vector3(2436.01, 4966.47, 43.35)
            local PropModel1 = `prop_rad_waste_barrel_01`
            local PropModel2 = `prop_rad_waste_barrel_01`
        
            -- Create the first prop
            local CreateModel1 = CreateProp(PropModel1, PropLoc1.x, PropLoc1.y, PropLoc1.z, true, false, true)
            ThrowProp(CreateModel1, TargetLoc, 14.0)  -- Adjust speed as needed
            Wait(1500)
        
            -- Create the second prop
            local CreateModel2 = CreateProp(PropModel2, PropLoc2.x, PropLoc2.y, PropLoc2.z, true, false, true)
            ThrowProp(CreateModel2, TargetLoc, 14.0)  -- Adjust speed as needed
        
            -- Wait for 5 seconds and delete the props
            Wait(5000)
            DeleteEntity(CreateModel1)
            DeleteEntity(CreateModel2)

            ClearPedTasks(Ped)
            FreezeEntityPosition(Ped, false)
            local alert = lib.alertDialog({
                header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                content = Config.Halloween.Locals.HauntedHouse['Step4b'],
                centered = true,
            })
            ToggleLightSwitch(1)
            FPVThreadOn = true
            FPVThread()
        elseif ID == 8 then
            local playerPed = PlayerPedId()
            local playerPos = GetEntityCoords(playerPed)

            DoScreenFadeOut(500)
            Wait(1000)
            SetEntityCoords(playerPed, Pos.x, Pos.y, Pos.z-0.7, false, false, false, false)
            Wait(500)
            FreezeEntityPosition(playerPed, true)
            SetCamEffect(2)

            lib.requestAnimDict('rcmcollect_paperleadinout@')
            TaskPlayAnim(playerPed, 'rcmcollect_paperleadinout@', 'meditiate_idle', 1.0, -1.0, -1, 1, 0, false, false, false)
            StartCandleCircle(playerPos, 1.8)
        end
    end
    

    local function HauntedHouseReadMsg(k, v)
        if k ~= 1 then
            local ID = k - 1
            if not MessageRead[ID] then
                Notify(Config.Halloween.Locals.HauntedHouse['NotifyReadNote'], '', 'error')
            else
                local alert = lib.alertDialog({
                    header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                    content = v.Msg,
                    centered = true,
                })
                if alert == 'confirm' then
                    MessageRead[k] = true
                    CurrentMessageID = CurrentMessageID + 1
                    if v.Audio and v.Audio.Name then
                        exports["xsound"]:PlayUrl(v.Audio.Name, v.Audio.Link, Config.Halloween.Mission.Volume.Voice, false)
                    end
                    if v.Action then
                        CompleteTask(k, v.Pos)
                    end
                end
            end
        else
            local alert = lib.alertDialog({
                header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                content = v.Msg,
                centered = true,
            })
            if alert == 'confirm' then
                MessageRead[k] = true
                CurrentMessageID = CurrentMessageID + 1
                if v.Audio and v.Audio.Name then
                    exports["xsound"]:PlayUrl(v.Audio.Name, v.Audio.Link, Config.Halloween.Mission.Volume.Voice, false)
                end
                if v.Action then
                    CompleteTask(k, v.Pos)
                end
            end
        end
    end

    CreateThread(function()
        for k, v in pairs(HalloweenHouse) do
            exports.ox_target:addSphereZone({
                coords = v.Pos,
                radius = 1.5,
                debug = Config.Halloween.Debug,
                options = {
                    {
                        name = 'halloween_house_read_' .. k,
                        icon = 'fa-solid fa-book-open',
                        label = Config.Halloween.Locals.Main['MainRead']:format(keyName),
                        onSelect = function(data)
                            if not MessageRead[k] and CurrentMessageID == k and HalloweenMissionActive then
                                HauntedHouseReadMsg(k, v)
                            else
                                Notify(Config.Halloween.Locals.HauntedHouse['NotifyReadNote'], '', 'error')
                            end
                        end
                    }
                }
            })
        end
    end)
    
    
    
    -- Room 1
    lib.zones.sphere({
        coords = vec3(2452.68, 4989.92, 46.81),
        radius = 2,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not Room1 then
                exports["xsound"]:PlayUrl("HGHalloweenHousebodyfall1", "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS", Config.Halloween.Mission.Volume.Voice, false)
                Room1 = true
                local Model = `vw_prop_vw_ped_hillbilly_01a`
                lib.requestModel(Model)
                local Ghost = CreateObject(Model, 2454.7, 4992.0, 47.91, true, false, false)

                -- Enable physics for the object
                FreezeEntityPosition(Ghost, false)  -- Make sure the object is not frozen in place
                SetEntityDynamic(Ghost, true)       -- Make the object dynamic so it responds to physics
                ActivatePhysics(Ghost)              -- Activate physics on the object
                SetEntityHasGravity(Ghost, true)    -- Ensure gravity is applied to the object

                Wait(12000)
                DeleteEntity(Ghost)
            end
        end,
    })

    -- Room 2
    lib.zones.sphere({
        coords = vec3(2455.51, 4987.12, 46.81),
        radius = 2,
        debug = Config.Halloween.Debug,
        onEnter = function()
            if not HalloweenMissionActive then return end
            if not Room2 then
                exports["xsound"]:PlayUrl("HGHalloweenHousebodyfall2", "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS", Config.Halloween.Mission.Volume.Voice, false)
                Room2 = true
                Wait(1500)
                local Model = `vw_prop_vw_ped_business_01a`
                lib.requestModel(Model)
                local Ghost = CreateObject(Model, 2458.11, 4989.2, 47.91, true, false, false)

                -- Enable physics for the object
                FreezeEntityPosition(Ghost, false)  -- Make sure the object is not frozen in place
                SetEntityDynamic(Ghost, true)       -- Make the object dynamic so it responds to physics
                ActivatePhysics(Ghost)              -- Activate physics on the object
                SetEntityHasGravity(Ghost, true)    -- Ensure gravity is applied to the object

                Wait(12000)
                DeleteEntity(Ghost)
            end
        end,
    })


    lib.zones.poly({
        points = {
            vector3(2451.08, 4970.78, 48.57),
            vector3(2454.20, 4968.46, 48.57),
            vector3(2461.00, 4975.34, 48.57),
            vector3(2458.96, 4977.45, 48.57),
            vector3(2461.31, 4980.16, 48.57),
            vector3(2456.96, 4984.49, 48.57),
            vector3(2462.27, 4989.96, 48.57),
            vector3(2455.76, 4996.54, 48.57),
            vector3(2447.81, 4988.51, 48.57),
            vector3(2444.80, 4991.21, 48.57),
            vector3(2437.95, 4984.19, 48.57),
            vector3(2440.77, 4980.94, 48.57),
            vector3(2422.86, 4963.09, 48.57),
            vector3(2432.99, 4952.99, 48.57),
        },
        thickness = 20,
        debug = Config.Halloween.Debug,
        onExit = function()
            if HalloweenMissionActive then
                DoScreenFadeOut(500)
                Wait(500)
                SetEntityCoords(PlayerPedId(), 2453.98, 4969.81, 46.81, false, false, false, false)
                Wait(500)
                DoScreenFadeIn(500)
                local Alert1 = lib.alertDialog({
                    header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                    content = Config.Halloween.Locals.HauntedHouse['NotifyNoINHouse'],
                    centered = true,
                })
                if Alert1 == 'confirm' then
                    local Alert2 = lib.alertDialog({
                        header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
                        content = Config.Halloween.Locals.HauntedHouse['NotifyEndMission'],
                        centered = true,
                        cancel = true,
                    })
                    if Alert2 == 'confirm' then
                        DoScreenFadeOut(500)
                        Wait(1000)
                        local Ped = PlayerPedId()
                        SetEntityCoords(Ped, Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y, Config.Halloween.Mission.StartCoords.z, false, false, false, false)
                        DoScreenFadeIn(500)
                        ExitInstance()
                        RemoveBlackout()
                        ResetEverything()
                        ClearPedTasks(Ped)
                    end
                end
            end
        end,
    })
    
    RegisterCommand(Config.Halloween.Mission.EndMissionCommand, function()
        local Alert2 = lib.alertDialog({
            header = Config.Halloween.Locals.HauntedHouse['MenuTitle'],
            content = Config.Halloween.Locals.HauntedHouse['NotifyEndMission'],
            centered = true,
            cancel = true,
        })
        if Alert2 == 'confirm' then
            DoScreenFadeOut(500)
            Wait(1000)
            local Ped = PlayerPedId()
            SetEntityCoords(Ped, Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y, Config.Halloween.Mission.StartCoords.z, false, false, false, false)
            DoScreenFadeIn(500)
            ExitInstance()
            RemoveBlackout()
            ResetEverything()
            ClearPedTasks(Ped)
        end
    end, false)


    --Create Blip
    if Config.Halloween.Mission.Blip.Enable then
        CreateThread(function()
            local Blip = AddBlipForCoord(Config.Halloween.Mission.StartCoords.x, Config.Halloween.Mission.StartCoords.y, Config.Halloween.Mission.StartCoords.z)
            SetBlipSprite(Blip, Config.Halloween.Mission.Blip.Sprite)
            SetBlipDisplay(Blip, 4)
            SetBlipScale(Blip, Config.Halloween.Mission.Blip.Scale)
            SetBlipColour(Blip, Config.Halloween.Mission.Blip.Color)
            SetBlipAsShortRange(Blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Halloween.Mission.Blip.Name)
            EndTextCommandSetBlipName(Blip)
        end)
    end

end