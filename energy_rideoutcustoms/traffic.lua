



CreateThread(function()

	while true do 

		local time = 5000
		if #(GetEntityCoords(PlayerPedId()) - vec3(541.24, -179.36, 54.27)) <= 50.0 then 
			time = 0
			ClearAreaOfPeds(541.24, -179.36, 54.27, 150.0, 1)
		end 
		--	ClearAreaOfVehicles(154.59, -882.51, 30.95, 250.0, false, false, false, false, false) -- 
		Wait(time)
	end 
end)




