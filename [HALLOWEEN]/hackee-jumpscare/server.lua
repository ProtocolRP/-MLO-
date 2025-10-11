local allowed =
{
    "steam:110000111d95a8b",
    "steam:11000011995ca9a",
    "steam:11000010ae121e4",
    "steam:steamhex4"
}
--You can get your steamhex from http://www.vacbanned.com/ and entering your steam id then copying Steam3 ID (64bit) HEX and not DEC
RegisterCommand("jumpscareon", function(source, args)
    -- Usage: /jumpscareon <ID>
    -- Creates a popup on the players screen and starts playing a sound.
    local identifier = GetPlayerIdentifiers(source)[1]
    if checkAllowed(identifier) then
      if args[1] == nil then
        print("^1Error, you must provide a player ID.")
	return
      end
      local target = args[1]
      TriggerClientEvent("jumpscare:toggleNUI", target, true)
    end
end)

RegisterCommand("jumpscareoff", function(source, args)
    -- Usage: /jumpscareoff <ID>
    -- Removes the popup from the players screen.
    local identifier = GetPlayerIdentifiers(source)[1]
    if checkAllowed(identifier) then
        if args[1] == nil then
            print("^1Error, you must provide a player ID.")
	    return
        end

        local target = args[1]
        TriggerClientEvent("jumpscare:toggleNUI", target, false)
    end
end)

function checkAllowed(id)
    for k, v in pairs(allowed) do
        if id == v then
	    return true
        end
    end
    return false
end
