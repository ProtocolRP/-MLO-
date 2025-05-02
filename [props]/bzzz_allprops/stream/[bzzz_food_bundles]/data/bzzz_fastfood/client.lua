--[[ 

- Animation template example
- Mouth opening does not work for addon animations
- You have to run two animations :(
- I'm not a scripter, so it's not in my power to help you with the script
  

]]--


RegisterCommand('noodle_a', function()
    local playerPed = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(playerPed))

    -- First prop
    local boneIndex = GetPedBoneIndex(playerPed, 18905)
    local prop = CreateObject('bzzz_prop_fastfood_noodle_a', x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop, playerPed, boneIndex, 0.1, 0.03, 0.07, 35.0, 15.0, 223.0, true, true, false, true, 1, true)

    -- Second prop
    local boneIndex2 = GetPedBoneIndex(playerPed, 57005)
    prop2 = CreateObject('bzzz_prop_fastfood_noodle_b', x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(prop2, playerPed, boneIndex2, 0.1, 0.06, 0.0, 78.0, 150.0, 186.0, true, true, false, true, 1, true)

    -- Animations
    RequestAnimDict('bzzz_fastfood_anim2') --'bzzz_fastfood_anim2', 'anim2'
    RequestAnimDict('facials@gen_male@base')  -- mouth opening
    while (not HasAnimDictLoaded("bzzz_fastfood_anim2")) do Wait(10) end
    while (not HasAnimDictLoaded("facials@gen_male@base")) do Wait(10) end  
    TaskPlayAnim(playerPed,"bzzz_fastfood_anim2","anim2", 8.0, -8, -1, 49, 0, 0, 0, 0)
    PlayFacialAnim(playerPed, 'eating_1', 'facials@gen_male@base')

    Wait(5000) -- animation duration
    ClearPedSecondaryTask(playerPed)
    DeleteObject(prop)
    DeleteObject(prop2)
end)