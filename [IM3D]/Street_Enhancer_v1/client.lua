Citizen.CreateThread(function()
    while (true) do
        ClearAreaOfPeds(184.203, -922.21, 47.411, 125.0, 306.306)
        Citizen.Wait(0)
    end
end)


Citizen.CreateThread(function()
    while (true) do
        ClearAreaOfVehicles(184.203, -922.21, 47.411, 300.0, 306.306)
        Citizen.Wait(0)
    end
end)