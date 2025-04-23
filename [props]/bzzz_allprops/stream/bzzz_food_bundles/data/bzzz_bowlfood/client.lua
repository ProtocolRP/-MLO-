--[[ 

- Animation template example
- Mouth opening does not work for addon animations
- You have to run two animations :(
- I'm not a scripter, so it's not in my power to help you with the script
  

]]--


RegisterCommand('bzzz_alfredo', function()
    local playerPed = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(playerPed))

    -- First prop
    local boneIndex = GetPedBoneIndex(playerPed, 60309)
    local prop = CreateObject('bzzz_bowlfood_chicken_alfredo_a', x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop, playerPed, boneIndex, 0.07, 0.03, 0.07, -30.0, 0.0, 0.0, true, true, false, true, 1, true)

    -- Second prop
    local boneIndex2 = GetPedBoneIndex(playerPed, 28422)
    prop2 = CreateObject('bzzz_bowlfood_chicken_alfredo_b', x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop2, playerPed, boneIndex2, 0.04, 0.05, 0.0, -90.0, -27.0, -27.0, true, true, false, true, 1, true)

    -- Animations
    RequestAnimDict('bzzz_bowl_eat') --'bzzz_bowl_eat', 'bowl_eat'
    RequestAnimDict('facials@gen_male@base')  -- mouth opening
    while (not HasAnimDictLoaded("bzzz_bowl_eat")) do Wait(10) end
    while (not HasAnimDictLoaded("facials@gen_male@base")) do Wait(10) end  
    TaskPlayAnim(playerPed,"bzzz_bowl_eat","bowl_eat", 8.0, -8, -1, 49, 0, 0, 0, 0)
    PlayFacialAnim(playerPed, 'eating_1', 'facials@gen_male@base')

    Wait(5000) -- animation duration
    ClearPedSecondaryTask(playerPed)
    DeleteObject(prop)
    DeleteObject(prop2)
end)