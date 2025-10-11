fx_version 'cerulean'
--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'bzzz_halloween23'
version      '1.1.0'
description  'Halloween 2023'
author       'BzZz'

--[[ Manifest ]]--
shared_scripts {
}

client_scripts {
}

server_scripts {
}

escrow_ignore {
	'stream/*.ydr'
}

dependencies {

}



data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

files {
    'stream/*.ytyp'
}



dependency '/assetpacks'