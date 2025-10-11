Config = {
    -- Framework Configuration
    Framework = "QBCore", -- "QBCore", "OLDQBCore", or "ESX"
    
    -- Notification System
    NotificationSystem = "qb", -- "qb", "esx", "ox", "custom"
    
    -- Buy Settings
    BuySettings = {
        UseProgressBar = true,
        ProgressBarDuration = 1500, -- ms
        RemoveItemAfterPurchase = false, -- Mağazadan item'i kaldır
        ShowPurchaseEffects = true, -- Satın alma efektleri
        MaxQuantityPerPurchase = 10, -- Tek seferde alınabilecek max miktar
    },
    
    -- Modern Shop Features
    ShopFeatures = {
        EnableCart = true,
        EnableSearch = true,
        EnableLevelRestrictions = false,
        EnableRaritySystem = false,
        EnableNotifications = true,
    },

    CurrencyItem = 'pumpkin_coin',
    
    Categories = {
        ["shop1"] = {
            "All", "Melee", "Heavy"
        },
    },
    Items = {
        ["shop1"] = {
            Items = {
                {
                    id = 1, name = "Bone Club", type = "Melee", rarity = "rare", category = "Melee",
                    model = "WEAPON_BONECLUB", price = 600,
                    icon = "fas fa-bone", image = "assets/img/item/weapon_boneclub.png",
                    stats = { damage = 20, accuracy = 10, range = 1, fireRate = 1.0 },
                    attributes = {
                        { name = "Damage", value = "20" },
                        { name = "Accuracy", value = "10%" },
                        { name = "Range", value = "1m" }
                    },
                    info = "When diplomacy fails, calcium prevails!"
                },
                {
                    id = 2, name = "Bucket", type = "Melee", rarity = "common", category = "Melee",
                    model = "WEAPON_BUCKET", price = 600,
                    icon = "fas fa-bucket", image = "assets/img/item/weapon_bucket.png",
                    stats = { damage = 15, accuracy = 5, range = 1, fireRate = 1.2 },
                    attributes = {
                        { name = "Damage", value = "15" },
                        { name = "Accuracy", value = "5%" },
                        { name = "Range", value = "1m" }
                    },
                    info = "Teanus add +5 damage"
                },
                {
                    id = 3, name = "Coffin", type = "Heavy", rarity = "rare", category = "Heavy",
                    model = "WEAPON_COFFIN", price = 650, 
                    icon = "fas fa-coffin", image = "assets/img/item/weapon_coffin.png",
                    stats = { damage = 40, accuracy = 10, range = 2, fireRate = 0.8 },
                    attributes = {
                        { name = "Damage", value = "40" },
                        { name = "Accuracy", value = "10%" },
                        { name = "Range", value = "2m" }
                    },
                    info = "Why wait for them to die? Bring their future home today!"
                },
                {
                    id = 4, name = "DeathNote", type = "Melee", rarity = "legendary", category = "Melee",
                    model = "WEAPON_DEATHNOTE", price = 666, 
                    icon = "fas fa-book-dead", image = "assets/img/item/weapon_deathnote.png",
                    stats = { damage = 999, accuracy = 100, range = 999, fireRate = 0.1 },
                    attributes = {
                        { name = "Damage", value = "999" },
                        { name = "Accuracy", value = "100%" },
                        { name = "Range", value = "∞" }
                    },
                    info = "Because violence is mightier than the pen"
                },
                {
                    id = 5, name = "Hellfire Sword", type = "Melee", rarity = "epic", category = "Heavy",
                    model = "WEAPON_HELLFIRESWORD", price = 750, 
                    icon = "fas fa-fire", image = "assets/img/item/weapon_hellfiresword.png",
                    stats = { damage = 70, accuracy = 50, range = 1.5, fireRate = 1.0 },
                    attributes = {
                        { name = "Damage", value = "70" },
                        { name = "Accuracy", value = "50%" },
                        { name = "Range", value = "1.5m" }
                    },
                    info = "Hellfire Not Included"
                },
                {
                    id = 6, name = "Inferno", type = "Melee", rarity = "epic", category = "Heavy",
                    model = "WEAPON_INFERNO", price = 750, 
                    icon = "fas fa-fire-flame-curved", image = "assets/img/item/weapon_inferno.png",
                    stats = { damage = 85, accuracy = 60, range = 10, fireRate = 0.6 },
                    attributes = {
                        { name = "Damage", value = "85" },
                        { name = "Accuracy", value = "60%" },
                        { name = "Range", value = "10m" }
                    },
                    info = "Powered by 100% renewable rage."
                },
                {
                    id = 7, name = "Pumpkin", type = "Melee", rarity = "common", category = "Melee",
                    model = "WEAPON_PUMPKIN", price = 500,
                    icon = "fas fa-pumpkin", image = "assets/img/item/weapon_pumpkin.png",
                    stats = { damage = 25, accuracy = 20, range = 5, fireRate = 0.9 },
                    attributes = {
                        { name = "Damage", value = "25" },
                        { name = "Accuracy", value = "20%" },
                        { name = "Range", value = "5m" }
                    },
                    info = "Splatters beautifully on contact."
                },
                {
                    id = 8, name = "Pumpkin Bat", type = "Melee", rarity = "uncommon", category = "Melee",
                    model = "WEAPON_PUMPKINBAT", price = 500, 
                    icon = "fas fa-bat", image = "assets/img/item/weapon_pumpkinbat.png",
                    stats = { damage = 35, accuracy = 20, range = 1.5, fireRate = 1.1 },
                    attributes = {
                        { name = "Damage", value = "35" },
                        { name = "Accuracy", value = "20%" },
                        { name = "Range", value = "1.5m" }
                    },
                    info = "What if fall decor could commit assault?"
                },
                {
                    id = 9, name = "Arm", type = "Melee", rarity = "common", category = "Improvised Weapons",
                    model = "WEAPON_ARM", price = 475, 
                    icon = "fas fa-hand", image = "assets/img/item/weapon_arm.png",
                    stats = { damage = 15, accuracy = 10, range = 1, fireRate = 1.3 },
                    attributes = {
                        { name = "Damage", value = "15" },
                        { name = "Accuracy", value = "10%" },
                        { name = "Range", value = "1m" }
                    },
                    info = "Technically recyclable"
                },
                {
                    id = 10, name = "Leg", type = "Melee", rarity = "common", category = "Improvised Weapons",
                    model = "WEAPON_LEG", price = 475, 
                    icon = "fas fa-walking", image = "assets/img/item/weapon_leg.png",
                    stats = { damage = 18, accuracy = 10, range = 1.2, fireRate = 1.2 },
                    attributes = {
                        { name = "Damage", value = "18" },
                        { name = "Accuracy", value = "10%" },
                        { name = "Range", value = "1.2m" }
                    },
                    info = "When life gives you limbs, make weaponry."
                },
                {
                    id = 11, name = "Vampire Stake", type = "Melee", rarity = "rare", category = "Improvised Weapons",
                    model = "WEAPON_STAKE", price = 666, 
                    icon = "fas fa-skull-crossbones", image = "assets/img/item/weapon_stake.png",
                    stats = { damage = 50, accuracy = 30, range = 1.2, fireRate = 1.0 },
                    attributes = {
                        { name = "Damage", value = "50" },
                        { name = "Accuracy", value = "30%" },
                        { name = "Range", value = "1.2m" }
                    },
                    info = "DIY solution to an eternal roommate problem."
                },
                {
                    id = 12, name = "Triple Bladed Scythe", type = "Melee", rarity = "legendary", category = "Heavy",
                    model = "WEAPON_TRIPLEBLADEDSCYTHE", price = 800, 
                    icon = "fas fa-scythe", image = "assets/img/item/weapon_triplebladedscythe.png",
                    stats = { damage = 80, accuracy = 40, range = 2.5, fireRate = 0.9 },
                    attributes = {
                        { name = "Damage", value = "80" },
                        { name = "Accuracy", value = "40%" },
                        { name = "Range", value = "2.5m" }
                    },
                    info = "Three times the edge, none of the practicality."
                },
                {
                    id = 13, name = "Witch Broom", type = "Melee", rarity = "rare", category = "Improvised Weapons",
                    model = "WEAPON_WITCHBROOM", price = 475, 
                    icon = "fas fa-broom", image = "assets/img/item/weapon_witchbroom.png",
                    stats = { damage = 25, accuracy = 20, range = 1.5, fireRate = 1.0 },
                    attributes = {
                        { name = "Damage", value = "25" },
                        { name = "Accuracy", value = "20%" },
                        { name = "Range", value = "1.5m" }
                    },
                    info = "Refuses to fly on Mondays."
                },
                {
                    id = 14, name = "Soul Scythe", type = "Melee", rarity = "epic", category = "Heavy",
                    model = "WEAPON_SOULSCYTHE", price = 750, 
                    icon = "fas fa-ghost", image = "assets/img/item/weapon_soulscythe.png",
                    stats = { damage = 90, accuracy = 60, range = 2.5, fireRate = 0.8 },
                    attributes = {
                        { name = "Damage", value = "90" },
                        { name = "Accuracy", value = "60%" },
                        { name = "Range", value = "2.5m" }
                    },
                    info = "Each swing collects frequent-flyer miles to the underworld."
                },
                {
                    id = 15, name = "Grave Stone", type = "Heavy", rarity = "rare", category = "Improvised Weapons",
                    model = "WEAPON_GRAVESTONE", price = 600, 
                    icon = "fas fa-tombstone", image = "assets/img/item/weapon_gravestone.png",
                    stats = { damage = 60, accuracy = 20, range = 1, fireRate = 0.7 },
                    attributes = {
                        { name = "Damage", value = "60" },
                        { name = "Accuracy", value = "20%" },
                        { name = "Range", value = "1m" }
                    },
                    info = "Comes preloaded with one unsatisfied spirit."
                },
            }
        },
                ["shop2"] = {
                    Items = {
                        {
                            id = 1, name = "Nailgun", type = "Melee", rarity = "uncommon", category = "Melee",
                            model = "WEAPON_NAILGUN", price = 600,
                            icon = "fas fa-tools", image = "assets/img/item/weapon_nailgun.png",
                            stats = { damage = 40, accuracy = 25, range = 1.2, fireRate = 1.3 },
                            attributes = {
                                { name = "Damage", value = "40" },
                                { name = "Accuracy", value = "25%" },
                                { name = "Range", value = "1.2m" }
                            },
                            info = "Surprisingly therapeutic...for you, not them."
                        },
                        {
                            id = 2, name = "Barbed Bat", type = "Melee", rarity = "rare", category = "Melee",
                            model = "WEAPON_ZBARBEDBAT", price = 700,
                            icon = "fas fa-baseball-bat", image = "assets/img/item/weapon_zbarbedbat.png",
                            stats = { damage = 45, accuracy = 20, range = 1.5, fireRate = 1.1 },
                            attributes = {
                                { name = "Damage", value = "45" },
                                { name = "Accuracy", value = "20%" },
                                { name = "Range", value = "1.5m" }
                            },
                            info = "When baseball season ends and purge season begins."
                        },
                        {
                            id = 3, name = "Clever", type = "Melee", rarity = "uncommon", category = "Melee",
                            model = "WEAPON_ZCLEVER", price = 550,
                            icon = "fas fa-knife-kitchen", image = "assets/img/item/weapon_zclever.png",
                            stats = { damage = 38, accuracy = 22, range = 1.3, fireRate = 1.2 },
                            attributes = {
                                { name = "Damage", value = "38" },
                                { name = "Accuracy", value = "22%" },
                                { name = "Range", value = "1.3m" }
                            },
                            info = "A real point-maker, in every sense."
                        },
                        {
                            id = 4, name = "Kitchen Knife", type = "Melee", rarity = "common", category = "Melee",
                            model = "WEAPON_ZKITCHEN", price = 300,
                            icon = "fas fa-utensils", image = "assets/img/item/weapon_zkitchen.png",
                            stats = { damage = 30, accuracy = 28, range = 1.1, fireRate = 1.4 },
                            attributes = {
                                { name = "Damage", value = "30" },
                                { name = "Accuracy", value = "28%" },
                                { name = "Range", value = "1.1m" }
                            },
                            info = "From chopping onions to chopping walkers."
                        },
                        {
                            id = 5, name = "Zombie Sniper", type = "Ranged", rarity = "epic", category = "Firearm",
                            model = "WEAPON_ZSNIPER", price = 2000,
                            icon = "fas fa-crosshairs", image = "assets/img/item/weapon_znsniper.png",
                            stats = { damage = 95, accuracy = 90, range = 120, fireRate = 0.8 },
                            attributes = {
                                { name = "Damage", value = "95" },
                                { name = "Accuracy", value = "90%" },
                                { name = "Range", value = "120m" }
                            },
                            info = "Slience is gold. Headshots are platinum."
                        },
                        {
                            id = 6, name = "Zombie Bat", type = "Melee", rarity = "uncommon", category = "Melee",
                            model = "WEAPON_ZOMBIE_BAT", price = 500,
                            icon = "fas fa-bat", image = "assets/img/item/weapon_zombie_bat.png",
                            stats = { damage = 36, accuracy = 20, range = 1.5, fireRate = 1.1 },
                            attributes = {
                                { name = "Damage", value = "36" },
                                { name = "Accuracy", value = "20%" },
                                { name = "Range", value = "1.5m" }
                            },
                            info = "Batter up, brains out."
                        },
                        {
                            id = 7, name = "Zombie Battleaxe", type = "Melee", rarity = "rare", category = "Melee",
                            model = "WEAPON_ZOMBIE_BATTLEAXE", price = 900,
                            icon = "fas fa-axe", image = "assets/img/item/weapon_zombie_battleaxe.png",
                            stats = { damage = 60, accuracy = 15, range = 1.8, fireRate = 0.9 },
                            attributes = {
                                { name = "Damage", value = "60" },
                                { name = "Accuracy", value = "15%" },
                                { name = "Range", value = "1.8m" }
                            },
                            info = "Now with 50% more decapitation!"
                        },
                        {
                            id = 8, name = "Zombie Blade", type = "Melee", rarity = "uncommon", category = "Melee",
                            model = "WEAPON_ZOMBIE_BLADE", price = 650,
                            icon = "fas fa-knife", image = "assets/img/item/weapon_zombie_blade.png",
                            stats = { damage = 40, accuracy = 25, range = 1.4, fireRate = 1.2 },
                            attributes = {
                                { name = "Damage", value = "40" },
                                { name = "Accuracy", value = "25%" },
                                { name = "Range", value = "1.4m" }
                            },
                            info = "Its not cursed, but your aim might be."
                        },
                        {
                            id = 9, name = "Zombie Crowbar", type = "Melee", rarity = "common", category = "Melee",
                            model = "WEAPON_ZOMBIE_CROWBAR", price = 400,
                            icon = "fas fa-crowbar", image = "assets/img/item/weapon_zombie_crowbar.png",
                            stats = { damage = 32, accuracy = 18, range = 1.3, fireRate = 1.2 },
                            attributes = {
                                { name = "Damage", value = "32" },
                                { name = "Accuracy", value = "18%" },
                                { name = "Range", value = "1.3m" }
                            },
                            info = "Not OSHA appoved, but very effective."
                        },
                        {
                            id = 10, name = "Zombie Hammer", type = "Melee", rarity = "uncommon", category = "Melee",
                            model = "WEAPON_ZOMBIE_HAMMER", price = 550,
                            icon = "fas fa-hammer", image = "assets/img/item/weapon_zombie_hammer.png",
                            stats = { damage = 42, accuracy = 20, range = 1.4, fireRate = 1.0 },
                            attributes = {
                                { name = "Damage", value = "42" },
                                { name = "Accuracy", value = "20%" },
                                { name = "Range", value = "1.4m" }
                            },
                            info = "Brain goes thump...Walkers go bye."
                        },
                        {
                            id = 11, name = "Zombie Katana", type = "Melee", rarity = "epic", category = "Melee",
                            model = "WEAPON_ZOMBIE_KATANA", price = 1500,
                            icon = "fas fa-dragon", image = "assets/img/item/weapon_zombie_katana.png",
                            stats = { damage = 70, accuracy = 35, range = 1.8, fireRate = 1.3 },
                            attributes = {
                                { name = "Damage", value = "70" },
                                { name = "Accuracy", value = "35%" },
                                { name = "Range", value = "1.8m" }
                            },
                            info = "Slient but deadly...like old sushi."
                        },
                        {
                            id = 12, name = "Zombie Sickle", type = "Melee", rarity = "rare", category = "Melee",
                            model = "WEAPON_ZOMBIE_SICKLE", price = 800,
                            icon = "fas fa-scythe", image = "assets/img/item/weapon_zombie_sickle.png",
                            stats = { damage = 55, accuracy = 18, range = 1.6, fireRate = 1.0 },
                            attributes = {
                                { name = "Damage", value = "55" },
                                { name = "Accuracy", value = "18%" },
                                { name = "Range", value = "1.6m" }
                            },
                            info = "Side effects may include decapitation."
                        },
                        {
                            id = 13, name = "Zombie SNS", type = "Ranged", rarity = "uncommon", category = "Firearm",
                            model = "WEAPON_ZOMBIE_SNS", price = 1000,
                            icon = "fas fa-gun", image = "assets/img/item/weapon_zombie_sns.png",
                            stats = { damage = 50, accuracy = 60, range = 40, fireRate = 1.8 },
                            attributes = {
                                { name = "Damage", value = "50" },
                                { name = "Accuracy", value = "60%" },
                                { name = "Range", value = "40m" }
                            },
                            info = "Great for last stands."
                        },
                        {
                            id = 14, name = "Zombie Knife", type = "Melee", rarity = "common", category = "Melee",
                            model = "WEAPON_ZOMBIEKNIFE", price = 350,
                            icon = "fas fa-knife", image = "assets/img/item/weapon_zombieknife.png",
                            stats = { damage = 32, accuracy = 30, range = 1.2, fireRate = 1.4 },
                            attributes = {
                                { name = "Damage", value = "32" },
                                { name = "Accuracy", value = "30%" },
                                { name = "Range", value = "1.2m" }
                            },
                            info = "Stab first, disinfect never."
                        },
                        {
                            id = 15, name = "Zombie Plank", type = "Melee", rarity = "common", category = "Melee",
                            model = "WEAPON_ZPLANK", price = 250,
                            icon = "fas fa-minus", image = "assets/img/item/weapon_zplank.png",
                            stats = { damage = 25, accuracy = 10, range = 1.5, fireRate = 1.0 },
                            attributes = {
                                { name = "Damage", value = "25" },
                                { name = "Accuracy", value = "10%" },
                                { name = "Range", value = "1.5m" }
                            },
                            info = "Technically a weapon?"
                        },
                        {
                            id = 16, name = "Spiked Bat", type = "Melee", rarity = "rare", category = "Melee",
                            model = "WEAPON_ZSPIKEDBAT", price = 750,
                            icon = "fas fa-baseball-bat", image = "assets/img/item/weapon_zspikedbat.png",
                            stats = { damage = 48, accuracy = 20, range = 1.5, fireRate = 1.0 },
                            attributes = {
                                { name = "Damage", value = "48" },
                                { name = "Accuracy", value = "20%" },
                                { name = "Range", value = "1.5m" }
                            },
                            info = "Every hits a home groan."
                        },
                        {
                            id = 17, name = "Tactical Knife", type = "Melee", rarity = "uncommon", category = "Melee",
                            model = "WEAPON_ZTACKKNIFE", price = 600,
                            icon = "fas fa-knife", image = "assets/img/item/weapon_ztacknife.png",
                            stats = { damage = 38, accuracy = 35, range = 1.3, fireRate = 1.3 },
                            attributes = {
                                { name = "Damage", value = "38" },
                                { name = "Accuracy", value = "35%" },
                                { name = "Range", value = "1.3m" }
                            },
                            info = "Bonus points if you dont scream while using it."
                        },                        
                     }
                 },
            },

    Locations = {
        {
            coords = vector3(-599.30, -33.09, 43.09),
            hash = "MMyers",
            heading = 340.00,
            marker = "~r~ HALLOWEEN SHOP",
            shop = "shop1",
            ui = "Spooky Shop",
            blip = {
                ["active"] = true,
                ["name"] = "Spooky Shop",
                ["colour"] = 1,
                ["id"] = 47
            }
        },
        {
        coords = vector3(-605.19, -31.64, 42.92),
        hash = "Leatherface",
        heading = 340.00,
        marker = "~r~ HALLOWEEN SHOP",
        shop = "shop2",
        ui = "Spooky Shop",
        blip = {
            ["active"] = true,
            ["name"] = "Zombie Shop",
            ["colour"] = 1,
            ["id"] = 47
            }
        },
    },
    Functions = {
        CreateBlips = function()
            for k, v in pairs(Config.Locations) do 
                if v.blip["active"] then 
                    local blip = AddBlipForCoord(v.coords)
                    SetBlipSprite(blip, v.blip["id"])
                    SetBlipScale(blip, 0.5)
                    SetBlipAsShortRange(blip, true)
                    SetBlipColour(blip, v.blip["colour"])
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(v.blip["name"])
                    EndTextCommandSetBlipName(blip)
                end
            end
        end
    }
}










