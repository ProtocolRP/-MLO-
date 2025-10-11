--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'bzzz_cosmetics'
version      '1.2.0'
description  'Cosmetics'
author       'BzZz'

--[[ Manifest ]]--
shared_scripts {
}

client_scripts {
}

server_scripts {
}

escrow_ignore {
	'data/*.lua'
}

dependencies {

}



data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

files {
    'stream/*.ytyp',
}




dependency '/assetpacks'