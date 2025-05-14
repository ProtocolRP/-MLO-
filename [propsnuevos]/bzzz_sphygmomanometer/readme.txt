Hi,
thank you for your purchase.

--------------------------------------------------

My contact: 
Cfx forum:			 https://forum.cfx.re/u/bzzzi/summary
Tebex:				 https://bzzz.tebex.io/
Discord:			 https://discord.gg/PpAHBCMW97
--------------------------------------------------



Installation:
1) Insert folder "bzzz_sphygmomanometer" to resources folder
2) Add to server.cfg
3) Restart server




--------------------------------------------------
If you stream props in another resource, you must edit the fxmanifest.
Add this line:
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_sphygmomanometer.ytyp'

Then the server must be restarted. 
YTYP loads properties of props.
--------------------------------------------------

Animation from images:
	["animation_template"] = {"mp_move@prostitute@m@french", "idle", "Animation", AnimationOptions =
	 {
	   Prop = 'bzzz_prop_sphygmomanometer_belt',
       PropBone = 18905,
       PropPlacement = {-0.2, 0.15, 0.1, 62.0, 0.0, 0.0},
	   SecondProp = 'bzzz_prop_sphygmomanometer_pump',
       SecondPropBone = 57005,
       SecondPropPlacement = {0.1, 0.01, -0.05, -88.0, 0.0, -54.0},
       EmoteLoop = true,
       EmoteMoving = true,
