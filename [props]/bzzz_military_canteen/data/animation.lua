-- Use the template based on the script you're using

-- dpemotes / rpemotes  
  ["bzzz_canteen"] = {"mp_player_intdrink", "loop_bottle", "Military canteen", AnimationOptions =
   {   
		Prop = 'bzzz_prop_military_canteen_b',
		PropBone = 18905,
		PropPlacement = {0.12, 0.0, 0.05, -124.0, -60.0, 4.0},
		EmoteLoop = true,
		EmoteMoving = true,
   }},
     
	 
----------------------------------------------------------------------------
-- bzzz_usableitems / drinks
["bzzz_canteen"] = {
            basicInfo = {
                amountToAdd = 200000, 
                animationDict = "mp_player_intdrink", animationName = "loop_bottle"},
            firstProp = {
                boneIndex = 18905, 
                propName = "bzzz_prop_military_canteen_b", 
                xPos = 0.12, yPos = 0.0, zPos = 0.05, xRot = -124.0, yRot = -60.0, zRot = 4.0
            }
        }, 
		
		
----------------------------------------------------------------------------
-- ox_inventory
	['bzzz_canteen'] = {
		label = 'Military canteen',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `bzzz_prop_military_canteen_b`, pos = vec3(0.01, 0.02, 0.05), rot = vec3(-10.0, 10.0, 80.0) },
			usetime = 5000,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},
	
	
----------------------------------------------------------------------------	
-- qb-core/shared/items.lua
bzzz_canteen = { 
    name = 'bzzz_canteen', 
    label = 'Military canteen', 
    weight = 500, 
    type = 'item', 
    image = 'bzzz_prop_military_canteen_b.png', 
    unique = false, 
    useable = true, 
    shouldClose = true, 
    combinable = nil, 
    description = 'Water' 
},


----------------------------------------------------------------------------
-- qb-smallresources
['bzzz_canteen'] = {
    progress = {
        label = 'Using Item...',
        time = 5000
    },
    animation = {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 49,
    },
    prop = {
        model = 'bzzz_prop_military_canteen_b',
        bone = 60309,
        coords = vector3(0.01, 0.02, 0.05),
        rotation = vector3(-10.0, 10.0, 80.0),
    },
    replenish = {
        type = 'Thirst',
        replenish = math.random(20, 40),
        isAlcohol = false,
        event = false,
        server = false
    }
},	