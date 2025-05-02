-- TEMPLATE


-- bzzz_usableitems (drink section)
["bzzz_custom_drink_can_a"] = {
            basicInfo = {
                amountToAdd = 200000, 
                animationDict = "mp_player_intdrink", animationName = "loop_bottle"},
            firstProp = {
                boneIndex = 18905, 
                propName = "bzzz_custom_drink_can_a", 
                xPos = 0.12, yPos = 0.03, zPos = 0.03, xRot = -60.0, yRot = 100.0, zRot = -20.0
            }
        },    



----------------------------------------------------------------------
-- dp or rpemotes
["bzzz_template"] = {"mp_player_intdrink", "loop_bottle", "Drink A", AnimationOptions =
   {
      Prop = "bzzz_custom_drink_can_a",
      PropBone = 18905,
      PropPlacement = {0.12, 0.03, 0.03, -60.0, 100.0, -20.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }}, 		


   
----------------------------------------------------------------------
-- ox_inventory
['bzzz_custom_drink_can_a'] = {
		label = 'Your custom drink A',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `bzzz_custom_drink_can_a`, pos = vec3(0.01 ,0.00, 0.07), rot = vec3(0.0, 0.0, 0.0) },
			usetime = 2500,
			cancel = true,
			notification = 'Bon appétit'
		}
	},


----------------------------------------------------------------------
-- qb-smallresrouces
['bzzz_custom_drink_can_a'] = {
    progress = {
        label = 'Using Item...',
        time = 5000
    },
    animation = {
        animDict = 'mp_player_intdrink',
        anim = 'loop_bottle',
        flags = 1,
    },
    prop = {
        model = 'bzzz_custom_drink_can_a',
        bone = 60309,
        coords = vector3(0.01 ,0.00, 0.07), -- vector 3 format
        rotation = vector3(0.0, 0.0, 0.0), -- vector 3 format
    },
    replenish = {
        type = 'Thirst', -- replenish type 'Hunger'/'Thirst' / false
        replenish = math.random(20, 40),
        isAlcohol = false, -- if you want it to add alcohol count
        event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
        server = false -- if the event above is a server event
    }
},