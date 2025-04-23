Hi,
thank you for your purchase.


--------------------------------------------------
My contact: 
Cfx forum:			 https://forum.cfx.re/u/bzzzi/summary
Tebex:				 https://bzzz.tebex.io/
Discord:			 https://discord.gg/PpAHBCMW97
--------------------------------------------------



Installation:
1) Insert folder "bzzz_food_dessert" to resources folder
2) Add to server.cfg
3) Restart server



If you stream props in another resource, you must edit the fxmanifest.
Add this line:
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_food_dessert_a.ytyp'




Then the server must be restarted. 
YTYP loads properties of props.



Coords for eat animation:

["desert"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat dessert", AnimationOptions =
   {
       Prop = 'bzzz_food_dessert_a',
       PropBone = 18905,
       PropPlacement = {0.15, 0.03, 0.03, -42.0, -36.0, 0.0},
       EmoteMoving = true,
   }},