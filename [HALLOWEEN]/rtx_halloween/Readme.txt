Thank you for purchasing rtx_halloween we're grateful for your support. If you'd ever have a question and / or need our help, please reach out to us by sending an email or go ahead and create a ticket on our discord: https://discord.gg/P6KdaDpgAk


Install instructions (Standalone):
1. Put rtx_halloween folder to your resources
2. Open config.lua file
3. Configure your config.lua to your preferences
4. Upload sql sql_STANDALONE-QBCORE.sql file to your mysql database.
5. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua',
6. Put rtx_halloween to the server.cfg
7. Add your framework functions in other.lua file

Install instructions (QBCore):
1. Put rtx_halloween folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "qbcore"
4. Configure your config.lua to your preferences
5. Upload sql sql_STANDALONE-QBCORE.sql file to your mysql database.
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua',
7. Put rtx_halloween to the server.cfg
6. Add new items to qb-core/shared/items.lua
Example items line for items.lua:
['bat_b'] = {['name'] = 'bat_b', ['label'] = 'bat_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'bat_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'bat_b'},
['bat_g'] = {['name'] = 'bat_g', ['label'] = 'bat_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'bat_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'bat_g'},
['bat_w'] = {['name'] = 'bat_w', ['label'] = 'bat_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'bat_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'bat_w'},
['bucket_1'] = {['name'] = 'bucket_1', ['label'] = 'bucket_1', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'bucket_1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'bucket_1'},
['bucket_2'] = {['name'] = 'bucket_2', ['label'] = 'bucket_2', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'bucket_2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'bucket_2'},
['bucket_3'] = {['name'] = 'bucket_3', ['label'] = 'bucket_3', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'bucket_3.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'bucket_3'},
['cat_b'] = {['name'] = 'cat_b', ['label'] = 'cat_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'cat_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'cat_b'},
['cat_g'] = {['name'] = 'cat_g', ['label'] = 'cat_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'cat_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'cat_g'},
['cat_w'] = {['name'] = 'cat_w', ['label'] = 'cat_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'cat_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'cat_w'},
['coffin'] = {['name'] = 'coffin', ['label'] = 'coffin', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'coffin.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'coffin'},
['coffin_door'] = {['name'] = 'coffin_door', ['label'] = 'coffin_door', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'coffin_door.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'coffin_door'},
['crown_b'] = {['name'] = 'crown_b', ['label'] = 'crown_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'crown_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'crown_b'},
['crown_g'] = {['name'] = 'crown_g', ['label'] = 'crown_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'crown_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'crown_g'},
['crown_w'] = {['name'] = 'crown_w', ['label'] = 'crown_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'crown_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'crown_w'},
['ghost_b'] = {['name'] = 'ghost_b', ['label'] = 'ghost_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'ghost_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'ghost_b'},
['ghost_g'] = {['name'] = 'ghost_g', ['label'] = 'ghost_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'ghost_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'ghost_g'},
['ghost_w'] = {['name'] = 'ghost_w', ['label'] = 'ghost_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'ghost_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'ghost_w'},
['grave'] = {['name'] = 'grave', ['label'] = 'grave', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'grave.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'grave'},
['krucifix_b'] = {['name'] = 'krucifix_b', ['label'] = 'krucifix_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'krucifix_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'krucifix_b'},
['krucifix_g'] = {['name'] = 'krucifix_g', ['label'] = 'krucifix_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'krucifix_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'krucifix_g'},
['krucifix_w'] = {['name'] = 'krucifix_w', ['label'] = 'krucifix_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'krucifix_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'krucifix_w'},
['mumie'] = {['name'] = 'mumie', ['label'] = 'mumie', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'mumie.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'mumie'},
['pot_handler'] = {['name'] = 'pot_handler', ['label'] = 'pot_handler', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'pot_handler.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'pot_handler'},
['pumpkin_1'] = {['name'] = 'pumpkin_1', ['label'] = 'pumpkin_1', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'pumpkin_1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'pumpkin_1'},
['pumpkin_2'] = {['name'] = 'pumpkin_2', ['label'] = 'pumpkin_2', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'pumpkin_2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'pumpkin_2'},
['pumpkin_3'] = {['name'] = 'pumpkin_3', ['label'] = 'pumpkin_3', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'pumpkin_3.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'pumpkin_3'},
['skeleton_grave'] = {['name'] = 'skeleton_grave', ['label'] = 'skeleton_grave', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'skeleton_grave.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'skeleton_grave'},
['skull_1'] = {['name'] = 'skull_1', ['label'] = 'skull_1', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'skull_1.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'skull_1'},
['skull_2'] = {['name'] = 'skull_2', ['label'] = 'skull_2', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'skull_2.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'skull_2'},
['spider_b'] = {['name'] = 'spider_b', ['label'] = 'spider_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'spider_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'spider_b'},
['spider_g'] = {['name'] = 'spider_g', ['label'] = 'spider_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'spider_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'spider_g'},
['spider_w'] = {['name'] = 'spider_w', ['label'] = 'spider_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'spider_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'spider_w'},
['witch_b'] = {['name'] = 'witch_b', ['label'] = 'witch_b', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'witch_b.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'witch_b'},
['witch_g'] = {['name'] = 'witch_g', ['label'] = 'witch_g', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'witch_g.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'witch_g'},
['witch_w'] = {['name'] = 'witch_w', ['label'] = 'witch_w', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'witch_w.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'witch_w'},
['trickortreatsbucket'] = {['name'] = 'trickortreatsbucket', ['label'] = 'trickortreatsbucket', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'trickortreatsbucket.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'trickortreatsbucket'},
['pumpkin'] = {['name'] = 'pumpkin', ['label'] = 'pumpkin', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'pumpkin.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'pumpkin'},
['flet'] = {['name'] = 'flet', ['label'] = 'flet', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'flet.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'flet'},
['lars'] = {['name'] = 'lars', ['label'] = 'lars', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'lars.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'lars'},
['papi'] = {['name'] = 'papi', ['label'] = 'papi', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'papi.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'papi'},
['picolo'] = {['name'] = 'picolo', ['label'] = 'picolo', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'picolo.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'picolo'},
['skiiles'] = {['name'] = 'skiiles', ['label'] = 'skiiles', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'skiiles.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'skiiles'},
['sneck'] = {['name'] = 'sneck', ['label'] = 'sneck', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'sneck.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'sneck'},

Install instructions (ESX):
1. Put rtx_halloween folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "esx"
4. Configure your config.lua to your preferences
5. Upload sql sql_ESX.sql file to your mysql database.
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/yoULcX4.png) remove -- from line 10, or replace line 10 with '@mysql-async/lib/MySQL.lua',
7. Put rtx_halloween to the server.cfg

Command for admin:

/scareplayer (example /scareplayer 1)

/cleardecorations (for clear all decorations on server)

/clearnearbydecorations (for clear nearby decorations on server) for example /clearnearbydecorations 10.0 (remove all decorations in 10.0 radius)

to Trick or Treat a player must use an item in inventory (trickortreatsbucket) for standalone use command /trickortreat

players can delete their objects in the environment via the /removedecoration command

License agreement / Terms of Service
1. Any purchase is non-refundable.
2. Each product is to be used on a singular server, with the exception of a test server.
3. Any form of redistribution of our content is considered copyright infringement.
4. If any of these rules are broken, legal actions can be taken.
© 2025 RTX Development, all rights reserved.