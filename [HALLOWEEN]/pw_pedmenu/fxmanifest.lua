fx_version "cerulean"
game 'gta5'
lua54 'yes'
author "tutustk"
description "Ped Menu by Pewe Studio"

ui_page 'web/build/index.html'

shared_scripts {
	"@ox_lib/init.lua",
	"shared/config.lua"
}

client_scripts {
	"bridge/client/*",
	"client/**/*"
}

server_scripts {
	"bridge/server/*",
	"server/**/*"
}

files {
	'web/build/index.html',
	'web/build/**/*',
}

escrow_ignore {
	"bridge/**/*",
	"shared/config.lua"
}

dependency 'oxmysql'
dependency 'ox_lib'
dependency '/assetpacks'