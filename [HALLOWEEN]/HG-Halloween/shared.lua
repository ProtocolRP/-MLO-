
Framework, QBCore, ESX = nil, nil, nil

if GetResourceState("es_extended") == "started" then
    Framework = "esx"
    ESX = exports["es_extended"]:getSharedObject()
elseif GetResourceState("qb-core") == "started" then
    Framework = "qb"
    QBCore = exports["qb-core"]:GetCoreObject()
end
