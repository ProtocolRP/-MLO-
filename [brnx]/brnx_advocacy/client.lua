-- IF YOU WANT CHANGE FOR WHITE THEME, LOOK THE .TXT FILE.
CreateThread(function()
    interiorID = GetInteriorAtCoords(-262.513367, 163.725266, 74.62637)
    if IsValidInterior(interiorID) then
        EnableInteriorProp(interiorID, "black")
        -- EnableInteriorProp(interiorID, "white")
        RefreshInterior(interiorID)
    end
end)