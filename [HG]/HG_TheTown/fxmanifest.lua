fx_version 'cerulean'
game { 'gta5' }
author 'HG_Designs'
description 'The Town Bar & Grill Restaurant'
version '3.0'
this_is_a_map 'yes'
lua54 'yes'

files {
    'hg_thetown_timecycle.xml',
    'audio/hg_thetown_doors_game.dat151.rel',
    'audio/hg_thetown_game.dat151.rel',
}

data_file 'TIMECYCLEMOD_FILE' 'hg_thetown_timecycle.xml'
data_file 'AUDIO_GAMEDATA' 'audio/hg_thetown_doors_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/hg_thetown_game.dat'

escrow_ignore {
    'stream/*.ytyp',
    'stream/*.ymap',
    'stream/*.ymf',
    'stream/*.ytd',
    'stream/*.ybn',
    'stream/logo',
  }
dependency '/assetpacks'