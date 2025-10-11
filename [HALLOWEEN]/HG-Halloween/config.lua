Config = {}

Config.Halloween = {
    Debug = false,                -- Enable Debugging
    Inventory = 'tgiann-inventory',   -- Choose the inventory system: qb-inventory, ox_inventory, codem-inventory, qs-inventory, esx_inventoryhud
    Notify = 'ox',                -- Choose the notification system: ox, qb, okokNotify, mythic, esx, gta
    InteractiveKey = 38,  --Press [E] to Interact  Doc: https://docs.fivem.net/docs/game-references/controls/

    Mission = {
        Enable = true,          -- Enable Haunted House Mission
        StartCoords = vector4(2450.03, 4952.38, 43.97, 234.5),
        EndMissionCommand = "endhousemission",       -- Command to end the mission
        Volume = {
            Music = 0.3,        -- Volume for the background music
            Voice = 1.0,        -- Volume for the voice audio
            Ghost = 4.0,        -- Volume for the ghost audio
        },
        Blip = {
            Enable = true,
            Sprite = 310,
            Color = 1,
            Name = "Haunted House Mission",
            Scale = 1.2,
        },
    },

    LegionPark ={
        Graveyard = {
            Coords = vector3(230.43, -881.91, 31.09),
            Link = "https://files.fivemerr.com/audios/f0b4b684-24aa-4f75-a360-6e2a2245571f.ogg",
            Volume = 0.5,  -- Volume for the audio
        },

        BigPumpKin = {
            Coords = vector3(181.02, -969.77, 31.15),
            Link = "https://files.fivemerr.com/audios/f0b4b684-24aa-4f75-a360-6e2a2245571f.ogg",
            Volume = 0.5,
        }
    },

    GhostHunt = {
        Enable = true,          -- Enable Ghost Hunt Competition
        NPC = {
            Model = "u_m_y_zombie_01",                          -- Model for the NPC for the Main Menu
            Coords = vector4(227.18, -864.89, 30.09, 48),    -- Coords for the NPC
        },
        NightSpawn = true,
        PhotoCommand = "takephoto",                         -- Command to take a photo of the ghost
        GhostModel = `m23_1_prop_m31_ghostjohnny_01a`,      -- Model for the ghost prop
        Blip = {
            Enable = true,
            Sprite = 362,
            Color = 1,
            Name = "Halloween Missions",
            Scale = 1.1,
        },
        GhostsLocation = {     
            [1] =  vector4(451.05, -855.33, 27.30, 90.00),
            [2] =  vector4(315.33, -684.68, 29.07, -66.00),
            [3] =  vector4(64.78, -752.3457, 30.70, 210.00),
            [4] =  vector4(-210.53, -1206.36, 29.42, 150.00),
            [5] =  vector4(13.98, -1113.59, 37.15, 206.00),
            [6] =  vector4(-151.44, -160.35, 42.66, 308.00),
            [7] =  vector4(-356.25, -108.30, 37.87, 349.00),
            [8] =  vector4(-665.92, -720.71, 26.05, 81.00),
            [9] =  vector4(-714.06, -886.54, 22.86, -161.00),
            [10] = vector4(304.71, -1160.97, 28.27, 48.00),
            [11] = vector4(1541.81, 787.80, 76.94, 320.00),
            [12] = vector4(2544.34, 2607.39, 37.01, 203.00),
            [13] = vector4(2355.17, 3063.78, 47.40, 174.00),
            [14] = vector4(2040.63, 3189.22, 44.30, 149.00),
            [15] = vector4(1900.65, 3285.70, 45.07, 135.00),
            [16] = vector4(1693.07, 3596.14, 34.71, 210.00),
            [17] = vector4(1739.47, 3700.77, 33.17, 66.00),
            [18] = vector4(1609.22, 3784.84, 33.67, 38.00),
            [19] = vector4(1961.16, 3826.32, 31.16, 304.00),
            [20] = vector4(2147.26, 3919.21, 30.17, 337.42),
        }
    },

    PumpkinHunt = {
        Enable = true,          -- Enable Pumpkin Hunt Competition
        RewardType = "item",    -- item, money
        Audio = {
            OpenPumpkin = "https://r2.fivemanage.com/8b2LBZ6nwhDkK1opV6Gwa/foley_pumpkin_cut_knife_halloween_001.ogg",
            ScaryNPC = "https://youtu.be/Ox7JOd1YMPg?si=1AqfU9XagTfVpKDS",
            Volume = 0.5,  -- Volume for the audio
        },
        Treat = {
            Chance = 50,        -- Chance to get a treat orelse trick
            Rewards = {
                Items = {       -- Item names & Amount
                    ['pumpkin_coin'] = 10,
                    ['chocolate_meteorite'] = 1,
                    ['cake_pop'] = 1,
                },
                Money = math.random(550, 1800),      -- Money Amount
            }
        },
        Model = `bzzz_hpack_pumpkins_d`,        -- Model for the pumpkin prop
        Location = {
            [1] = vector4(309.14, -911.32, 29.30, 29),
            [2] = vector4(334.07, -951.19, 28.08, 156.42),
            [3] = vector4(150.87, -1062.86, 27.68, 120.66),
            [4] = vector4(40.34, -952.62, 27.81, 160.74),
            [5] = vector4(119.7, -894.17, 28.90, 270.53),
            [6] = vector4(0.15, -820.83, 29.21, 275.01),
            [7] = vector4(251.06, -665.72, 36.70, 35.33),
            [8] = vector4(166.84, -586.56, 42.30, 181.04),
            [9] = vector4(337.65, -780.23, 27.76, 60.23),
            [10] = vector4(285.3, -695.81, 27.79, 293.28),
            [11] = vector4(375.44, -735.61, 27.77, 223.31),
            [12] = vector4(376.44, -903.94, 27.90, 275.72),
            [13] = vector4(488.28, -981.97, 26.05, 330.89),
            [14] = vector4(448.99, -1074.8, 27.70, 28.72),
            [15] = vector4(291.72, -1077.72, 27.90, 279.57),
            [16] = vector4(268.42, -1165.24, 27.65, 66.26),
            [17] = vector4(53.58, -1044.62, 27.97, 228.54),
            [18] = vector4(-9.26, -1106.64, 27.44, 198.18),
            [19] = vector4(-42.3, -1085.29, 25.16, 48.13),
            [20] = vector4(2.55, -1024.68, 27.45, 111.37),
            [21] = vector4(-246.04, -1184.39, 21.58, 339.86),
            [22] = vector4(-344.32, -979.43, 27.68, 132.34),
            [23] = vector4(-140.61, -875.97, 28.18, 156.84),
            [24] = vector4(-285.26, -924.05, 29.58, 336.02),
            [25] = vector4(-252.94, -693.16, 32.12, 284.47),
            [26] = vector4(212.97, -320.33, 42.61, 136.94),
            [27] = vector4(74.56, -274.71, 46.63, 170.85),
            [28] = vector4(-38.66, -216.92, 44.29, 139.55),
            [29] = vector4(-256.7, -234.19, 34.32, 102.68),
        }
    },

    Locals = {      -- Language Translations
        Main = {
            ['MainMenuOpen'] = "Open Halloween Missions",
            ['MainRead'] = "Click to Read",
        },

        GhostHunt = {
            --Start Menu
            ['MenuTitle'] = "👻 Ghost Photo Hunt Competition",
            ['MenuDesc'] = "Begin the ultimate ghost photo hunt",
            ['InfoHeader'] = "🎃 Ghost Hunt 🎃",
            ['InfoContent'] = "The city is filled with restless spirits! Your mission is to capture their presence on camera. \n\n **Note:** Use */takephoto* to snap a ghost photo. The first to capture all the hidden spirits will be crowned the victor! \n\n **Hint:** Ghosts resemble this creepy figure: \n\n![Ghost](https://files.fivemerr.com/images/50de4e3b-df80-46ee-bdb5-74e69267c889.png)",
        
            --GhostHunt Menu
            --Option 1
            ['GHMenu1Title'] = "Start Competition",
            ['GHMenu1Des'] = "Start the ghost photo competition",
            ['GHMenu1ContentDes'] = "Go and take a photo of ghosts and submit it to the competition. \n\n Hint: Ghosts are hidden around the City & Sandy.",

            --Option 2
            ['GHMenu2Head'] = "Ghost Photo Competition Entries",
            ['GHMenu2Title'] = "View Entries",
            ['GHMenu2Des'] = "View the entries for the ghost photo competition",


            --Option 3
            ['GHMenu3Head'] = "Ghost Photo Competition Winners",
            ['GHMenu3Title'] = "View Winners",
            ['GHMenu3Des'] = "View the winners of the ghost photo competition",
            ['GHMenu3ContentDes'] = "View the winners of the ghost photo competition and their completion time.",
            ['GHMenu3NoWinner'] = "No entries yet! Be the first to complete the competition.",



            --Notify
            ['NotifyNoClose'] = "Not close enough or not in ghost location!",
            ['NotifyPhoto'] = "You captured a ghost! Keep searching for the rest.",
            ['NotifyAlreadyFound'] = "You have already found this ghost!",
            ['NotifyPhotoAll'] = "Congratulations! You captured all the ghosts.",
        },
        PumpkinHunt = {
            --Start Menu
            ['MenuTitle'] = "🎃 Pumpkin Hunt",
            ['MenuDesc'] = "Start the pumpkin hunt",
            ['InfoHeader'] = "🎃 Pumpkin Hunt 🎃",
            ['InfoContent'] = "Venture through the city to find hidden pumpkins. Each one holds mysterious rewards! \n\n **Hint:** Look out for pumpkins like these: \n\n![Pumpkin](https://files.fivemerr.com/images/09638fd5-c874-4e3a-9f74-2c62c49b7b66.png)",
        
            ['InteractOpen'] = "Open the Pumpkin",
            ['InteractPumpkinOpen'] = "Opening Pumpkin",

            --Notify
            ['NotifyAlreadyOpened'] = "You already opened this pumpkin!",
            ['NotifyTrick'] = "Boom! You got tricked!",
            ['NotifyTreat'] = "You found a treat!",
        },
        HauntedHouse = {
            --Start Menu
            ['MenuTitle'] = "👻 Haunted House Mission",
            ['MenuDesc'] = "Face the terror of the haunted house",
            ['InfoHeader'] = "🎃 Haunted House 🎃",
            ['InfoContent'] = "Dare to enter the haunted house where dark secrets await. Complete chilling tasks and uncover the mystery within. \n\n **Hint:** Head to the marked location on your map to begin the mission. A mysterious figure will guide you inside. \n\n![Haunted House](https://files.fivemerr.com/images/f5344fcb-d50d-4cbd-b999-3dc48807a53e.png)",
            
            --Interact
            ['noflashlight'] = "You need to hold a flashlight in your hand to start the mission",
            ['MissionStart'] = "I **DARE** you to start the Halloween Mission! \n\n**Command:** */endhousemission* to End Mission\n\n ![Halloween Image](https://i.imgur.com/bpzxN7L.png)",

            --Step 1
            ['Step1a'] = "To anyone who finds this… we are trapped. Our familys souls are bound to this house. We dont know how or why, but theres something sinister here. The last time we spent time together was in the dining room. \n\nPlease, if you want to help us, find a way to let us rest in peace. \n\n---*The Evans Family* \n\n![Ghost Image 1](https://files.fivemerr.com/images/7e2ddb22-91a7-41a5-ac8a-9a2a8c6b2d69.png)",
            ['Step2a'] = "We never spoke to anyone about this before we disappeared, but something is terribly wrong in this house. Every member of our family experienced strange and terrible situations. We were especially worried about our daughter Emily, as she would sometimes sing her favorite rhymes in a strange voice in her room at night. \n\nMy wife tried countless times to recite holy scripture to protect us from the evil power, but she failed to complete it each time. The last time Emily went into the basement, she came back upstairs terrified, saying she had seen something down there.I know there is something down there. \n\nIf you are looking for answers, start in the basement \n\n---*Daniel Evans* (Father) \n\n![Ghost Image 2](https://files.fivemerr.com/images/24695815-efdf-4b2d-8f93-70f7133b8313.png)",
            ['Step3a'] = "I dont like the basement. It feels cold there. That night my ball rolled down the stairs and when I went to get it, I saw someone standing in the corner. I got so scared. \n\nMama says its just my imagination, but I know what I saw. After that, I went upstairs 2nd floor to my room to play and then everything went dark.. \n\n---*Emily Evans* (Daughter)\n\n![Ghost Image 3](https://files.fivemerr.com/images/24dac366-4a44-4882-8ab1-13e0dce14f1f.png)",
            ['Step3b'] = "You need to cast the spell before going upstairs. Find the table in this basement and perform the spell. You might need it later.",
            ['Step4a'] = "You are about to create the spell to destroy the evil spirits in the house. \n\nTake a deep breath and focus.",
            ['Step4b'] = "You have created the spell & dont spend anymore time anywhere. Something stirs upstairs in the 2nd floor of the house in her room. Another task calls, but you are not alone.",
            ['Step5a'] = "I was playing here when it happened. The air got heavy, and I felt like someone was watching me. I tried to run, but the door would not open. \n\nI dont remember what happened next, but I heard whispers—someone calling my name. Then, everything went black. \n\nPlease save my mom and dad! The last time I saw them was in the kitchen downstairs. \n\n--- *Emily Evans* (Daughter)\n\n![Ghost Image 3](https://files.fivemerr.com/images/d1404d04-e3a1-477b-ac8e-329be5c076fa.png)",
            ['Step6a'] = "I thought I could stop it. I found an old ritual in one of the books at the library. It was supposed to protect us, but something went wrong. \n\nNow, we are trapped. Emily was the first to go, then it took me. I fear for Daniel. If anyone finds this, the ritual must be completed. Please find Daniel. He was in the room next to the stairs which goes to upstairs 2nd floor, there are 2 small rooms, when I last saw him reading. \n\n--- *Anna Evans* (Mother) \n\n![Ghost Image 3](https://files.fivemerr.com/images/b2d73da6-22ab-41dd-a7fe-89e4abc77d41.png)",
            ['Step7a'] = "I failed them. I thought I could protect my family, but now we are all lost. There is only one way to free us. You must complete the ritual we could not. \n\nYou know the story and have the spell also, go to the middle hall near the stairs and perform the spell to destroy the evil spirits in the house. \n\n--- *Daniel Evans* (Father)\n\n![Ghost Image 3](https://files.fivemerr.com/images/4ea4946c-cc0d-4d9f-ad18-845e9564c2f0.PNG)",
            ['Step8a'] = "By the power of the divine, I command all restless spirits, bound by darkness, to be freed. May you find peace and rest, and may your souls be released from this cursed place. \n\n Proceed now!",
            ['Step8b'] = "The candles flicker and die, and the circle is broken. The spirits are appeased, and the house falls silent once more. The curse is lifted, and the family can rest in peace. \n\nYou have completed the Halloween mission.",
            
            --Notify
            ['NotifyLocation'] = "Waypoint set to the haunted house. Good luck!",
            ['NotifyReadNote'] = "You need to read the previous note first",

            ['NotifyNoINHouse'] = "You have left the House. The spirits are angry and the house is cursed once more. \n\n If you a fool enough to exit the mission, click *CONFIRM* or *CANCEL*.",
            ['NotifyEndMission'] = "You are about to End the Mission! Sure?",
        }
    }
}