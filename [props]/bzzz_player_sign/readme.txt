Hi,
thank you for your purchase.

--------------------------------------------------

My contact: 
Cfx forum:			 https://forum.cfx.re/u/bzzzi/summary
Tebex:				 https://bzzz.tebex.io/
Discord:			 https://discord.gg/PpAHBCMW97
Wiki:				 https://bzzz.wiki/
--------------------------------------------------



Installation:
1) Insert folder "bzzz_player_sign" to resources folder
2) Add to server.cfg
3) Restart server


--------------------------------------------------
If you STREAM props in another resource, you must edit the fxmanifest.
Add this line:
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_player_signs.ytyp'

Then the server must be restarted. 
YTYP loads properties of props.
--------------------------------------------------

If your server crashes with the reason 'CMoveAnimatedBuilding pool size 161' 
you have likely exceeded the limit of animated props within a specific radius. 
This setting can be found in 'Fivem Application Data/citizen/common/data/gameconfig.xml'. 
These limits are likely set by FiveM, as even if you increase the value, FiveM will overwrite it back.