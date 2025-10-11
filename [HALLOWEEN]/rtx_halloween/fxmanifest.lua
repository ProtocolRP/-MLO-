fx_version 'cerulean'

game 'gta5'

description 'RTX HALLOWEN'

version '10.0'

server_scripts {

	'@oxmysql/lib/MySQL.lua', -- enable this and remove mysql async line (line 10) if you use oxmysql (only enable this for qbcore/esx framework)
	'config.lua',
	'language/main.lua',
	'server/main.lua',
	'server/other.lua',
}

client_scripts {
	'config.lua',
	'language/main.lua',
	'client/main.lua',
}

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/howler.core.js',
	'html/gizmoapi.js',
	'html/debounce.min.js',
	'html/BebasNeueBold.ttf',
	'html/img/*.png',
	'html/sounds/*.mp3'
}

ui_page 'html/ui.html'

data_file 'DLC_ITYP_REQUEST' 'rtx_halloween_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'rtx_halloween_candy.ytyp'

lua54 'yes'

escrow_ignore {
  'config.lua',
  'language/main.lua',
  'server/other.lua',
}
dependency '/assetpacks'