Config = {}

Config.Framework = "qbcore"  -- types (standalone, qbcore, esx)

Config.ESXFramework = {
	newversion = true, -- use this if you using new esx version (if you get error with old esxsharedobjectmethod in console)
	getsharedobject = "esx:getSharedObject",
	resourcename = "es_extended"
}

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.InterfaceColor = "#ff4500" -- change interface color, color must be in hex

Config.Language = "English" -- text language from code (English)

Config.Target = true -- enable this if you want use target (dont enable it, it will work after next update)
 
Config.Targettype = "oxtarget" -- types - qtarget, qbtarget, oxtarget

Config.TargetSystemsNames = {qtarget = "qtarget", qbtarget = "qb-target", oxtarget = "ox_target"}

Config.TargetIcons = {trickortreaticon = "fa-solid fa-wand-sparkles", pumpkinicon = "fa-solid fa-leaf"} 

Config.HalloweenInteractionSystem = 1 -- 1 == Our custom interact system, 2 == 3D Text Interact, 3 == Gta V Online Interaction Style

Config.TrickOrTreatsKey = "E" -- trick or treats key

Config.TrickOrTreatDistance = 2.5 -- max trick and treat distance

Config.TrickOrTreatOnlyOneUse = false -- Turn this on if you only want one player to be able to trick-or-treat at one location.

Config.PickUpPumpkinKey = "E" -- pumpkin pickup key

Config.PickUpPumpkinDistance = 2.5 -- pumpkin pickup distance

Config.MaxDistanceHalloweenObjectPlacer = 40.0 -- Maximum distance a player can place an object or fly away with the camera

Config.PickingandCarvingPumpkin = true -- Turn this on if you want to allow players to pick and carve pumpkins.

Config.PumpkinCarvingTimeDuration = 10 -- in seconds

Config.PumpkinPickupTimeDuration = 5 -- in seconds

Config.SaveDecorationsInDatabase = true -- Turn this on if you want to save decorations to the database so they will appear even after restarting the game.

Config.ScarePlayerCommand = "scareplayer" -- command for scare players /scareplayer id

Config.TrickOrTreatsCommand = "trickortreat" -- trick or treats command (This command is enabled by default for the standalone version if the server does not use items.)

Config.PumpkinCarvingCommand = "pumpkin" -- pumpkin carving command (This command is enabled by default for the standalone version if the server does not use items.)

Config.DecorativeCommand = "decorate" -- decorate command example /decorative 1 (1-35) (This command is enabled by default for the standalone version if the server does not use items.)

Config.DecorationRemoveCommand = "removedecoration" -- command for remove nearby decoration for player (works only for player which spawned the decoration)

Config.EnableTrickOrTreatTimeCheck = true -- if you enable this function it will allow players to engage in Halloween-themed activities only during specific times.

Config.TrickOrTreatTimes = {time1 = 16, time2 = 23} -- able defines the time range during which players are allowed to participate in trick-or-treating activities. For example, setting time1 = 18 and time2 = 23 allows trick-or-treating from 18:00 to 23:00 in-game time.

Config.RandomJumpScares = true -- Turn this feature on if you want to get random jumpscares

Config.RandomJumpScaresSettings = {
	jumpscarechance = 50, -- in percentage 1-1000
	jumpscarechancecheck = 300, -- in seconds (for example it will trigger jumpscare chance every 10 seconds)
}

Config.TrickOrTreatReward = {
	{
		rewardobject = "rtx_flet", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "flet", -- reward data example money amount or itemname
		prizelabel = "Flet", -- reward label
	},
	{
		rewardobject = "rtx_lars", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "lars", -- reward data example money amount or itemname
		prizelabel = "Lars", -- reward label
	},
	{
		rewardobject = "rtx_papi", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "papi", -- reward data example money amount or itemname
		prizelabel = "Papi", -- reward label
	},
	{
		rewardobject = "rtx_pikao", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "picolo", -- reward data example money amount or itemname
		prizelabel = "Picolo", -- reward label
	},
	{
		rewardobject = "rtx_skittles", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "skiiles", -- reward data example money amount or itemname
		prizelabel = "Skiiles", -- reward label
	},
	{
		rewardobject = "rtx_sneck", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "sneck", -- reward data example money amount or itemname
		prizelabel = "Sneck", -- reward label
	},
	{
		rewardobject = "rtx_papi", -- object name for reward (which will be in basket)
		rewardtype = "item",  -- reward type (you need add your types yourself in server/other.lua
		rewarddata = "pumpkin_coin", -- reward data example money amount or itemname
		prizelabel = "Pumpkin Coin", -- reward label
	},
}

Config.TrickOrTreatBlipSettings = {
	blipiconid = 40, -- icon type
	blipdisplay = 4, -- icon display
	blipcolor = 47, -- icon color
	blipshortrange = false, -- icon range
	blipscale = 0.5, -- icon scale
	bliptext = "Trick And Treat", -- text of blip
}

Config.TrickOrTreatLocations = {	
	{handler = nil, taken = false, coords = vector3(236.09886169434, -2046.3240966797, 17.379981994629), heading = 319.96084594727},
	{handler = nil, taken = false, coords = vector3(251.13856506348, -2030.3387451172, 17.706066131592), heading = 319.00518798828},
	{handler = nil, taken = false, coords = vector3(256.36813354492, -2023.4793701172, 18.2663230896), heading = 235.88667297363},
	{handler = nil, taken = false, coords = vector3(279.72259521484, -1993.8259277344, 19.803789138794), heading = 317.19650268555},
	{handler = nil, taken = false, coords = vector3(291.35372924805, -1980.3796386719, 20.600522994995), heading = 144.98432922363},
	{handler = nil, taken = false, coords = vector3(295.73715209961, -1971.7856445313, 21.900835037231), heading = 231.77114868164},
	{handler = nil, taken = false, coords = vector3(312.10211181641, -1956.3577880859, 23.616748809814), heading = 235.31965637207},
	{handler = nil, taken = false, coords = vector3(324.0657043457, -1937.6015625, 24.018964767456), heading = 148.1939239502},
	{handler = nil, taken = false, coords = vector3(385.35678100586, -1881.7935791016, 25.031444549561), heading = 229.76193237305},
	{handler = nil, taken = false, coords = vector3(399.48284912109, -1865.0555419922, 25.716335296631), heading = 223.58708190918},
	{handler = nil, taken = false, coords = vector3(412.78140258789, -1856.0382080078, 26.323118209839), heading = 312.37533569336},
	{handler = nil, taken = false, coords = vector3(427.31021118164, -1841.9475097656, 27.463479995728), heading = 317.99063110352},
	{handler = nil, taken = false, coords = vector3(338.68850708008, -1829.4494628906, 27.337484359741), heading = 313.95745849609},
	{handler = nil, taken = false, coords = vector3(328.92837524414, -1845.4892578125, 26.748058319092), heading = 42.917671203613},
	{handler = nil, taken = false, coords = vector3(304.5788269043, -1775.5108642578, 28.101188659668), heading = 226.59008789063},
	{handler = nil, taken = false, coords = vector3(320.89654541016, -1759.8981933594, 28.637895584106), heading = 236.64984130859},
	{handler = nil, taken = false, coords = vector3(430.95068359375, -1725.5284423828, 28.601425170898), heading = 54.528377532959},
	{handler = nil, taken = false, coords = vector3(443.41659545898, -1707.3365478516, 28.709247589111), heading = 50.195442199707},
	{handler = nil, taken = false, coords = vector3(171.00917053223, -1871.3461914063, 23.400218963623), heading = 66.849281311035},
	{handler = nil, taken = false, coords = vector3(148.85873413086, -1904.2252197266, 22.531658172607), heading = 332.36547851563},
	{handler = nil, taken = false, coords = vector3(126.62591552734, -1929.6864013672, 20.382427215576), heading = 24.440534591675},
	{handler = nil, taken = false, coords = vector3(114.21371459961, -1961.0134277344, 20.334167480469), heading = 23.601512908936},
	{handler = nil, taken = false, coords = vector3(29.629119873047, -1854.3566894531, 23.068849563599), heading = 47.100116729736},
	{handler = nil, taken = false, coords = vector3(21.023817062378, -1844.4774169922, 23.601728439331), heading = 55.659786224365},
	{handler = nil, taken = false, coords = vector3(-20.711084365845, -1858.8278808594, 24.408660888672), heading = 52.942867279053},
	{handler = nil, taken = false, coords = vector3(-212.21728515625, -1660.5814208984, 36.636882781982), heading = 89.569374084473},
	{handler = nil, taken = false, coords = vector3(-216.70167541504, -1648.9050292969, 33.463241577148), heading = 179.4608001709},
	{handler = nil, taken = false, coords = vector3(-224.84599304199, -1666.3516845703, 33.463245391846), heading = 263.09893798828},
	{handler = nil, taken = false, coords = vector3(-224.34309387207, -1674.2575683594, 36.636646270752), heading = 352.74609375},
	{handler = nil, taken = false, coords = vector3(-234.14804077148, -1662.4614257813, 32.931411743164), heading = 86.934097290039},
	{handler = nil, taken = false, coords = vector3(-212.35400390625, -1617.45703125, 33.869331359863), heading = 78.300895690918},
	{handler = nil, taken = false, coords = vector3(-219.15603637695, -1579.9641113281, 33.869251251221), heading = 233.19522094727},
	{handler = nil, taken = false, coords = vector3(-200.1527557373, -1605.1916503906, 33.713508605957), heading = 258.64508056641},
	{handler = nil, taken = false, coords = vector3(-139.88945007324, -1587.6192626953, 33.243717193604), heading = 226.32627868652},
	{handler = nil, taken = false, coords = vector3(-134.1541595459, -1565.4947509766, 33.2626953125), heading = 51.416133880615},
	{handler = nil, taken = false, coords = vector3(-83.384239196777, -1524.2730712891, 33.240047454834), heading = 134.46815490723},
	{handler = nil, taken = false, coords = vector3(-159.88619995117, -1543.7297363281, 34.078216552734), heading = 231.38397216797},
	{handler = nil, taken = false, coords = vector3(-64.272613525391, -1449.5112304688, 31.52486038208), heading = 279.8076171875},
	{handler = nil, taken = false, coords = vector3(-45.836532592773, -1445.5904541016, 31.429595947266), heading = 97.422172546387},
	{handler = nil, taken = false, coords = vector3(-32.550563812256, -1446.3220214844, 30.891395568848), heading = 88.468444824219},
	{handler = nil, taken = false, coords = vector3(-14.243461608887, -1442.0112304688, 30.101150512695), heading = 180.76181030273},
	{handler = nil, taken = false, coords = vector3(-1.9369132518768, -1442.3607177734, 29.963092803955), heading = 178.27647399902},
	{handler = nil, taken = false, coords = vector3(16.574726104736, -1443.9068603516, 29.949235916138), heading = 153.505859375},
	{handler = nil, taken = false, coords = vector3(-991.42651367188, -1103.8061523438, 1.1503081321716), heading = 225.28755187988},
	{handler = nil, taken = false, coords = vector3(-1024.52734375, -1139.7258300781, 1.7453291416168), heading = 27.239124298096},
	{handler = nil, taken = false, coords = vector3(-1040.142578125, -1136.4367675781, 1.1586012840271), heading = 207.16040039063},
	{handler = nil, taken = false, coords = vector3(-1064.2552490234, -1159.2602539063, 1.1585984230042), heading = 32.135746002197},
	{handler = nil, taken = false, coords = vector3(-1068.1304931641, -1163.3502197266, 1.7453396320343), heading = 28.598129272461},
	{handler = nil, taken = false, coords = vector3(-1113.9500732422, -1193.6253662109, 1.3656284809113), heading = 28.062725067139},
	{handler = nil, taken = false, coords = vector3(-1125.8405761719, -1171.9697265625, 1.356189250946), heading = 120.63018035889},
	{handler = nil, taken = false, coords = vector3(-1135.84375, -1153.4885253906, 1.7439503669739), heading = 117.72776794434},
	{handler = nil, taken = false, coords = vector3(-1114.9829101563, -1068.0612792969, 1.1503558158875), heading = 31.675899505615},
	{handler = nil, taken = false, coords = vector3(-1065.5108642578, -1055.5490722656, 5.4116640090942), heading = 305.76544189453},
	{handler = nil, taken = false, coords = vector3(-1064.4792480469, -1057.3631591797, 5.4116640090942), heading = 308.35079956055},
	{handler = nil, taken = false, coords = vector3(-1086.0368652344, -1008.4369506836, 1.1502373218536), heading = 300.19583129883},
	{handler = nil, taken = false, coords = vector3(-1090.1392822266, -953.58386230469, 1.4295446872711), heading = 127.91115570068},
	{handler = nil, taken = false, coords = vector3(-1090.6448974609, -926.36163330078, 2.1274075508118), heading = 31.730110168457},
	{handler = nil, taken = false, coords = vector3(-1022.6965942383, -896.52044677734, 4.418713092804), heading = 31.077314376831},
	{handler = nil, taken = false, coords = vector3(1265.7349853516, -703.26385498047, 63.562141418457), heading = 234.40705871582},
	{handler = nil, taken = false, coords = vector3(1270.9365234375, -683.49737548828, 65.031600952148), heading = 5.5981330871582},
	{handler = nil, taken = false, coords = vector3(1251.2813720703, -621.51770019531, 68.413208007813), heading = 208.5708770752},
	{handler = nil, taken = false, coords = vector3(1240.6048583984, -601.64074707031, 68.782783508301), heading = 273.86932373047},
	{handler = nil, taken = false, coords = vector3(1236.8121337891, -588.64007568359, 68.427154541016), heading = 356.72763061523},
	{handler = nil, taken = false, coords = vector3(1241.4732666016, -566.36401367188, 68.657363891602), heading = 305.45001220703},
	{handler = nil, taken = false, coords = vector3(1302.9450683594, -527.74572753906, 70.460647583008), heading = 159.44515991211},
	{handler = nil, taken = false, coords = vector3(1328.4152832031, -536.00347900391, 71.44100189209), heading = 68.540893554688},
	{handler = nil, taken = false, coords = vector3(1373.1014404297, -555.60943603516, 73.685668945313), heading = 70.939399719238},
	{handler = nil, taken = false, coords = vector3(1388.7216796875, -569.60327148438, 73.496528625488), heading = 111.16860198975},
	{handler = nil, taken = false, coords = vector3(1386.2360839844, -593.40490722656, 73.485389709473), heading = 47.558258056641},
	{handler = nil, taken = false, coords = vector3(1367.0748291016, -606.28649902344, 73.710884094238), heading = 358.25967407227},
	{handler = nil, taken = false, coords = vector3(1341.3017578125, -597.40008544922, 73.700744628906), heading = 236.85884094238},
	{handler = nil, taken = false, coords = vector3(1323.5815429688, -583.11590576172, 72.246322631836), heading = 334.53005981445},
	{handler = nil, taken = false, coords = vector3(1301.1314697266, -573.93029785156, 70.73217010498), heading = 343.49063110352},
	{handler = nil, taken = false, coords = vector3(996.96075439453, -729.50671386719, 56.815723419189), heading = 309.70156860352},
	{handler = nil, taken = false, coords = vector3(979.12847900391, -716.32958984375, 57.220653533936), heading = 312.83898925781},
	{handler = nil, taken = false, coords = vector3(960.00927734375, -669.82678222656, 57.449756622314), heading = 301.31164550781},
	{handler = nil, taken = false, coords = vector3(943.52880859375, -653.56372070313, 57.428730010986), heading = 219.85661315918},
	{handler = nil, taken = false, coords = vector3(980.15966796875, -627.67071533203, 58.235824584961), heading = 29.739561080933},
	{handler = nil, taken = false, coords = vector3(964.32543945313, -596.03002929688, 58.902679443359), heading = 74.064910888672},
	{handler = nil, taken = false, coords = vector3(976.63903808594, -580.67956542969, 58.850051879883), heading = 31.776947021484},
	{handler = nil, taken = false, coords = vector3(1006.0868530273, -511.28295898438, 59.833919525146), heading = 116.15518951416},
	{handler = nil, taken = false, coords = vector3(987.91638183594, -525.77008056641, 59.690593719482), heading = 216.00218200684},
	{handler = nil, taken = false, coords = vector3(965.65673828125, -542.53234863281, 58.359081268311), heading = 210.57846069336},
	{handler = nil, taken = false, coords = vector3(919.83746337891, -569.87774658203, 57.366458892822), heading = 207.68246459961},
	{handler = nil, taken = false, coords = vector3(886.81939697266, -608.25311279297, 57.445098876953), heading = 312.44708251953},
	{handler = nil, taken = false, coords = vector3(861.80975341797, -583.66607666016, 57.156471252441), heading = 4.4116191864014},
	{handler = nil, taken = false, coords = vector3(844.17706298828, -563.349609375, 56.833854675293), heading = 187.83749389648},
	{handler = nil, taken = false, coords = vector3(850.17102050781, -532.68060302734, 56.9255027771), heading = 265.21118164063},
	{handler = nil, taken = false, coords = vector3(861.92669677734, -509.38543701172, 56.328895568848), heading = 224.87475585938},
	{handler = nil, taken = false, coords = vector3(878.45495605469, -497.87280273438, 57.090648651123), heading = 228.00672912598},
	{handler = nil, taken = false, coords = vector3(906.16571044922, -489.416015625, 58.436191558838), heading = 206.5407409668},
	{handler = nil, taken = false, coords = vector3(921.95196533203, -477.91156005859, 60.083648681641), heading = 202.21281433105},
	{handler = nil, taken = false, coords = vector3(944.08911132813, -463.3772277832, 60.395729064941), heading = 123.08079528809},
	{handler = nil, taken = false, coords = vector3(967.09588623047, -451.60711669922, 61.789577484131), heading = 214.46481323242},
	{handler = nil, taken = false, coords = vector3(987.74499511719, -433.47991943359, 62.891010284424), heading = 218.39331054688},
	{handler = nil, taken = false, coords = vector3(1010.4901123047, -423.38241577148, 64.349395751953), heading = 308.30364990234},
	{handler = nil, taken = false, coords = vector3(1029.4688720703, -409.33602905273, 64.949424743652), heading = 226.07402038574},
	{handler = nil, taken = false, coords = vector3(1060.6478271484, -378.2619934082, 67.231109619141), heading = 220.55097961426},
	{handler = nil, taken = false, coords = vector3(1114.4228515625, -391.31121826172, 67.948272705078), heading = 68.090431213379},
	{handler = nil, taken = false, coords = vector3(1101.0932617188, -411.35272216797, 66.555099487305), heading = 86.556617736816},
	{handler = nil, taken = false, coords = vector3(1099.3894042969, -438.68966674805, 66.790534973145), heading = 357.12872314453},
	{handler = nil, taken = false, coords = vector3(1098.5042724609, -464.77359008789, 66.319313049316), heading = 161.36457824707},
	{handler = nil, taken = false, coords = vector3(1090.4958496094, -484.41427612305, 64.660614013672), heading = 77.824592590332},
	{handler = nil, taken = false, coords = vector3(373.94869995117, 427.84967041016, 144.68434143066), heading = 76.372657775879},
	{handler = nil, taken = false, coords = vector3(346.5373840332, 440.85278320313, 146.70227050781), heading = 297.48321533203},
	{handler = nil, taken = false, coords = vector3(331.35540771484, 465.58920288086, 150.22177124023), heading = 13.768648147583},
	{handler = nil, taken = false, coords = vector3(315.74948120117, 501.91711425781, 152.1796875), heading = 192.76197814941},
	{handler = nil, taken = false, coords = vector3(223.93103027344, 513.88751220703, 139.76705932617), heading = 39.495399475098},
	{handler = nil, taken = false, coords = vector3(119.77896118164, 494.36019897461, 146.34288024902), heading = 99.048362731934},
	{handler = nil, taken = false, coords = vector3(79.99153137207, 486.11367797852, 147.20172119141), heading = 206.9698638916},
	{handler = nil, taken = false, coords = vector3(57.517036437988, 450.2507019043, 146.03134155273), heading = 319.93560791016},
	{handler = nil, taken = false, coords = vector3(43.050434112549, 468.59713745117, 147.09617614746), heading = 171.55433654785},
	{handler = nil, taken = false, coords = vector3(-8.0165967941284, 467.79479980469, 144.84080505371), heading = 330.92175292969},
	{handler = nil, taken = false, coords = vector3(-66.692749023438, 490.5803527832, 143.69036865234), heading = 342.87310791016},
	{handler = nil, taken = false, coords = vector3(-174.90896606445, 502.3655090332, 136.42001342773), heading = 97.755447387695},
	{handler = nil, taken = false, coords = vector3(-230.22163391113, 488.13333129883, 127.76791381836), heading = 21.379676818848},
	{handler = nil, taken = false, coords = vector3(-311.78588867188, 475.03744506836, 110.82423400879), heading = 117.86640930176},
	{handler = nil, taken = false, coords = vector3(-355.79095458984, 469.86947631836, 111.47953033447), heading = 286.87158203125},
	{handler = nil, taken = false, coords = vector3(-349.06866455078, 514.91973876953, 119.64605712891), heading = 134.03689575195},
	{handler = nil, taken = false, coords = vector3(-418.20037841797, 568.99615478516, 124.06007385254), heading = 151.46350097656},
	{handler = nil, taken = false, coords = vector3(-386.66973876953, 504.37878417969, 119.4126663208), heading = 331.97454833984},
	{handler = nil, taken = false, coords = vector3(-459.0725402832, 537.52386474609, 120.4566116333), heading = 352.69229125977},
	{handler = nil, taken = false, coords = vector3(-500.82736206055, 551.9306640625, 119.60135650635), heading = 343.50357055664},
	{handler = nil, taken = false, coords = vector3(-520.31530761719, 594.2138671875, 119.8364944458), heading = 279.51379394531},
	{handler = nil, taken = false, coords = vector3(-474.99652099609, 585.82250976563, 127.68348693848), heading = 274.03161621094},
	{handler = nil, taken = false, coords = vector3(-515.07232666016, 628.89642333984, 132.55099487305), heading = 206.03207397461},
	{handler = nil, taken = false, coords = vector3(-523.02990722656, 628.27288818359, 136.97380065918), heading = 297.10736083984},
	{handler = nil, taken = false, coords = vector3(-559.66870117188, 663.87048339844, 144.48677062988), heading = 342.39559936523},
	{handler = nil, taken = false, coords = vector3(-564.54022216797, 684.72253417969, 145.63323974609), heading = 207.03231811523},
	{handler = nil, taken = false, coords = vector3(-606.21917724609, 672.47644042969, 150.59693908691), heading = 348.45892333984},
	{handler = nil, taken = false, coords = vector3(-699.39703369141, 706.15179443359, 157.02005004883), heading = 321.54177856445},
	{handler = nil, taken = false, coords = vector3(-700.71411132813, 647.47503662109, 154.17544555664), heading = 343.31692504883},
	{handler = nil, taken = false, coords = vector3(-686.29620361328, 596.48870849609, 142.64221191406), heading = 35.213317871094},
	{handler = nil, taken = false, coords = vector3(-704.20751953125, 589.01965332031, 140.93058776855), heading = 356.63342285156},
	{handler = nil, taken = false, coords = vector3(-745.98950195313, 589.82397460938, 141.61546325684), heading = 61.48498916626},
	{handler = nil, taken = false, coords = vector3(231.98585510254, 672.47991943359, 188.94586181641), heading = 36.159778594971},
	{handler = nil, taken = false, coords = vector3(216.39456176758, 620.43951416016, 186.75405883789), heading = 82.201148986816},
	{handler = nil, taken = false, coords = vector3(128.30709838867, 566.16552734375, 182.97024536133), heading = 3.6412708759308},
	{handler = nil, taken = false, coords = vector3(119.28705596924, 564.50372314453, 182.95924377441), heading = 6.4454455375671},
	{handler = nil, taken = false, coords = vector3(85.016006469727, 561.60705566406, 181.77299499512), heading = 357.57699584961},
	{handler = nil, taken = false, coords = vector3(45.878612518311, 556.220703125, 179.08190917969), heading = 22.051708221436},
	{handler = nil, taken = false, coords = vector3(8.2492380142212, 539.634765625, 175.02792358398), heading = 336.91442871094},
}

Config.PumpkinLocations = {	
	{handler = nil, taken = false, coords = vector3(1190.58, -892.13,59.86), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1194.93, -890.01,60.24), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1197.86, -884.62,61.68), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1196.38, -878.25,61.51), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1202.02, -880.71,62.29), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1203.84, -888.28,62.79), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1200.69, -873.65,62.09), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1198.89, -866.7,62.2), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1202.32, -861.68,62.48), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1207.35, -866.86,63.1), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1211.85, -875.18,63.39), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1212.76, -880.45,63.59), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1215.37, -889.71,65.12), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1215.47, -897.56,66.9), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1207.48, -904.26,63.09), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1197.84, -986.01,48.93), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1191.71, -994.13,46.16), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1197.39, -996.45,47.77), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1194.67, -1001.28,46.95), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1188.2, -981.54,47.29), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1189.15, -970.88,48.16), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(1189.76, -961.61,48.09), rotation = vector3(0.0, 0.0, 0.0)},	
	{handler = nil, taken = false, coords = vector3(-498.92, -1827.42,22.43), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-505.31, -1833.71,23.66), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-496.38, -1831.62,23.15), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-494.9, -1824.17,21.9), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-486.29, -1824.61,21.62), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-487.75, -1837.12,23.16), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-501.61, -1840.55,24.64), rotation = vector3(0.0, 0.0, 0.0)},	 
	{handler = nil, taken = false, coords = vector3(-1289.37, 53.01,50.43), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-1290.31, 59.33,51.29), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-1287.92, 64.11,52.36), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-1280.68, 58.59,50.89), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-1272.06, 59.3,50.35), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-1282.91, 55.23,50.6), rotation = vector3(0.0, 0.0, 0.0)},
	{handler = nil, taken = false, coords = vector3(-108.41, -436.23,34.98), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-103.86, -443.17,34.94), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-93.33, -438.94,34.94), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-98.57, -432.22,35.19), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-99.9, -422.59,35.24), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-94.45, -425.16,35.4), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-110.12, -420.28,34.75), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-118.82, -425.6,34.68), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-124.06, -421.73,34.12), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-130.98, -430.19,33.85), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-135.27, -437.18,33.51), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-133.83, -444.04,33.29), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-126.64, -449.44,33.67), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-113.48, -452.7,33.8), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-100.82, -455.9,33.98), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(-89.2, -449.25,35.04), rotation = vector3(0.0, 0.0, 0.0)},	
	{handler = nil, taken = false, coords = vector3(628.85, -101.92,72.33), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(633.47, -108.6,73.0), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(640.07, -104.05,73.43), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(640.71, -98.47,73.52), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(625.9, -97.91,72.13), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(620.21, -105.74,72.97), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(620.86, -113.93,72.56), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(627.12, -117.01,72.2), rotation = vector3(0.0, 0.0, 0.0)}, 
	{handler = nil, taken = false, coords = vector3(634.4, -113.7,72.45), rotation = vector3(0.0, 0.0, 0.0)},	
	{handler = nil, taken = false, coords = vector3(635.31, -94.64,73.48), rotation = vector3(0.0, 0.0, 0.0)}, 
}

Config.FemaleModels = {
	{modelname = "ig_abigail"},
	{modelname = "s_f_y_airhostess_01"},
	{modelname = "ig_amandatownley"},
	{modelname = "cs_amandatownley"},
	{modelname = "csb_anita"},
	{modelname = "ig_ashley"},
	{modelname = "cs_ashley"},
	{modelname = "g_f_y_ballas_01"},
	{modelname = "s_f_y_bartender_01"},
	{modelname = "a_f_m_bevhills_01"},
	{modelname = "a_f_y_bevhills_01"},
	{modelname = "a_f_m_bevhills_02"},
	{modelname = "a_f_y_bevhills_02"},
	{modelname = "a_f_y_bevhills_03"},
	{modelname = "a_f_y_bevhills_04"},
	{modelname = "u_f_y_bikerchic"},
	{modelname = "mp_f_boatstaff_01"},
	{modelname = "ig_bride"},
	{modelname = "a_f_y_business_01"},
	{modelname = "a_f_m_business_02"},
	{modelname = "a_f_y_business_02"},
	{modelname = "a_f_y_business_03"},
	{modelname = "a_f_y_business_04"},
	{modelname = "u_f_y_comjane"},
	{modelname = "cs_debra"},
	{modelname = "ig_denise"},
	{modelname = "csb_denise_friend"},
	{modelname = "a_f_m_downtown_01"},
	{modelname = "mp_f_deadhooker"},
	{modelname = "a_f_m_eastsa_01"},
	{modelname = "a_f_y_eastsa_01"},
	{modelname = "a_f_m_eastsa_02"},
	{modelname = "a_f_y_eastsa_02"},
	{modelname = "a_f_y_eastsa_03"},
	{modelname = "a_f_y_epsilon_01"},
	{modelname = "a_f_m_fatbla_01"},
	{modelname = "a_f_m_fatwhite_01"},
	{modelname = "s_f_m_fembarber"},
	{modelname = "a_f_y_fitness_01"},
	{modelname = "a_f_y_fitness_02"},
	{modelname = "a_f_y_genhot_01"},
	{modelname = "a_f_o_genstreet_01"},
	{modelname = "a_f_y_golfer_01"},
	{modelname = "cs_gurk"},
	{modelname = "a_f_y_hiker_01"},
	{modelname = "a_f_y_hipster_01"},
	{modelname = "a_f_y_hipster_02"},
	{modelname = "a_f_y_hipster_03"},
	{modelname = "a_f_y_hipster_04"},
	{modelname = "s_f_y_hooker_01"},
	{modelname = "s_f_y_hooker_02"},
	{modelname = "s_f_y_hooker_03"},
	{modelname = "u_f_y_hotposh_01"},
	{modelname = "ig_janet"},
	{modelname = "ig_jewelass"},
	{modelname = "u_f_y_jewelass_01"},
	{modelname = "cs_jewelass"},
	{modelname = "a_f_y_juggalo_01"},
	{modelname = "ig_karen_daniels"},
	{modelname = "ig_kerrymcintosh"},
	{modelname = "a_f_m_ktown_01"},
	{modelname = "a_f_o_ktown_01"},
	{modelname = "a_f_m_ktown_02"},
	{modelname = "g_f_y_lost_01"},
	{modelname = "ig_magenta"},
	{modelname = "s_f_m_maid_01"},
	{modelname = "ig_marnie"},
	{modelname = "ig_maryann"},
	{modelname = "ig_maude"},
	{modelname = "ig_michelle"},
	{modelname = "u_f_m_miranda"},
	{modelname = "u_f_y_mistress"},
	{modelname = "ig_molly"},
	{modelname = "cs_movpremf_01"},
	{modelname = "u_f_o_moviestar"},
	{modelname = "ig_natalia"},
	{modelname = "ig_paige"},
	{modelname = "ig_patricia"},
	{modelname = "u_f_y_poppymich"},
	{modelname = "u_f_y_princess"},
	{modelname = "a_f_y_runner_01"},
	{modelname = "a_f_y_rurmeth_01"},
	{modelname = "a_f_o_salton_01"},
	{modelname = "ig_screen_writer"},
	{modelname = "s_f_m_shop_high"},
	{modelname = "s_f_y_shop_low"},
	{modelname = "s_f_y_shop_mid"},
	{modelname = "a_f_y_skater_01"},
	{modelname = "a_f_m_skidrow_01"},
	{modelname = "a_f_m_soucent_01"},
	{modelname = "a_f_y_soucent_01"},
	{modelname = "a_f_m_soucent_02"},
	{modelname = "a_f_o_soucent_02"},
	{modelname = "a_f_y_soucent_02"},
	{modelname = "a_f_y_soucent_03"},
	{modelname = "a_f_m_soucentmc_01"},
	{modelname = "ig_tanisha"},
	{modelname = "s_f_y_sweatshop_01"},
	{modelname = "s_f_m_sweatshop_01"},
	{modelname = "ig_tonya"},
	{modelname = "a_f_m_tourist_01"},
	{modelname = "a_f_y_tourist_01"},
	{modelname = "a_f_m_tramp_01"},
	{modelname = "g_f_y_vagos_01"},
	{modelname = "a_f_y_vinewood_01"},
	{modelname = "a_f_y_vinewood_02"},
	{modelname = "a_f_y_vinewood_04"},
	{modelname = "a_f_y_yoga_01"},
	{modelname = "a_f_y_femaleagent"},
}

Config.MaleModels = {
	{modelname = "a_m_m_afriamer_01"},
	{modelname = "ig_mp_agent14"},
	{modelname = "csb_mp_agent14"},
	{modelname = "csb_agent"},
	{modelname = "u_m_m_aldinapoli"},
	{modelname = "s_m_y_ammucity_01"},
	{modelname = "s_m_m_ammucountry"},
	{modelname = "ig_andreas"},
	{modelname = "u_m_y_antonb"},
	{modelname = "csb_anton"},
	{modelname = "g_m_m_armboss_01"},
	{modelname = "g_m_m_armgoon_01"},
	{modelname = "g_m_y_armgoon_02"},
	{modelname = "g_m_m_armlieut_01"},
	{modelname = "s_m_m_autoshop_01"},
	{modelname = "s_m_m_autoshop_02"},
	{modelname = "ig_money"},
	{modelname = "g_m_y_azteca_01"},
	{modelname = "g_m_y_ballaeast_01"},
	{modelname = "g_m_y_ballaorig_01"},
	{modelname = "ig_ballasog"},
	{modelname = "csb_ballasog"},
	{modelname = "g_m_y_ballasout_01"},
	{modelname = "u_m_m_bankman"},
	{modelname = "ig_bankman"},
	{modelname = "cs_bankman"},
	{modelname = "s_m_y_barman_01"},
	{modelname = "ig_barry"},
	{modelname = "cs_barry"},
	{modelname = "u_m_y_baygor"},
	{modelname = "a_m_y_beachvesp_01"},
	{modelname = "a_m_y_beachvesp_02"},
	{modelname = "ig_benny"},
	{modelname = "ig_bestmen"},
	{modelname = "ig_beverly"},
	{modelname = "a_m_m_bevhills_01"},
	{modelname = "a_m_y_bevhills_01"},
	{modelname = "a_m_m_bevhills_02"},
	{modelname = "a_m_y_bevhills_02"},
	{modelname = "u_m_m_bikehire_01"},
	{modelname = "mp_m_boatstaff_01"},
	{modelname = "s_m_m_bouncer_01"},
	{modelname = "ig_brad"},
	{modelname = "u_m_y_burgerdrug_01"},
	{modelname = "s_m_y_busboy_01"},
	{modelname = "a_m_y_busicas_01"},
	{modelname = "a_m_m_business_01"},
	{modelname = "a_m_y_business_01"},
	{modelname = "a_m_y_business_02"},
	{modelname = "a_m_y_business_03"},
	{modelname = "s_m_o_busker_01"},
	{modelname = "ig_car3guy1"},
	{modelname = "csb_car3guy1"},
	{modelname = "ig_car3guy2"},
	{modelname = "csb_car3guy2"},
	{modelname = "cs_carbuyer"},
	{modelname = "s_m_m_ccrew_01"},
	{modelname = "g_m_m_chiboss_01"},
	{modelname = "g_m_m_chigoon_01"},
	{modelname = "g_m_m_chigoon_02"},
	{modelname = "csb_chin_goon"},
	{modelname = "u_m_y_chip"},
	{modelname = "s_m_m_ciasec_01"},
	{modelname = "mp_m_claude_01"},
	{modelname = "ig_clay"},
	{modelname = "cs_clay"},
	{modelname = "ig_claypain"},
	{modelname = "s_m_m_cntrybar_01"},
	{modelname = "csb_customer"},
	{modelname = "a_m_y_cyclist_01"},
	{modelname = "ig_dale"},
	{modelname = "ig_davenorton"},
	{modelname = "s_m_y_dealer_01"},
	{modelname = "ig_devin"},
	{modelname = "s_m_y_devinsec_01"},
	{modelname = "ig_dom"},
	{modelname = "s_m_y_doorman_01"},
	{modelname = "a_m_y_downtown_01"},
	{modelname = "ig_dreyfuss"},
	{modelname = "ig_drfriedlander"},
	{modelname = "s_m_y_dwservice_01"},
	{modelname = "s_m_y_dwservice_02"},
	{modelname = "a_m_m_eastsa_01"},
	{modelname = "a_m_y_eastsa_01"},
	{modelname = "a_m_m_eastsa_02"},
	{modelname = "a_m_y_eastsa_02"},
	{modelname = "u_m_m_edtoh"},
	{modelname = "a_m_y_epsilon_01"},
	{modelname = "a_m_y_epsilon_02"},
	{modelname = "ig_fabien"},
	{modelname = "g_m_y_famfor_01"},
	{modelname = "g_m_y_famdnf_01"},
	{modelname = "a_m_m_farmer_01"},
	{modelname = "a_m_m_fatlatin_01"},
	{modelname = "ig_fbisuit_01"},
	{modelname = "cs_fbisuit_01"},
	{modelname = "u_m_m_fibarchitect"},
	{modelname = "u_m_y_fibmugger_01"},
	{modelname = "s_m_m_fiboffice_01"},
	{modelname = "s_m_m_fiboffice_02"},
	{modelname = "u_m_m_filmdirector"},
	{modelname = "u_m_o_finguru_01"},
	{modelname = "csb_fos_rep"},
	{modelname = "player_one"},
	{modelname = "ig_g"},
	{modelname = "s_m_m_gaffer_01"},
	{modelname = "a_m_y_gay_01"},
	{modelname = "a_m_y_gay_02"},
	{modelname = "csb_g"},
	{modelname = "a_m_m_genfat_01"},
	{modelname = "a_m_m_genfat_02"},
	{modelname = "a_m_o_genstreet_01"},
	{modelname = "a_m_y_genstreet_01"},
	{modelname = "a_m_y_genstreet_02"},
	{modelname = "s_m_m_gentransport"},
	{modelname = "u_m_m_glenstank_01"},
	{modelname = "a_m_m_golfer_01"},
	{modelname = "a_m_y_golfer_01"},
	{modelname = "s_m_y_grip_01"},
	{modelname = "ig_groom"},
	{modelname = "csb_grove_str_dlr"},
	{modelname = "cs_guadalope"},
	{modelname = "u_m_y_guido_01"},
	{modelname = "u_m_y_gunvend_01"},
	{modelname = "hc_hacker"},
	{modelname = "s_m_m_hairdress_01"},
	{modelname = "ig_hao"},
	{modelname = "a_m_m_hasjew_01"},
	{modelname = "a_m_y_hasjew_01"},
	{modelname = "s_m_m_highsec_01"},
	{modelname = "s_m_m_highsec_02"},
	{modelname = "a_m_y_hiker_01"},
	{modelname = "a_m_m_hillbilly_02"},
	{modelname = "u_m_y_hippie_01"},
	{modelname = "a_m_y_hipster_01"},
	{modelname = "a_m_y_hipster_02"},
	{modelname = "a_m_y_hipster_03"},
	{modelname = "csb_hugh"},
	{modelname = "csb_imran"},
	{modelname = "csb_jackhowitzer"},
	{modelname = "csb_janitor"},
	{modelname = "s_m_m_janitor"},
	{modelname = "ig_jay_norris"},
	{modelname = "u_m_m_jesus_01"},
	{modelname = "u_m_m_jewelsec_01"},
	{modelname = "u_m_m_jewelthief"},
	{modelname = "ig_jimmyboston"},
	{modelname = "ig_jimmydisanto"},
	{modelname = "ig_joeminuteman"},
	{modelname = "cs_johnnyklebitz"},
	{modelname = "ig_josef"},
	{modelname = "ig_josh"},
	{modelname = "a_m_y_juggalo_01"},
	{modelname = "u_m_y_justin"},
	{modelname = "g_m_m_korboss_01"},
	{modelname = "g_m_y_korean_01"},
	{modelname = "g_m_y_korean_02"},
	{modelname = "g_m_y_korlieut_01"},
	{modelname = "a_m_m_ktown_01"},
	{modelname = "a_m_o_ktown_01"},
	{modelname = "a_m_y_ktown_01"},
	{modelname = "a_m_y_ktown_02"},
	{modelname = "ig_lamardavis"},
	{modelname = "s_m_m_lathandy_01"},
	{modelname = "a_m_y_latino_01"},
	{modelname = "ig_lazlow"},
	{modelname = "ig_lestercrest"},
	{modelname = "ig_lifeinvad_01"},
	{modelname = "s_m_m_lifeinvad_01"},
	{modelname = "g_m_y_lost_01"},
	{modelname = "ig_lifeinvad_02"},
	{modelname = "g_m_y_lost_02"},
	{modelname = "g_m_y_lost_03"},
	{modelname = "s_m_m_lsmetro_01"},
	{modelname = "a_m_m_malibu_01"},
	{modelname = "u_m_y_mani"},
	{modelname = "ig_manuel"},
	{modelname = "s_m_m_mariachi_01"},
	{modelname = "u_m_m_markfost"},
	{modelname = "cs_martinmadrazo"},
	{modelname = "a_m_y_methhead_01"},
	{modelname = "g_m_m_mexboss_01"},
	{modelname = "g_m_m_mexboss_02"},
	{modelname = "a_m_m_mexcntry_01"},
	{modelname = "g_m_y_mexgang_01"},
	{modelname = "g_m_y_mexgoon_01"},
	{modelname = "g_m_y_mexgoon_02"},
	{modelname = "g_m_y_mexgoon_03"},
	{modelname = "a_m_m_mexlabor_01"},
	{modelname = "a_m_y_mexthug_01"},
	{modelname = "player_zero"},
	{modelname = "u_m_y_militarybum"},
	{modelname = "ig_milton"},
	{modelname = "cs_movpremmale"},
	{modelname = "ig_mrk"},
	{modelname = "mp_g_m_pros_01"},
	{modelname = "ig_nervousron"},
	{modelname = "ig_nigel"},
	{modelname = "a_m_m_og_boss_01"},
	{modelname = "ig_ortega"},
	{modelname = "csb_oscar"},
	{modelname = "a_m_m_paparazzi_01"},
	{modelname = "ig_paper"},
	{modelname = "u_m_y_paparazzi"},
	{modelname = "u_m_y_party_01"},
	{modelname = "u_m_m_partytarget"},
	{modelname = "g_m_y_pologoon_02"},
	{modelname = "g_m_y_pologoon_01"},
	{modelname = "a_m_m_polynesian_01"},
	{modelname = "a_m_y_polynesian_01"},
	{modelname = "s_m_m_postal_01"},
	{modelname = "s_m_m_postal_02"},
	{modelname = "u_m_y_proldriver_01"},
	{modelname = "csb_reporter"},
	{modelname = "ig_roccopelosi"},
	{modelname = "a_m_y_runner_02"},
	{modelname = "a_m_m_rurmeth_01"},
	{modelname = "ig_russiandrunk"},
	{modelname = "a_m_m_salton_03"},
	{modelname = "g_m_y_salvaboss_01"},
	{modelname = "s_m_y_shop_mask"},
	{modelname = "ig_siemonyetarian"},
	{modelname = "a_m_m_skater_01"},
	{modelname = "a_m_y_skater_01"},
	{modelname = "a_m_y_skater_02"},
	{modelname = "a_m_m_skidrow_01"},
	{modelname = "a_m_m_socenlat_01"},
	{modelname = "ig_solomon"},
	{modelname = "a_m_m_soucent_01"},
	{modelname = "a_m_o_soucent_01"},
	{modelname = "a_m_y_soucent_01"},
	{modelname = "a_m_m_soucent_02"},
	{modelname = "a_m_o_soucent_02"},
	{modelname = "a_m_y_soucent_02"},
	{modelname = "a_m_m_soucent_03"},
	{modelname = "a_m_y_soucent_04"},
	{modelname = "a_m_m_soucent_04"},
	{modelname = "a_m_y_soucent_03"},
	{modelname = "a_m_y_stbla_01"},
	{modelname = "a_m_y_stbla_02"},
	{modelname = "ig_stretch"},
	{modelname = "a_m_m_stlat_02"},
	{modelname = "a_m_y_stlat_01"},
	{modelname = "g_m_y_strpunk_02"},
	{modelname = "g_m_y_strpunk_01"},
	{modelname = "s_m_m_strpreach_01"},
	{modelname = "s_m_y_strvend_01"},
	{modelname = "a_m_y_stwhi_02"},
	{modelname = "a_m_y_sunbathe_01"},
	{modelname = "u_m_y_tattoo_01"},
	{modelname = "ig_terry"},
	{modelname = "cs_tom"},
	{modelname = "ig_tomepsilon"},
	{modelname = "a_m_m_trampbeac_01"},
	{modelname = "player_two"},
	{modelname = "s_m_m_trucker_01"},
	{modelname = "ig_vagspeak"},
	{modelname = "a_m_y_vindouche_01"},
	{modelname = "a_m_y_vinewood_01"},
	{modelname = "a_m_y_vinewood_02"},
	{modelname = "a_m_y_vinewood_03"},
	{modelname = "ig_wade"},
	{modelname = "ig_chengsr"},
	{modelname = "a_m_y_yoga_01"},
	{modelname = "ig_zimbor"},
	{modelname = "ig_agent"},
	{modelname = "ig_malc"},
	{modelname = "mp_m_execpa_01"},
	{modelname = "ig_avon"},
	{modelname = "ig_lestercrest_2"},
}

Config.HalloweenDecorationsObjects = {
	{
		decorationitemname = "bat_b", -- spawn item name of the object
		decorationobjectname = "djn_d_bat",  -- object name
	},
	{
		decorationitemname = "bat_g", -- spawn item name of the object
		decorationobjectname = "djn_g_bat",  -- object name
	},
	{
		decorationitemname = "bat_w", -- spawn item name of the object
		decorationobjectname = "djn_w_bat",  -- object name
	},	
	{
		decorationitemname = "bucket_1", -- spawn item name of the object
		decorationobjectname = "djn_hallowen_basket_1",  -- object name
	},
	{
		decorationitemname = "bucket_2", -- spawn item name of the object
		decorationobjectname = "djn_hallowen_basket_2",  -- object name
	},		
	{
		decorationitemname = "bucket_3", -- spawn item name of the object
		decorationobjectname = "djn_pot",  -- object name
	},	
	{
		decorationitemname = "cat_b", -- spawn item name of the object
		decorationobjectname = "djn_d_djn_cat_1",  -- object name
	},	
	{
		decorationitemname = "cat_g", -- spawn item name of the object
		decorationobjectname = "djn_g_djn_cat_1",  -- object name
	},
	{
		decorationitemname = "cat_w", -- spawn item name of the object
		decorationobjectname = "djn_w_djn_cat_1",  -- object name
	},	
	{
		decorationitemname = "coffin", -- spawn item name of the object
		decorationobjectname = "djn_coffin",  -- object name
	},
	{
		decorationitemname = "coffin_door", -- spawn item name of the object
		decorationobjectname = "djn_coffin_door",  -- object name
	},	
	{
		decorationitemname = "crown_b", -- spawn item name of the object
		decorationobjectname = "djn_d_crow",  -- object name
	},	
	{
		decorationitemname = "crown_g", -- spawn item name of the object
		decorationobjectname = "djn_g_crow",  -- object name
	},		
	{
		decorationitemname = "crown_w", -- spawn item name of the object
		decorationobjectname = "djn_w_crow",  -- object name
	},	
	{
		decorationitemname = "ghost_b", -- spawn item name of the object
		decorationobjectname = "djn_d_ghost",  -- object name
	},	
	{
		decorationitemname = "ghost_g", -- spawn item name of the object
		decorationobjectname = "djn_g_ghost",  -- object name
	},	
	{
		decorationitemname = "ghost_w", -- spawn item name of the object
		decorationobjectname = "djn_w_ghost",  -- object name
	},	
	{
		decorationitemname = "grave", -- spawn item name of the object
		decorationobjectname = "djn_grave",  -- object name
	},	
	{
		decorationitemname = "krucifix_b", -- spawn item name of the object
		decorationobjectname = "djn_d_krucifix",  -- object name
	},	
	{
		decorationitemname = "krucifix_g", -- spawn item name of the object
		decorationobjectname = "djn_g_krucifix",  -- object name
	},	
	{
		decorationitemname = "krucifix_w", -- spawn item name of the object
		decorationobjectname = "djn_w_krucifix",  -- object name
	},	
	{
		decorationitemname = "mumie", -- spawn item name of the object
		decorationobjectname = "djn_mumie",  -- object name
	},	
	{
		decorationitemname = "pot_handler", -- spawn item name of the object
		decorationobjectname = "djn_pot_stancer",  -- object name
	},	
	{
		decorationitemname = "pumpkin_1", -- spawn item name of the object
		decorationobjectname = "dyne_1",  -- object name
	},	
	{
		decorationitemname = "pumpkin_2", -- spawn item name of the object
		decorationobjectname = "dyne_2",  -- object name
	},
	{
		decorationitemname = "pumpkin_3", -- spawn item name of the object
		decorationobjectname = "dyne_3",  -- object name
	},		
	{
		decorationitemname = "skeleton_grave", -- spawn item name of the object
		decorationobjectname = "djn_grave_skeleton_body",  -- object name
	},		
	{
		decorationitemname = "skull_1", -- spawn item name of the object
		decorationobjectname = "djn_skull_1",  -- object name
	},	
	{
		decorationitemname = "skull_2", -- spawn item name of the object
		decorationobjectname = "djn_skull_2",  -- object name
	},	
	{
		decorationitemname = "spider_b", -- spawn item name of the object
		decorationobjectname = "djn_d_spider",  -- object name
	},	
	{
		decorationitemname = "spider_g", -- spawn item name of the object
		decorationobjectname = "djn_g_spider",  -- object name
	},	
	{
		decorationitemname = "spider_w", -- spawn item name of the object
		decorationobjectname = "djn_w_spider",  -- object name
	},		
	{
		decorationitemname = "witch_b", -- spawn item name of the object
		decorationobjectname = "djn_d_witch",  -- object name
	},	
	{
		decorationitemname = "witch_g", -- spawn item name of the object
		decorationobjectname = "djn_g_witch",  -- object name
	},	
	{
		decorationitemname = "witch_w", -- spawn item name of the object
		decorationobjectname = "djn_w_witch",  -- object name
	},		
}

Config.PlayerLoadedEvent = { -- load methods of water wctivities
	esx = "esx:playerLoaded", 
	qbcore = "QBCore:Client:OnPlayerLoaded",
	standalone = "playerLoaded",
	customevent = true, -- enable this if you dont want load water wctivities after player loaded to server. (enable this for example for servers with multicharacter)
	standaloneevent = false, -- enable this if you dont want load water wctivities after player loaded to server. (for standalone version)
}

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 240
		DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 255, 102, 255, 150)
	end
end


function Notify(text)
	exports['vms_notifyv2']:Notification({
    	title = "Halloween",
    	description = text,
    	time = 5000,
    	color = "FF7518",
    	icon = "fa-solid fa-ghost",
	})
end