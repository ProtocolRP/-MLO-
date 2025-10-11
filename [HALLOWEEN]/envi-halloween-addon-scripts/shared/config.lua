Config = {}

Config.Stalker = {
    Enabled = true,   -- Stalkers will follow players and try to sneak attack them - they will ONLY move when the player's camera is not looking at them
    Chance = 20,     -- Chance for a stalker to spawn, this happens once every 5 minutes
    Health = 500,     -- Health for the stalker
    Model = "S_M_Y_Clown_01", -- Model for the stalker
    Weapon = `WEAPON_SWITCHBLADE`, -- Weapon for the stalker
    AttackDistance = 3.0, -- Distance for the stalker to attack the player
    SpawnDistance = -30.0, -- Distance behind the player to spawn (should be a negative number to spawn behind)

    -- NEW
    IgnoredGroups = {'police', 'ambulance', 'ballas'},   -- Ignore Jobs/Gangs
    SpawnInterval = 20, -- Minimum time between spawns (in minutes)
}


-- Custom Stalker Client Function --
function CanGetStalked()
    local allowed = true
    for _, job in pairs(Config.Stalker.IgnoredGroups) do
        if Framework.HasJob(job, Framework.Player) or Framework.HasGang(job, Framework.Player) then
            allowed = false
        end
    end
    return allowed
end

Config.FogAreas = {
    [1] = {
        debug = false,
        density = 15.0,
        location = vec4(187.5954, -910.3607, 32.6929, 240.2783),
        length = 20.0,
        width = 25.0,
        height = 20.0,
        rotation = 245.0,
    },
    [2] = {
        debug = false,
        density = 15.0,
        location = vec4(-1706.3937, -214.2012, 57.5441, 192.2126),
        length = 200.0,
        width = 200.0,
        height = 50.0,
        rotation = 145.2,
    },
    [3] = {
        debug = false,
        density = 15.0,
        location = vec4(-2590.0747, 3158.2349, 13.4883, 353.0757),
        length = 20.0,
        width = 370.0,
        height = 25.0,
        rotation = 355.0,
    },
    [4] = {
        debug = false,
        density = 15.0,
        location = vector4(-478.07, -998.05, 23.42, 93),
        length = 20.0,
        width = 370.0,
        height = 25.0,
        rotation = 355.0,
    },
}

-- Jump Scare Settings -- 

Config.HackeeJumpscare = true -- if you use HackeeJumpscare - enable this for the ULTIMATE JUMPSCARE 
-- Download free from: https://github.com/Henry12116/hackee-jumpscare

Config.JumpScarePeds = {
    [1] = {
        model = "U_M_O_FilmNoir",
        location = vector4(247.72, -876.45, 31.09, 250),
        triggerZone = {
            debug = false,
            location = vector4(240.27, -884.47, 31.13, 168),
            size = 2.0,
            length = 3.0,
            width = 2.0,
            height = 2.0,
            rotation = 232.34,
        }
    },
    [2] = {
        model = "S_M_Y_Factory_01", --fish
        location = vector4(478.19, 3562.25, 33.24, 218),
        triggerZone = {
            debug = false,
            location = vector4(464.36, 3564.45, 33.45, 167),
            size = 2.0,
            length = 10.0,
            width = 20.0,
            height = 2.0,
            rotation = 24.0,
        }
    },
    [3] = {
        model = "nw_spider",
        location = vector4(229.72, -887.99, 31.09, 106),
        triggerZone = {
            debug = false,
            location = vector4(225.84, -864.53, 31.13, 247),
            size = 2.0,
            length = 10.0,
            width = 10.0,
            height = 10.0,
            rotation = 330.0,
        }
    },
    [4] = {
        model = "IG_DrugDealer",
        location = vector4(-1175.42, -1409.29, 4.46, 243),
        triggerZone = {
            debug = false,
            location = vector4(-1184.43, -1414.31, 4.45, 49),
            size = 2.0,
            length = 5.0,
            width = 10.0,
            height = 10.0,
            rotation = 330.0,
        }
    },
    [5] = {
        model = "S_M_Y_Cop_01",
        location = vector4(56.41, -371.09, 40.84, 34),
        triggerZone = {
            debug = false,
            location = vector4(60.72, -370.96, 40.84, 64),
            size = 2.0,
            length = 5.0,
            width = 5.0,
            height = 5.0,
            rotation = 330.0,
        }
    },
    [6] = {
        model = "nw_spider",
        location = vector4(-355.08, -126.70, 38.88, 152),
        triggerZone = {
            debug = false,
            location = vector4(-361.42, -131.65, 38.72, 255),
            size = 2.0,
            length = 5.0,
            width = 5.0,
            height = 5.0,
            rotation = 330.0,
        }
    },
    [7] = {
        model = "s_m_m_lifeinvad_01",
        location = vector4(-1334.69, -1026.85, 7.74, 195),
        triggerZone = {
            debug = false,
            location = vector4(-1330.37, -1031.80, 7.68, 315),
            size = 2.0,
            length = 5.0,
            width = 5.0,
            height = 5.0,
            rotation = 330.0,
        }
    },
    [8] = {
        model = "nw_spider",
        location = vector4(-1592.47, -894.44, 9.64, 24),
        triggerZone = {
            debug = false,
            location = vector4(-1601.71, -889.76, 9.53, 84),
            size = 2.0,
            length = 10.0,
            width = 10.0,
            height = 10.0,
            rotation = 330.0,
        }
    },
}

Config.FoodStands = {}
    
    


Config.NazarAnimations = true -- Adds a simple animation to the Nazar Fortune Teller when the player is close to the prop
