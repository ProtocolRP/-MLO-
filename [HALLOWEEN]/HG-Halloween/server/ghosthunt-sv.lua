

CreateThread(function()
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS `ghosthunt` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `identifier` varchar(50) NOT NULL DEFAULT '0',
            `name` varchar(100) DEFAULT NULL,
            `found` int DEFAULT 0,
            `foundGhosts` json DEFAULT '[]',
            `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
    ]], {}, function(rowsChanged)
        if not rowsChanged then
            print("^8Failed ^3to create table '^2HG-Halloween^3'.^0")
        end
    end)
end)

lib.callback.register('server:HG-Halloween:ghosthuntinfo', function(source)
    local Result = MySQL.query.await('SELECT name, found, date FROM ghosthunt ORDER BY found DESC, date ASC', {})
    return Result
end)

lib.callback.register('server:HG-Halloween:winners', function(source)
    local Result = MySQL.query.await('SELECT name, date FROM ghosthunt WHERE found = ? AND date IS NOT NULL ORDER BY date ASC', {
        #Config.Halloween.GhostHunt.GhostsLocation
    })
    return Result
end)

-- Custom function to find a value in a table
local function FindTable(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

RegisterNetEvent('server:HG-Halloween:foundghost', function(ghostLocationNum)
    local src = source
    local Player, identifier

    -- Get player identifier based on framework
    if Framework == 'qb' then
        Player = QBCore.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    elseif Framework == 'esx' then
        Player = ESX.GetPlayerFromId(src)
        identifier = Player.identifier
    end

    -- Retrieve player's progress
    local result = MySQL.single.await('SELECT found, foundGhosts, date FROM ghosthunt WHERE identifier = ?', {identifier})
    local foundGhosts = {}

    if result then
        foundGhosts = json.decode(result.foundGhosts) or {}
    else
        local Name = (Framework == 'qb') and Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname or Player.getName()
        MySQL.insert.await('INSERT INTO ghosthunt (identifier, name, foundGhosts, found) VALUES (?, ?, ?, ?)', {identifier, Name, json.encode({}), 0})
    end

    -- Check if ghost is already found
    if not result or not FindTable(foundGhosts, ghostLocationNum) then
        table.insert(foundGhosts, ghostLocationNum)
        local newFoundCount = (result and result.found or 0) + 1

        if newFoundCount >= #Config.Halloween.GhostHunt.GhostsLocation then
            -- Store the completion date when all ghosts are found
            local completionDate = os.date('%Y-%m-%d %H:%M:%S')
            Notify(src, Config.Halloween.Locals.GhostHunt['NotifyPhotoAll'], '', 'success')
            MySQL.update.await('UPDATE ghosthunt SET found = ?, foundGhosts = ?, date = ? WHERE identifier = ?', {
                newFoundCount,
                json.encode(foundGhosts),
                completionDate,
                identifier
            })
        else
            -- Update progress if not all ghosts are found yet
            MySQL.update.await('UPDATE ghosthunt SET found = ?, foundGhosts = ? WHERE identifier = ?', {
                newFoundCount,
                json.encode(foundGhosts),
                identifier
            })
            Notify(src, Config.Halloween.Locals.GhostHunt['NotifyPhoto'], '', 'success')
        end
    else
        Notify(src, Config.Halloween.Locals.GhostHunt['NotifyAlreadyFound'], '', 'error')
    end
end)
