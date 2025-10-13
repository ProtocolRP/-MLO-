fx_version 'cerulean'
game 'gta5'
this_is_a_map 'yes'
author 'Fiv3Devs <https://fiv3devs.tebex.io/>'
description 'Pawnshop'
version '1.0.9'
lua54 'yes'

files {
	'5d_pawn_timecycle_mods.xml',
	'audio/5d_pawnshop_shell_game.dat151.rel'
}

client_script {
	'client.lua',
	'config.lua'
}

server_script {
	'server.lua'
}

escrow_ignore {
  'config.lua'
}

data_file 'TIMECYCLEMOD_FILE' '5d_pawn_timecycle_mods.xml'
data_file 'AUDIO_GAMEDATA' 'audio/5d_pawnshop_shell_game.dat'
dependency '/assetpacks'
dependency '/assetpacks'