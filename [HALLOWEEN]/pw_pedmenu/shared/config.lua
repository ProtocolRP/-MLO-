Config = {}

--[[ CORE ]]
-- qb-core | esx
Config.Framework = 'qb-core'

-- qb-core | es_extended
Config.FrameworkResourceName = 'qb-core'

-- qb-core = 'QBCore:Client:OnPlayerLoaded' | esx = 'esx:onPlayerSpawn' | or use your custom event
Config.PlayerSpawnedEvent = 'QBCore:Client:OnPlayerLoaded'

-- qb-core = 'QBCore:Client:OnPlayerUnload' | esx = 'esx:onPlayerLogout' | or use your custom event
Config.PlayerLoggedOutEvent = 'QBCore:Client:OnPlayerUnload'

--[[ PED MENU LOCATION ]]
Config.OpenPedMenuLocationKey = 'E'


-- [[ PED MENU EVERYWHERE ]]
Config.PedMenuEverywhereEnable = true
Config.OpenPedMenuLEverywhereKey = 'U'


-- [[ TAKE OFF CLOTHES ]]
Config.TakeOffClothesEnable = true
Config.OpenTakeOffClothesKey = 'Z'
Config.TakeOffClothesCommandEnable = true
Config.CommandOpenTakeOffClothes = 'toc'
Config.TakeOffClothesCommand = {
    mask = 'pmask',
    accs = 'paccs',
    vest = 'pvest',
    jacket = 'pjacket',
    pants = 'ppants',
    shoes = 'pshoes',
    glovebag = 'pglovebag',
    decals = 'pdecals',
    hairs = 'phairs',
    chain = 'pchain',
    hat = 'phat',
    glasses = 'pglasses',
    watches = 'pwatches',
    bracelets = 'pbracelets',
    ears = 'pears'
}

-- command fix my ped
Config.CommandFixMyPed = 'fmp'

Config.WhitelistPed = {
    -- qb-core = 'citizenid' [ RFNxxxxx ] | esx = 'identifier' [ char1:xxxx ]
    ['GHD03339'] = { -- XUY77821 | char1:5614efeb541d6a118c3557b4a2aa625f68a59635
        { model = 'nw_dummy', name = "Dummy", image = "" },
        { model = 'pmp_st_sweet', name = "Pretty Girl", image = "" },
        { model = 'pw_akira', name = "Akira", image = "" },
        { model = 'pw_brenda', name  = "Braids", image = ""},
        { model = 'pw_jester', name  = "Jester", image = ""},
        { model = 'pw_loki', name  = "Loki", image = ""},
        { model = 'pw_ortega', name  = "Ortega", image = ""},
        { model = 'Scrab_IA', name  = "Scrab", image = ""},
        { model = 'pw_brenda', name  = "Braids", image = ""},
        { model = 'DarthVader', name  = "DarthVader", image = ""},
        { model = 'FreddyKrueger', name  = "Freddy Krueger", image = ""},
        { model = 'Ghillie', name  = "Ghillie", image = ""},
        { model = 'Jason', name  = "Jason", image = ""},
        { model = 'KyloRen', name  = "Kylo Ren", image = ""},
        { model = 'Leatherface', name  = "Leather Face", image = ""},
        { model = 'MMyers', name  = "Mike Myers", image = ""},
        { model = 'RobocopV2', name  = "Robo Cop", image = ""},
        { model = 's_m_y_swat_01', name  = "Swat", image = ""},
        { model = 'SlenderMan', name  = "Slender Man", image = ""},
        { model = 't600', name  = "T-600", image = ""},
        { model = 'ThePredator', name  = "The Predator", image = "https://i.imgur.com/iPHZCnk.png"},
        { model = 'nw_ghost', name  = "Ghost", image = ""},
        { model = 'nw_mummy', name  = "Mummy", image = ""},
        { model = 'nw_skeleton', name  = "Skeleton", image = ""},
        { model = 'nw_spider', name  = "Spider", image = ""},

    },
        -- qb-core = 'citizenid' [ RFNxxxxx ] | esx = 'identifier' [ char1:xxxx ]
        ['UVV12490'] = { -- XUY77821 | char1:5614efeb541d6a118c3557b4a2aa625f68a59635
        { model = 'nw_dummy', name = "Dummy", image = "" },
        { model = 'pmp_st_sweet', name = "Pretty Girl", image = "" },
        { model = 'pw_akira', name = "Akira", image = "" },
        { model = 'pw_brenda', name  = "Braids", image = ""},
        { model = 'pw_jester', name  = "Jester", image = ""},
        { model = 'pw_loki', name  = "Loki", image = ""},
        { model = 'pw_ortega', name  = "Ortega", image = ""},
        { model = 'Scrab_IA', name  = "Scrab", image = ""},
        { model = 'pw_brenda', name  = "Braids", image = ""},
        { model = 'DarthVader', name  = "DarthVader", image = ""},
        { model = 'FreddyKrueger', name  = "Freddy Krueger", image = ""},
        { model = 'Ghillie', name  = "Ghillie", image = ""},
        { model = 'Jason', name  = "Jason", image = ""},
        { model = 'KyloRen', name  = "Kylo Ren", image = ""},
        { model = 'Leatherface', name  = "Leather Face", image = ""},
        { model = 'MMyers', name  = "Mike Myers", image = ""},
        { model = 'RobocopV2', name  = "Robo Cop", image = ""},
        { model = 's_m_y_swat_01', name  = "Swat", image = ""},
        { model = 'SlenderMan', name  = "Slender Man", image = ""},
        { model = 't600', name  = "T-600", image = ""},
        { model = 'ThePredator', name  = "The Predator", image = "https://i.imgur.com/iPHZCnk.png"},
        { model = 'nw_ghost', name  = "Ghost", image = ""},
        { model = 'nw_mummy', name  = "Mummy", image = ""},
        { model = 'nw_skeleton', name  = "Skeleton", image = ""},
        { model = 'nw_spider', name  = "Spider", image = ""},

    },
    ['FCA11998'] = { 
    { model = 'nw_dummy', name = "Dummy", image = "" },
    { model = 'pmp_st_sweet', name = "Pretty Girl", image = "" },
    { model = 'pw_akira', name = "Akira", image = "" },
    { model = 'pw_brenda', name  = "Braids", image = ""},
    { model = 'pw_jester', name  = "Jester", image = ""},
    { model = 'pw_loki', name  = "Loki", image = ""},
    { model = 'pw_ortega', name  = "Ortega", image = ""},
    { model = 'Scrab_IA', name  = "Scrab", image = ""},
    { model = 'pw_brenda', name  = "Braids", image = ""},
    { model = 'DarthVader', name  = "DarthVader", image = ""},
    { model = 'FreddyKrueger', name  = "Freddy Krueger", image = ""},
    { model = 'Ghillie', name  = "Ghillie", image = ""},
    { model = 'Jason', name  = "Jason", image = ""},
    { model = 'KyloRen', name  = "Kylo Ren", image = ""},
    { model = 'Leatherface', name  = "Leather Face", image = ""},
    { model = 'MMyers', name  = "Mike Myers", image = ""},
    { model = 'RobocopV2', name  = "Robo Cop", image = ""},
    { model = 's_m_y_swat_01', name  = "Swat", image = ""},
    { model = 'SlenderMan', name  = "Slender Man", image = ""},
    { model = 't600', name  = "T-600", image = ""},
    { model = 'ThePredator', name  = "The Predator", image = "https://i.ibb.co/RTvMqNxQ/The-Predator.png"},
    { model = 'nw_ghost', name  = "Ghost", image = ""},
    { model = 'nw_mummy', name  = "Mummy", image = ""},
    { model = 'nw_skeleton', name  = "Skeleton", image = ""},
    { model = 'nw_spider', name  = "Spider", image = ""},

}
}


-- location ped menu
Config.PedMenuLocation = {
    [1] = { coords = vector3(15.23, -1025.72, 46.37), radius = 1.5, debug = false },
    
}