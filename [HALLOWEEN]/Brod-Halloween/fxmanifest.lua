fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Brod Store'
description 'Brod Store'
version '1.0.0'

this_is_a_map "yes"

files {
    'stream/*'
}

escrow_ignore {
    'stream/textures/*.ytd',
	'stream/vanilla/ybn/*.ybn',
	'stream/vanilla/ydr/*.ydr',
	'stream/metadata/*.ymap',
}
dependency '/assetpacks'