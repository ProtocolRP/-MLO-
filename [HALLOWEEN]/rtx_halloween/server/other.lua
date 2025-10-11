function GivePlayerItemRTX(playersource, itemname, itemcount)
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			xPlayer.addInventoryItem(itemname, itemcount)
		end
	end
	if Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			xPlayer.Functions.AddItem(itemname, itemcount, false, {})
		end		
	end		
	if Config.Framework == "standalone" then
		-- add here item add function
	end	
end

function RemovePlayerItemRTX(playersource, itemname, itemcount)
	local removed = false
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			local itemdata = xPlayer.getInventoryItem(itemname)
			if itemdata.count >= itemcount then				
				xPlayer.removeInventoryItem(itemname, itemcount)	
				removed = true
			end
		end		
	end
	if Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			if xPlayer.Functions.GetItemByName(itemname).amount >= itemcount then
				xPlayer.Functions.RemoveItem(itemname, itemcount, false, {})
				removed = true
			end
		end		
	end		
	if Config.Framework == "standalone" then
		removed = true -- add here item remove function
	end
	return removed
end

function AddMoneyRTX(playersource, moneydata)
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			xPlayer.addMoney(moneydata)
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			xPlayer.Functions.AddMoney('cash', moneydata)
		end
	elseif Config.Framework == "standalone" then
		-- add here money add funciton	
	end
end	

function GiveTrickOrTreatRewardToPlayer(playersource, prizeiddata)
	local prizegamehandler = Config.TrickOrTreatReward[prizeiddata]
	if prizegamehandler.rewardtype == "money" then
		AddMoneyRTX(playersource, prizegamehandler.rewarddata)
	elseif prizegamehandler.rewardtype == "item" then
		GivePlayerItemRTX(playersource, prizegamehandler.rewarddata, 1)
	end
	TriggerClientEvent("rtx_halloween:Notify", playersource, LanguageFile("rewardget", prizegamehandler.prizelabel))
end

if Config.Framework == "esx" then
	for i, itemhandler in ipairs(Config.HalloweenDecorationsObjects) do
		ESX.RegisterUsableItem(itemhandler.decorationitemname, function(source)
			local playersource = source
			local xPlayer = ESX.GetPlayerFromId(playersource)
			if xPlayer then
				if halloweendecorationcreator[playersource] == nil then
					halloweendecorationcreator[playersource] = i
					TriggerClientEvent("rtx_halloween:DecorationCreatorStart", playersource, i)	
				end
			end
		end)	
	end
	ESX.RegisterUsableItem("trickortreatsbucket", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_halloween:TrickorTreatStart", playersource)
		end
	end)	
	ESX.RegisterUsableItem("pumpkin", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_halloween:CurvingMenu", playersource)
		end
	end)	
	RegisterCommand(Config.ScarePlayerCommand, function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				print(LanguageFile("scareplayer", tonumber(args[1])))
				TriggerClientEvent("rtx_halloween:ScarePlayer", tonumber(args[1]))
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then	
				if args[1] ~= nil then
					TriggerClientEvent("rtx_halloween:Notify", playersource, LanguageFile("scareplayer", tonumber(args[1])))
					TriggerClientEvent("rtx_halloween:ScarePlayer", tonumber(args[1]))
				else
					TriggerClientEvent("rtx_halloween:Notify", playersource, Language[Config.Language]["idplayer"])
				end					
			end
		end
	end)
	RegisterCommand("cleardecorations", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
			for i, decorationhandler in pairs(halloweendecorations) do
				MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
					['@id'] = decorationhandler.id
				}, function(changed)
					TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
					halloweendecorations[i] = nil
				end)					
			end	
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				for i, decorationhandler in pairs(halloweendecorations) do
					MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
						['@id'] = decorationhandler.id
					}, function(changed)
						TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
						halloweendecorations[i] = nil
					end)					
				end			
			end
		end
	end)

	RegisterCommand("clearnearbydecorations", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
		else
			local distanceremove = 5.0
			if args[1] ~= nil then
				distanceremove = tonumber(args[1])
			end
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				local playerhandler = GetPlayerPed(playersource)
				local playercoords = GetEntityCoords(playerhandler)			
				for i, decorationhandler in pairs(halloweendecorations) do
					local distancesdecoration = #(playercoords - decorationhandler.coords)
					if distancesdecoration < distanceremove then						
						MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
							['@id'] = decorationhandler.id
						}, function(changed)
							TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
							halloweendecorations[i] = nil
						end)	
					end
				end				
			end
		end
	end)	
end

if Config.Framework == "qbcore" then
	for i, itemhandler in ipairs(Config.HalloweenDecorationsObjects) do
		QBCore.Functions.CreateUseableItem(itemhandler.decorationitemname, function(source, item)
			local playersource = source
			local xPlayer = QBCore.Functions.GetPlayer(playersource)
			if xPlayer then
				if halloweendecorationcreator[playersource] == nil then
					halloweendecorationcreator[playersource] = i
					TriggerClientEvent("rtx_halloween:DecorationCreatorStart", playersource, i)	
				end
			end
		end)	
	end
	QBCore.Functions.CreateUseableItem("trickortreatsbucket", function(source, item)
		local playersource = source
		local xPlayer = QBCore.Functions.GetPlayer(playersource)	
		if xPlayer then
			TriggerClientEvent("rtx_halloween:TrickorTreatStart", playersource)
		end
	end)	
	QBCore.Functions.CreateUseableItem("pumpkin", function(source, item)
		local playersource = source
		local xPlayer = QBCore.Functions.GetPlayer(playersource)	
		if xPlayer then
			TriggerClientEvent("rtx_halloween:CurvingMenu", playersource)
		end
	end)	
	RegisterCommand(Config.ScarePlayerCommand, function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				print(LanguageFile("scareplayer", tonumber(args[1])))
				TriggerClientEvent("rtx_halloween:ScarePlayer", tonumber(args[1]))
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				if args[1] ~= nil then
					TriggerClientEvent("rtx_halloween:Notify", playersource, LanguageFile("scareplayer", tonumber(args[1])))
					TriggerClientEvent("rtx_halloween:ScarePlayer", tonumber(args[1]))
				else
					TriggerClientEvent("rtx_halloween:Notify", playersource, Language[Config.Language]["idplayer"])
				end					
			end
		end
	end)
	RegisterCommand("cleardecorations", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
			for i, decorationhandler in pairs(halloweendecorations) do
				MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
					['@id'] = decorationhandler.id
				}, function(changed)
					TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
					halloweendecorations[i] = nil
				end)					
			end	
		else
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				for i, decorationhandler in pairs(halloweendecorations) do
					MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
						['@id'] = decorationhandler.id
					}, function(changed)
						TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
						halloweendecorations[i] = nil
					end)					
				end			
			end
		end
	end)

	RegisterCommand("clearnearbydecorations", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
		else
			local distanceremove = 5.0
			if args[1] ~= nil then
				distanceremove = tonumber(args[1])
			end
			if QBCore.Functions.HasPermission(playersource, 'admin') or QBCore.Functions.HasPermission(playersource, 'god') then
				local playerhandler = GetPlayerPed(playersource)
				local playercoords = GetEntityCoords(playerhandler)			
				for i, decorationhandler in pairs(halloweendecorations) do
					local distancesdecoration = #(playercoords - decorationhandler.coords)
					if distancesdecoration < distanceremove then						
						MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
							['@id'] = decorationhandler.id
						}, function(changed)
							TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
							halloweendecorations[i] = nil
						end)	
					end
				end				
			end
		end
	end)	
end

if Config.Framework == "standalone" then
	function GetPlayerIdentifierData(playersource)
		local licensedata = "unknown"
		for i, licensehandler in ipairs(GetPlayerIdentifiers(playersource)) do
			if string.sub(licensehandler, 1,string.len("license:")) == "license:" then
				licensedata = tostring(licensehandler)
			end
		end	
		return licensedata
	end
	RegisterCommand(Config.TrickOrTreatsCommand, function(source, args, raw)
		local playersource = source
		if playersource == 0 then			
		else
			TriggerClientEvent("rtx_halloween:TrickorTreatStart", playersource)
		end
	end)	
	RegisterCommand(Config.PumpkinCarvingCommand, function(source, args, raw)
		local playersource = source
		if playersource == 0 then			
		else
			TriggerClientEvent("rtx_halloween:CurvingMenu", playersource)
		end
	end)
	RegisterCommand(Config.DecorativeCommand, function(source, args, raw)
		local playersource = source
		if playersource == 0 then			
		else
			if args[1] ~= nil then
				local decorativeid = tonumber(args[1])
				if decorativeid >= 1 and decorativeid <= 35 then
					if halloweendecorationcreator[playersource] == nil then
						halloweendecorationcreator[playersource] = decorativeid
						TriggerClientEvent("rtx_halloween:DecorationCreatorStart", playersource, decorativeid)	
					end				
				else
					TriggerClientEvent("rtx_halloween:Notify", playersource, Language[Config.Language]["decorativerange"])
				end
			else
				TriggerClientEvent("rtx_halloween:Notify", playersource, Language[Config.Language]["decorativeid"])
			end
		end
	end)		
	RegisterCommand(Config.ScarePlayerCommand, function(source, args, raw)
		local playersource = source
		if playersource == 0 then	
			if args[1] ~= nil then
				print(LanguageFile("scareplayer", tonumber(args[1])))
				TriggerClientEvent("rtx_halloween:ScarePlayer", tonumber(args[1]))
			else
				print(Language[Config.Language]["idplayer"])
			end			
		else
		end
	end)
	RegisterCommand("cleardecorations", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
			for i, decorationhandler in pairs(halloweendecorations) do
				MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
					['@id'] = decorationhandler.id
				}, function(changed)
					TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
					halloweendecorations[i] = nil
				end)					
			end	
		else

		end
	end)

	RegisterCommand("clearnearbydecorations", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
		else
			--[[local distanceremove = 5.0 -- This is example from esx you need change this part of code
			if args[1] ~= nil then
				distanceremove = tonumber(args[1])
			end
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				local playerhandler = GetPlayerPed(playersource)
				local playercoords = GetEntityCoords(playerhandler)			
				for i, decorationhandler in pairs(halloweendecorations) do
					local distancesdecoration = #(playercoords - decorationhandler.coords)
					if distancesdecoration < distanceremove then						
						MySQL.Async.execute('DELETE FROM halloweendecorations WHERE id = @id', {
							['@id'] = decorationhandler.id
						}, function(changed)
							TriggerClientEvent("rtx_halloween:DecorationRemove", -1, decorationhandler.id)
							halloweendecorations[i] = nil
						end)	
					end
				end				
			end
			]]--
		end
	end)	
end

function GetPlayerIdentifierRTX(playersource)
	local playeridentifierdata = ""
	if Config.Framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			playeridentifierdata = xPlayer.identifier
		end
	elseif Config.Framework == "qbcore" then
		local xPlayer = QBCore.Functions.GetPlayer(playersource)
		if xPlayer then	
			playeridentifierdata = xPlayer.PlayerData.citizenid
		end
	elseif Config.Framework == "standalone" then
		playeridentifierdata = GetPlayerIdentifierData(playersource)
	end
	return playeridentifierdata
end