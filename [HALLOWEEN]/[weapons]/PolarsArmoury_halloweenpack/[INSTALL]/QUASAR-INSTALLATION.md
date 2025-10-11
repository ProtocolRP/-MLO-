

-- STEP 1: Put the PolarsArmoury_Halloweenweaponpack folder into your resources folder and then ensure it in your server.cfg
-- STEP 2: ADD IMAGES TO INVENTORY     [qs-inventory\html\images]
-- STEP 3: ADD FIRST CODE LIST TO      [qs-inventory\shared\items.lua   AND  qb-core\shared\items.lua]  
-- STEP 4: ADD SECOND CODE LIST TO     [qs-inventory\shared\weapons.lua] 
-- STEP 5: ADD THIRD CODE LIST TO      [qs-inventory\config\weapons.lua] under the Config.DurabilityMultiplier = { 
-- STEP 6: ADD This CODE LIST TO       [qb-core\shared\weapons.lua]


## COPY PASTE THIS FIRST
## qs-inventory\shared\items.lua  AND  qb-core\shared\items.lua

['weapon_boneclub'] =  {
    ['name'] =  'weapon_boneclub',
    ['label'] =  'bone club',
    ['weight'] =  500,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_boneclub.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a primitive weapon crafted from bones, effective for close combat.'
},

['weapon_bucket'] =  {
    ['name'] =  'weapon_bucket',
    ['label'] =  'bucket',
    ['weight'] =  300,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_bucket.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'an ordinary bucket, surprisingly useful in a fight.'
},

['weapon_coffin'] =  {
    ['name'] =  'weapon_coffin',
    ['label'] =  'coffin',
    ['weight'] =  1500,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_coffin.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a small coffin that can be wielded in combat, with an eerie presence.'
},

['weapon_deathnote'] =  {
    ['name'] =  'weapon_deathnote',
    ['label'] =  'death note',
    ['weight'] =  50,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_deathnote.png',
    ['unique'] =  true,
    ['useable'] =  true,
    ['description'] =  'a mysterious notebook with deadly powers, use with caution.'
},

['weapon_hellfiresword'] =  {
    ['name'] =  'weapon_hellfiresword',
    ['label'] =  'hellfire sword',
    ['weight'] =  700,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_hellfiresword.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a sword engulfed in flames from the underworld, unleashes fiery strikes.'
},

['weapon_inferno'] =  {
    ['name'] =  'weapon_inferno',
    ['label'] =  'inferno',
    ['weight'] =  1000,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_inferno.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a weapon forged from intense heat, leaving a blazing trail with each strike.'
},

['weapon_pumpkin'] =  {
    ['name'] =  'weapon_pumpkin',
    ['label'] =  'pumpkin',
    ['weight'] =  200,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_pumpkin.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a seasonal item that packs a punch when wielded as a weapon.'
},

['weapon_pumpkinbat'] =  {
    ['name'] =  'weapon_pumpkinbat',
    ['label'] =  'pumpkin bat',
    ['weight'] =  600,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_pumpkinbat.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a bat decorated with pumpkins, a fitting weapon for halloween combat.'
},

['weapon_arm'] =  {
    ['name'] =  'weapon_arm',
    ['label'] =  'skeleton arm',
    ['weight'] =  400,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_skeletonarm.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'an arm from a skeleton, strangely sturdy and effective in battle.'
},

['weapon_leg'] =  {
    ['name'] =  'weapon_leg',
    ['label'] =  'skeleton leg',
    ['weight'] =  500,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_skeletonleg.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a leg bone from a skeleton, heavy and surprisingly deadly.'
},

['weapon_stake'] =  {
    ['name'] =  'weapon_stake',
    ['label'] =  'stake',
    ['weight'] =  150,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_stake.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a sharp wooden stake, useful for close encounters with creatures of the night.'
},

['weapon_triplebladedscythe'] =  {
    ['name'] =  'weapon_triplebladedscythe',
    ['label'] =  'triple bladed scythe',
    ['weight'] =  800,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_triplebladedscythe.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a scythe with three blades, designed for maximum carnage.'
},

['weapon_voodoo'] =  {
    ['name'] =  'weapon_voodoo',
    ['label'] =  'voodoo doll',
    ['weight'] =  100,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_voodoodoll.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a cursed doll with mysterious powers, harmful to enemies in strange ways.'
},

['weapon_witchbroom'] =  {
    ['name'] =  'weapon_witchbroom',
    ['label'] =  'witch broom',
    ['weight'] =  300,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_witchbroom.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a broom used by witches, enchanted for swift attacks.'
},

['weapon_soulscythe'] =  {
    ['name'] =  'weapon_soulscythe',
    ['label'] =  'soul scythe',
    ['weight'] =  900,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_soulscythe.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a scythe that harvests the souls of those it strikes, an eerie weapon.'
},

['weapon_gravestone'] =  {
    ['name'] =  'weapon_gravestone',
    ['label'] =  'gravestone',
    ['weight'] =  1200,
    ['type'] =  'weapon',
    ['ammotype'] = nil,
    ['image'] =  'weapon_gravestone.png',
    ['unique'] =  false,
    ['useable'] =  true,
    ['description'] =  'a heavy gravestone, used to crush enemies with overwhelming force.'
},



## qs-inventory\shared\weapons.lua

['weapon_boneclub'] = {
    name = 'weapon_boneclub',
    label = 'bone club',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_bucket'] = {
    name = 'weapon_bucket',
    label = 'bucket',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_coffin'] = {
    name = 'weapon_coffin',
    label = 'coffin',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_deathnote'] = {
    name = 'weapon_deathnote',
    label = 'death note',
    weapontype = 'mystic',
    ammotype = nil,
    damagereason = 'mysterious'
},

['weapon_hellfiresword'] = {
    name = 'weapon_hellfiresword',
    label = 'hellfire sword',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'burned'
},

['weapon_inferno'] = {
    name = 'weapon_inferno',
    label = 'inferno',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'burned'
},

['weapon_pumpkin'] = {
    name = 'weapon_pumpkin',
    label = 'pumpkin',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_pumpkinbat'] = {
    name = 'weapon_pumpkinbat',
    label = 'pumpkin bat',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_arm'] = {
    name = 'weapon_arm',
    label = 'skeleton arm',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_leg'] = {
    name = 'weapon_leg',
    label = 'skeleton leg',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_stake'] = {
    name = 'weapon_stake',
    label = 'stake',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'pierced'
},

['weapon_triplebladedscythe'] = {
    name = 'weapon_triplebladedscythe',
    label = 'triple bladed scythe',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'slashed'
},

['weapon_voodoo'] = {
    name = 'weapon_voodoo',
    label = 'voodoo doll',
    weapontype = 'mystic',
    ammotype = nil,
    damagereason = 'cursed'
},

['weapon_witchbroom'] = {
    name = 'weapon_witchbroom',
    label = 'witch broom',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'bludgeoned'
},

['weapon_soulscythe'] = {
    name = 'weapon_soulscythe',
    label = 'soul scythe',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'drained'
},

['weapon_gravestone'] = {
    name = 'weapon_gravestone',
    label = 'gravestone',
    weapontype = 'melee',
    ammotype = nil,
    damagereason = 'crushed'
},



## qs-inventory\config\weapons.lua

# Drop this under the Config.DurabilityMultiplier 

weapon_boneclub = 0.10,
weapon_bucket = 0.10,
weapon_coffin = 0.10,
weapon_deathnote = 0.10,
weapon_hellfiresword = 0.10,
weapon_inferno = 0.10,
weapon_pumpkin = 0.10,
weapon_pumpkinbat = 0.10,
weapon_arm = 0.10,
weapon_leg = 0.10,
weapon_stake = 0.10,
weapon_triplebladedscythe = 0.10,
weapon_voodoo = 0.10,
weapon_witchbroom = 0.10,
weapon_soulscythe = 0.10,
weapon_gravestone = 0.10,


## ADD THIS CODE TO 
## Qb-core\shared\weapons.lua

['weapon_boneclub'] = { name = 'weapon_boneclub', label = 'bone club', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_bucket'] = { name = 'weapon_bucket', label = 'bucket', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_coffin'] = { name = 'weapon_coffin', label = 'coffin', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_deathnote'] = { name = 'weapon_deathnote', label = 'death note', weapontype = 'mystic', ammotype = nil, damagereason = 'mysterious' },
['weapon_hellfiresword'] = { name = 'weapon_hellfiresword', label = 'hellfire sword', weapontype = 'melee', ammotype = nil, damagereason = 'burned' },
['weapon_inferno'] = { name = 'weapon_inferno', label = 'inferno', weapontype = 'melee', ammotype = nil, damagereason = 'burned' },
['weapon_pumpkin'] = { name = 'weapon_pumpkin', label = 'pumpkin', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_pumpkinbat'] = { name = 'weapon_pumpkinbat', label = 'pumpkin bat', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_arm'] = { name = 'weapon_arm', label = 'skeleton arm', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_leg'] = { name = 'weapon_leg', label = 'skeleton leg', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_stake'] = { name = 'weapon_stake', label = 'stake', weapontype = 'melee', ammotype = nil, damagereason = 'pierced' },
['weapon_triplebladedscythe'] = { name = 'weapon_triplebladedscythe', label = 'triple bladed scythe', weapontype = 'melee', ammotype = nil, damagereason = 'slashed' },
['weapon_voodoo'] = { name = 'weapon_voodoo', label = 'voodoo doll', weapontype = 'mystic', ammotype = nil, damagereason = 'cursed' },
['weapon_witchbroom'] = { name = 'weapon_witchbroom', label = 'witch broom', weapontype = 'melee', ammotype = nil, damagereason = 'melee killed / whacked / executed / beat down / murdered / battered' },
['weapon_soulscythe'] = { name = 'weapon_soulscythe', label = 'soul scythe', weapontype = 'melee', ammotype = nil, damagereason = 'drained' },
['weapon_gravestone'] = { name = 'weapon_gravestone', label = 'gravestone', weapontype = 'melee', ammotype = nil, damagereason = 'crushed' },