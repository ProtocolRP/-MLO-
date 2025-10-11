
local spotlightStates = {}
local spotlights = {
    {
        pos = vector3(2432.33, 4972.63, 42.87), --Basement 1
        dirX = 1.0,
        dirY = -3.5,
        dirZ = -1.5,
        color = {255, 0, 0},
        distance = 30.0, 
        brightness = 2.0, 
        radius = 55.0
    },
}

local Sleep = 0
CreateThread(function()
    while true do
        Wait(Sleep)
        if HalloweenMissionActive then
            Sleep = 0
            for i, spot in ipairs(spotlights) do
                if spotlightStates[i] then -- Check if the spotlight is turned on
                    DrawSpotLight(
                        spot.pos.x, spot.pos.y, spot.pos.z, -- Position
                        spot.dirX, spot.dirY, spot.dirZ, -- Direction vector
                        spot.color[1], spot.color[2], spot.color[3], -- Color
                        spot.distance, 
                        spot.brightness, 
                        0.0, -- Smoothness of the circle edge
                        spot.radius,
                        1.0
                    )
                end
            end
        else
            Sleep = 1000
        end
    end
end)

function ToggleLightSwitch(args)
    spotlightStates[args] = not spotlightStates[args]
end
