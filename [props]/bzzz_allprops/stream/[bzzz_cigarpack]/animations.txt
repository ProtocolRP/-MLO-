How to do it?

1) YTYP and YDR files insert to the stream folder or use the downloaded resource
2) Insert this code into fxmanifest:
	data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_effect_cigarpack.ytyp'
3) Edit prop names in animation code or insert a new one (code below)
4) Restart your server - important!!!





-----------------------------------------------------------------------------------------------
Code for dpemotes (command: /e e-smoke, /e e-smoke2 and /e e-smoke3)

   ["e-smoke"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke with effect", AnimationOptions =
   {
       Prop = 'bzzz_cigarpack_cig002',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["e-smoke2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Smoke with effect 2", AnimationOptions =
   {
       Prop = 'bzzz_cigarpack_cig001',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["e-smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke with effect 3", AnimationOptions =
   {
       Prop = 'bzzz_cigarpack_cig003',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},