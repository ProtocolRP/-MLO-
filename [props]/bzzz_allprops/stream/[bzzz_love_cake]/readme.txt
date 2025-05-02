Hi,
thank you for your purchase.

--------------------------------------------------

My contact: 
Cfx forum:			 https://forum.cfx.re/u/bzzzi/summary
Tebex:				 https://bzzz.tebex.io/
Discord:			 https://discord.gg/PpAHBCMW97
--------------------------------------------------



Installation:
1) Insert folder "bzzz_love_cake" to resources folder
2) Add to server.cfg
3) Restart server




--------------------------------------------------
If you stream props in another resource, you must edit the fxmanifest.
Add this line:
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_cake_love_001.ytyp'

Then the server must be restarted. 
YTYP loads properties of props.
--------------------------------------------------


Code for animation:

   ["love-cake"] = {"anim@heists@box_carry@", "idle", "Love cake", AnimationOptions =
   {
       Prop = "bzzz_prop_cake_love_001",
       PropBone = 18905,
       PropPlacement = {0.28, 0.06, 0.2, -54.0, -72.0, -6.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},