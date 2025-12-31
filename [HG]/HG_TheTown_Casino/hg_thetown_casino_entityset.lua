local EntitySets = {
    CasinoTableYes = "casinoprops_yes",
    CasinoTableNo = "casinoprops_no"
}

local interiorCoords = vector3(-1362.37708, -1054.173, 10.4661064)

local iplName = "hg_thetown_casino_milo"

-- #######################################################################
-- HOW TO TOGGLE CASINO PROPS ON OR OFF
--
-- This script controls whether the casino props (like tables) are visible.
--
-- ▶ To toggle the props ON or OFF:
--    Just change "Yes" to "No" or "No" to "Yes" in this line below:
--
local selectedEntitySet = EntitySets.CasinoTableYes --    For example:
--                                                         - To turn props OFF, use: EntitySets.CasinoTableNo
--                                                         - To turn props ON, use: EntitySets.CasinoTableYes
--
-- ▶ After changing it, restart the script or the server to apply it.
--
-- That’s it!
-- ####################################################################ü

RequestIpl(iplName)

Citizen.CreateThread(function()
    while not IsIplActive(iplName) do
        Citizen.Wait(0)
    end

    local interiorID = GetInteriorAtCoords(interiorCoords.x, interiorCoords.y, interiorCoords.z)

    if IsValidInterior(interiorID) then

        ActivateInteriorEntitySet(interiorID, selectedEntitySet)

        RefreshInterior(interiorID)
    else
        print("Invalid interior ID or the interior could not be found at the provided coordinates.")
    end
end)
