fx_version 'cerulean'
games { 'rdr3', 'gta5' }
lua54 'yes'
author 'HG Store'
description 'HG-Halloween'
version '1.0.0'

shared_script {
	'@ox_lib/init.lua',
    'shared.lua',
    'config.lua'
}

client_script { 
    "client/bridge-cl.lua",
    "client/client.lua",
    "client/city.lua",
    "client/ghosthunt-cl.lua",
    "client/pumpkinhunt-cl.lua",
    "client/lightsystem-cl.lua",
}

server_script { 
    '@oxmysql/lib/MySQL.lua',
    "server/bridge-sv.lua",
    "server/server.lua",
    "server/ghosthunt-sv.lua",
    "server/pumpkinhunt-sv.lua",
}

dependencies {
	'ox_lib'
}

escrow_ignore {
    'config.lua',
    'shared.lua',
    'README.lua',
    'client/bridge-cl.lua',
    'server/bridge-sv.lua',
    'client/client.lua',
    'client/city.lua',
    'client/ghosthunt-cl.lua',
    'client/pumpkinhunt-cl.lua',
    'client/lightsystem-cl.lua',
    'server/server.lua',
    'server/ghosthunt-sv.lua',
    'server/pumpkinhunt-sv.lua',
}
dependency '/assetpacks'