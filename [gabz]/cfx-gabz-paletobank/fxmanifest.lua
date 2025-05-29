fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'Paleto Bank'
version '1.0.0'
lua54 'yes'
this_is_a_map 'yes'

dependencies {
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2545',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2545.
}

escrow_ignore {
    'stream/**/*.ytd',
    'paletobank.lua',
    'gabz_palbank_entitysets.lua'
}

client_script {
    "gabz_palbank_entitysets.lua"
}
dependency '/assetpacks'