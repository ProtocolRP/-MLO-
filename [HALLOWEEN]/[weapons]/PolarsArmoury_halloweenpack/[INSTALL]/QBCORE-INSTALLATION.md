

-- STEP 1: ADD IMAGES
	


-- STEP 2: ADD FIRST CODE LIST TO    ■   [qb-core/shared/items.lua]                                    ■  under the | QBShared.Items = 

weapon_boneclub = { 
    name = 'weapon_boneclub', 
    label = 'Bone Club', 
    weight = 500, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_boneclub.png', 
    unique = false, 
    useable = true, 
    description = 'A primitive weapon crafted from bones, effective for close combat.' 
},

weapon_bucket = { 
    name = 'weapon_bucket', 
    label = 'Bucket', 
    weight = 300, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_bucket.png', 
    unique = false, 
    useable = true, 
    description = 'An ordinary bucket, can be surprisingly useful in a fight.' 
},

weapon_coffin = { 
    name = 'weapon_coffin', 
    label = 'Coffin', 
    weight = 1500, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_coffin.png', 
    unique = false, 
    useable = true, 
    description = 'A small coffin that can be wielded in combat, with an eerie presence.' 
},

weapon_deathnote = { 
    name = 'weapon_deathnote', 
    label = 'Death Note', 
    weight = 50, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_deathnote.png', 
    unique = true, 
    useable = true, 
    description = 'A mysterious notebook with deadly powers, use with caution.' 
},

weapon_hellfiresword = { 
    name = 'weapon_hellfiresword', 
    label = 'Hellfire Sword', 
    weight = 700, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_hellfiresword.png', 
    unique = false, 
    useable = true, 
    description = 'A sword engulfed in flames from the underworld, unleashes fiery strikes.' 
},

weapon_inferno = { 
    name = 'weapon_inferno', 
    label = 'Inferno', 
    weight = 1000, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_inferno.png', 
    unique = false, 
    useable = true, 
    description = 'A weapon forged from intense heat, leaving a blazing trail with each strike.' 
},

weapon_pumpkin = { 
    name = 'weapon_pumpkin', 
    label = 'Pumpkin', 
    weight = 200, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_pumpkin.png', 
    unique = false, 
    useable = true, 
    description = 'A seasonal item that packs a punch when wielded as a weapon.' 
},

weapon_pumpkinbat = { 
    name = 'weapon_pumpkinbat', 
    label = 'Pumpkin Bat', 
    weight = 600, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_pumpkinbat.png', 
    unique = false, 
    useable = true, 
    description = 'A bat decorated with pumpkins, a fitting weapon for Halloween combat.' 
},

weapon_arm = { 
    name = 'weapon_arm', 
    label = 'Skeleton Arm', 
    weight = 400, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_skeletonarm.png', 
    unique = false, 
    useable = true, 
    description = 'An arm from a skeleton, strangely sturdy and effective in battle.' 
},

weapon_leg = { 
    name = 'weapon_leg', 
    label = 'Skeleton Leg', 
    weight = 500, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_skeletonleg.png', 
    unique = false, 
    useable = true, 
    description = 'A leg bone from a skeleton, heavy and surprisingly deadly.' 
},

weapon_stake = { 
    name = 'weapon_stake', 
    label = 'Stake', 
    weight = 150, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_stake.png', 
    unique = false, 
    useable = true, 
    description = 'A sharp wooden stake, useful for close encounters with creatures of the night.' 
},

weapon_triplebladedscythe = { 
    name = 'weapon_triplebladedscythe', 
    label = 'Triple Bladed Scythe', 
    weight = 800, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_triplebladedscythe.png', 
    unique = false, 
    useable = true, 
    description = 'A scythe with three blades, designed for maximum carnage.' 
},

weapon_voodoo = { 
    name = 'weapon_voodoo', 
    label = 'Voodoo Doll', 
    weight = 100, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_voodoodoll.png', 
    unique = false, 
    useable = true, 
    description = 'A cursed doll with mysterious powers, harmful to enemies in strange ways.' 
},

weapon_witchbroom = { 
    name = 'weapon_witchbroom', 
    label = 'Witch Broom', 
    weight = 300, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_witchbroom.png', 
    unique = false, 
    useable = true, 
    description = 'A broom used by witches, enchanted for swift attacks.' 
},

weapon_soulscythe = { 
    name = 'weapon_soulscythe', 
    label = 'Soul Scythe', 
    weight = 900, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_soulscythe.png', 
    unique = false, 
    useable = true, 
    description = 'A scythe that harvests the souls of those it strikes, an eerie weapon.' 
},

weapon_gravestone = { 
    name = 'weapon_gravestone', 
    label = 'Gravestone', 
    weight = 1200, 
    type = 'weapon', 
    ammotype = nil, 
    image = 'weapon_gravestone.png', 
    unique = false, 
    useable = true, 
    description = 'A heavy gravestone, used to crush enemies with overwhelming force.' 
},

-- STEP 3: ADD SECOND CODE LIST TO   ■   [qb-core/shared/weapons.lua]                                  ■  under the | QBShared.Weapons =

['weapon_boneclub'] = { 
    name = 'weapon_boneclub', 
    label = 'Bone Club', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_bucket'] = { 
    name = 'weapon_bucket', 
    label = 'Bucket', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_coffin'] = { 
    name = 'weapon_coffin', 
    label = 'Coffin', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_deathnote'] = { 
    name = 'weapon_deathnote', 
    label = 'Death Note', 
    weapontype = 'Mystic', 
    ammotype = nil, 
    damagereason = 'Mysterious/ Fatal' 
},

['weapon_hellfiresword'] = { 
    name = 'weapon_hellfiresword', 
    label = 'Hellfire Sword', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Burned/ Slashed' 
},

['weapon_inferno'] = { 
    name = 'weapon_inferno', 
    label = 'Inferno', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Burned/ Struck' 
},

['weapon_pumpkin'] = { 
    name = 'weapon_pumpkin', 
    label = 'Pumpkin', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_pumpkinbat'] = { 
    name = 'weapon_pumpkinbat', 
    label = 'Pumpkin Bat', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_arm'] = { 
    name = 'weapon_arm', 
    label = 'Skeleton Arm', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_leg'] = { 
    name = 'weapon_leg', 
    label = 'Skeleton Leg', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_stake'] = { 
    name = 'weapon_stake', 
    label = 'Stake', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Pierced/ Impaled' 
},

['weapon_triplebladedscythe'] = { 
    name = 'weapon_triplebladedscythe', 
    label = 'Triple Bladed Scythe', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Slashed' 
},

['weapon_voodoo'] = { 
    name = 'weapon_voodoo', 
    label = 'Voodoo Doll', 
    weapontype = 'Mystic', 
    ammotype = nil, 
    damagereason = 'Cursed/ Hexed' 
},

['weapon_witchbroom'] = { 
    name = 'weapon_witchbroom', 
    label = 'Witch Broom', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Bludgeoned/ Struck' 
},

['weapon_soulscythe'] = { 
    name = 'weapon_soulscythe', 
    label = 'Soul Scythe', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Slashed/ Drained' 
},

['weapon_gravestone'] = { 
    name = 'weapon_gravestone', 
    label = 'Gravestone', 
    weapontype = 'Melee', 
    ammotype = nil, 
    damagereason = 'Crushed/ Bludgeoned' 
},



-- STEP 4: ADD THIRD CODE LIST TO    ■   [qb-smallresources/client/weapdraw.lua]                       ■  under the | local weapons = {

'WEAPON_BONECLUB',
'WEAPON_BUCKET',
'WEAPON_COFFIN',
'WEAPON_DEATHNOTE',
'WEAPON_HELLFIRESWORD',
'WEAPON_INFERNO',
'WEAPON_PUMPKIN',
'WEAPON_PUMPKINBAT',
'WEAPON_ARM',
'WEAPON_LEG',
'WEAPON_STAKE',
'WEAPON_TRIPLEBLADEDSCYTHE',
'WEAPON_VOODOO',
'WEAPON_WITCHBROOM',
'WEAPON_SOULSCYTHE',
'WEAPON_GRAVESTONE',




-- STEP 5: ADD FOURTH CODE LIST TO   ■   [qb-weapons/config.lua]                                ■  under the | Config.DurabilityMultiplier = 

weapon_boneclub      = 0.15,
weapon_bucket        = 0.15,
weapon_coffin        = 0.15,
weapon_deathnote     = 0.15,
weapon_hellfiresword = 0.15,
weapon_inferno       = 0.15,
weapon_pumpkin       = 0.15,
weapon_pumpkinbat    = 0.15,
weapon_arm           = 0.15,
weapon_leg           = 0.15,
weapon_stake         = 0.15,
weapon_triplebladedscythe = 0.15,
weapon_voodoo        = 0.15,
weapon_witchbroom    = 0.15,
weapon_soulscythe    = 0.15,
weapon_gravestone    = 0.15,



