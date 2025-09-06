fx_version 'adamant'
games { 'gta5' }


description 'Addon Props - Powehouse'
made_by 'BzZz'



data_file 'DLC_ITYP_REQUEST' 'stream/prop_bzzz_elektro_powerhouse001.ytyp'







--[[
CODE FOR ANIMATION DPEMOTES:
--------------------------------------------------


["power"] = {"move_weapon@jerrycan@generic", "idle", "Power House", AnimationOptions =
   {
      Prop = "prop_bzzz_elektro_powerhouse001",
      PropBone = 57005,
      PropPlacement = {0.11, 0.06, 0.0, 98.0, 12.0, -99.0},
      EmoteLoop = true,
      EmoteMoving = true,
   }},
   
--------------------------------------------------

If you put the props in another folder, you must edit the fxmanifest:
data_file 'DLC_ITYP_REQUEST' 'stream/prop_bzzz_elektro_powerhouse001.ytyp'

]]--