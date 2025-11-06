fx_version "cerulean"
game "gta5"
lua54 "yes"

author 'MXC'
description 'LIQUORSTORE'
version '1.0.0'

this_is_a_map 'yes'

data_file 'TIMECYCLEMOD_FILE' 'mxc_timecycle_list_01.xml'
data_file 'AUDIO_GAMEDATA' '[audio]/mxc_liquorstore_game.dat'

files {
    'mxc_timecycle_list_01.xml',
    '[audio]/mxc_liquorstore_game.dat151.rel',
}

client_script {
    'liquorstore_entityset_mods.lua',
}

escrow_ignore {
    'liquorstore_entityset_mods.lua',
    'stream/[multi-location]/*.ydr',
}
dependency '/assetpacks'