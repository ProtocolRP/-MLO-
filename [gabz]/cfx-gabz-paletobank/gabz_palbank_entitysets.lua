local interiors = {
    {
        ipl = 'gabz_paletobank_milo_',
        coords = { x = -106.037, y = 6467.548, z = 32.169 },
        entitySets = {
            { name = 'palbank_vault_trolleys', enable = true }, -- gold and cash trolleys
        }
    },
}

CreateThread(function()
    for _, interior in ipairs(interiors) do
        if not interior.ipl or not interior.coords or not interior.entitySets then
            print('^5[GABZ]^7 ^1Error while loading interior.^7')
            return
        end
        RequestIpl(interior.ipl)
        local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
        if IsValidInterior(interiorID) then
            for __, entitySet in ipairs(interior.entitySets) do
                if entitySet.enable then
                    EnableInteriorProp(interiorID, entitySet.name)
                    if entitySet.color then
                        SetInteriorPropColor(interiorID, entitySet.name, entitySet.color)
                    end
                else
                    DisableInteriorProp(interiorID, entitySet.name)
                end
            end
            RefreshInterior(interiorID)
        end
    end
    print("^5[GABZ]^7 Interiors datas loaded.")
end)