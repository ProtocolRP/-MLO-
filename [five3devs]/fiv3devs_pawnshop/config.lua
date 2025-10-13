-- [[ #########################################################          OX TARGET        ########################################################## ]]
ox_target = true
interactionKey = false

-- [[ #########################################################       DEFAULT LANGUAGE    ########################################################## ]]

defaultInteractionLabel = "default - Press ~INPUT_PICKUP~ to inspect a"

defaultPropsLabels = {
    fishingrod = "default - Canna da pesca",
    camera     = "default - Fotocamera",
    toy        = "default - Macchinina",
    perfume    = "default - Profumo",
    juke       = "default - Jukebox",
    mic        = "default - Microfono",
    drum       = "default - Drum",
    stick      = "default - Drum Stick",
    guitar     = "default - Chitarra",
    laptop     = "default - Portatile",
    golf       = "default - Mazza da golf",
    volleyball = "default - Palla",
    suitcase   = "default - Valigia"
}

-- [[ #########################################################       CUSTOM LANGUAGE    ########################################################## ]]

languageInteractionLabel = {
    [0] = "Press ~INPUT_PICKUP~ to inspect a",
    [1] = "Appuyez sur ~INPUT_PICKUP~ pour inspecter un",
    [2] = "Drücken Sie ~INPUT_PICKUP~, um eine",
    [3] = "Premi ~INPUT_PICKUP~ per ispezionare",
    [4] = "Pulse ~INPUT_PICKUP~ para inspeccionar un"
}

languagePropLabel = {
    [0] = {                   --[[ US props labels - American ]]
        fishingrod = "Fishing rod",
        camera     = "Camera",
        toy        = "Toy car",
        perfume    = "Perfume",
        juke       = "Jukebox",
        mic        = "Microphone",
        drum       = "Drum",
        stick      = "Drumstick",
        guitar     = "Guitar",
        laptop     = "Laptop",
        golf       = "Golf club",
        volleyball = "Volleyball",
        suitcase   = "Bag"
    },
    [1] = {                   --[[ FR props labels - French ]]
        fishingrod = "Canne à pêche",
        camera     = "Appareil photo",
        toy        = "Voiture",
        perfume    = "Parfum",
        juke       = "Jukebox",
        mic        = "Microphone",
        drum       = "Tambour",
        stick      = "Baguettes à tambour",
        guitar     = "Guitare",
        laptop     = "Laptop",
        golf       = "Club de golf",
        volleyball = "Balle de volley",
        suitcase   = "Valise"
    },
    [2] = {                   --[[ DE props labels - German ]]
        fishingrod = "Angelrute",
        camera     = "Kamera",
        toy        = "Auto",
        perfume    = "Parfüm",
        juke       = "Jukebox",
        mic        = "Mikrofon",
        drum       = "Tamburo",
        stick      = "Trommelstäbe",
        guitar     = "Gitarre",
        laptop     = "Laptop",
        golf       = "Golfschläger",
        volleyball = "Volleyball",
        suitcase   = "Koffer"
    },
    [3] = {                   --[[ IT props labels - Italian ]]
        fishingrod = "Canna da pesca",
        camera     = "Fotocamera",
        toy        = "Macchinina",
        perfume    = "Profumo",
        juke       = "Jukebox",
        mic        = "Microfono",
        drum       = "Drum",
        stick      = "Drum Stick",
        guitar     = "Chitarra",
        laptop     = "Portatile",
        golf       = "Mazza da golf",
        volleyball = "Palla",
        suitcase   = "Valigia"
    },
    [4] = {                   --[[ ES props labels - Spanish ]]
        fishingrod = "Caña de pescar",
        camera     = "Cámara",
        toy        = "Coche de juguete",
        perfume    = "Perfume",
        juke       = "Jukebox",
        mic        = "Micrófono",
        drum       = "Tambor",
        stick      = "palillos",
        guitar     = "Guitarra",
        laptop     = "Laptop",
        golf       = "Palo de golf",
        volleyball = "Pelota de voleibol",
        suitcase   = "Maleta"
    }
}

--[[ change the icon for ox_target interations ]]-- https://fontawesome.com/icons
icons = {
    fishingrod = "fa-solid fa-fish",
    camera = "fa-solid fa-camera",
    toy = "fa-solid fa-car",
    perfume = "fa-solid fa-spray-can-sparkles",
    juke = "fa-solid fa-music",
    mic = "fa-solid fa-microphone",
    drum = "fa-solid fa-music",
    stick = "fa-solid fa-drum",
    guitar = "fa-solid fa-guitar",
    laptop = "fa-solid fa-laptop",
    golf = "fa-solid fa-golf-ball-tee",
    volleyball = "fa-solid fa-volleyball",
    suitcase = "fa-solid fa-suitcase",
}