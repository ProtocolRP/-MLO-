Hi,
thank you for your purchase.

--------------------------------------------------

My contact: 
Cfx forum:			 https://forum.cfx.re/u/bzzzi/summary
Tebex:				 https://bzzz.tebex.io/
Discord:			 https://discord.gg/PpAHBCMW97
--------------------------------------------------



Installation:
1) Insert folder "bzzz_baby_cake" to resources folder
2) Add to server.cfg
3) Restart server




--------------------------------------------------
If you stream props in another resource, you must edit the fxmanifest.
Add this line:
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_cake_baby_001.ytyp'

Then the server must be restarted. 
YTYP loads properties of props.
--------------------------------------------------


Code for animation:

["baby-cake"] = {"anim@heists@box_carry@", "idle", "Baby cake", AnimationOptions =
   {
       Prop = "bzzz_prop_cake_baby_001",
       PropBone = 18905,
       PropPlacement = {0.33, 0.09, 0.2, -94.0, -162.0, -44.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},