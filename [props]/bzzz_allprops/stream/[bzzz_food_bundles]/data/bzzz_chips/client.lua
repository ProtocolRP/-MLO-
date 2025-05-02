--[[ 

- Animation template example
- Mouth opening does not work for addon animations
- You have to run two animations :(
- I'm not a scripter, so it's not in my power to help you with the script
  

]]--


RegisterCommand('chips_a', function()
    local playerPed = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(playerPed))

    -- First prop
    local boneIndex = GetPedBoneIndex(playerPed, 18905)
    local prop = CreateObject('bzzz_prop_chips_a_open', x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.02, 0.04, -90.0, 24.0, -23.0, true, true, false, true, 1, true)

    -- Second prop
    local boneIndex2 = GetPedBoneIndex(playerPed, 57005)
    prop2 = CreateObject('bzzz_prop_chip_a', x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop2, playerPed, boneIndex2, 0.14, 0.05, -0.02, 105.0, -38.0, 51.0, true, true, false, true, 1, true)

    -- Animations
    RequestAnimDict('bzzz_eating_chips') --'bzzz_eating_chips', 'eat_chip'
    RequestAnimDict('facials@gen_male@base')  -- mouth opening
    while (not HasAnimDictLoaded("bzzz_eating_chips")) do Wait(10) end
    while (not HasAnimDictLoaded("facials@gen_male@base")) do Wait(10) end  
    TaskPlayAnim(playerPed,"bzzz_eating_chips","eat_chip", 8.0, -8, -1, 49, 0, 0, 0, 0)
    PlayFacialAnim(playerPed, 'eating_1', 'facials@gen_male@base')

    Wait(5000) -- animation duration
    ClearPedSecondaryTask(playerPed)
    DeleteObject(prop)
    DeleteObject(prop2)
end)