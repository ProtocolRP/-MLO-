	 

 --[[ 
 Works the same for all props:
 
bzzz_skewerpack_shashlik_a 
bzzz_skewerpack_chicken-intestine_a
bzzz_skewerpack_fishball_a
bzzz_skewerpack_kikiam_a
bzzz_skewerpack_black-pudding_a
bzzz_skewerpack_quail-eggs_a
bzzz_skewerpack_hotdog_a
bzzz_skewerpack_banana_a
bzzz_skewerpack_pork-bbq_a
bzzz_skewerpack_chicken-feet_a
bzzz_skewerpack_corn_a
bzzz_skewerpack_corndog_a
bzzz_skewerpack_fish_a
bzzz_skewerpack_cheese_a
bzzz_skewerpack_potato_a

 ]]--



   -- Animation for holding:
   ["skewer1"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Holding shashlik", AnimationOptions =
   {
       Prop = 'bzzz_skewerpack_shashlik_a',
       PropBone = 18905,
       PropPlacement = {0.14, 0.12, -0.02, -70.0, 110.0, -20.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   
   
   
   -- Animation for eating:
	["eatshashlik"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat shashlik", AnimationOptions =
   {
       Prop = 'bzzz_skewerpack_shashlik_a',
       PropBone = 18905,
       PropPlacement = {0.17, 0.1, -0.01, -69.0, 103.0, -18.0},
       EmoteMoving = true,
   }},
   
   