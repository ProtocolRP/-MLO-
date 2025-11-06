Weapons = {
    ['WEAPON_MP8_TRICKORTREAT'] = {
        label = 'Mp8 Trickortreat',
        weight = 1400,
        durability = 0.05,
        ammoname = 'ammo-45'
    },
}

Components = {
    ['at_grip'] = {
        label = 'Grip',
        weight = 50,
        client = {
            component = {
                `did_mp8_trickortreat_afgrip`,
            },
            usetime = 1
        }
    },
    ['at_flashlight'] = {
        label = 'Flashlight',
        weight = 50,
        client = {
            component = {
                `did_mp8_trickortreat_flsh`,
            },
            usetime = 1
        }
    },
    ['at_clip_default'] = {
        label = 'Clip Default',
        weight = 50,
        client = {
            component = {
                `did_mp8_trickortreat_mag1`,
            },
            usetime = 1
        }
    },
    ['at_clip_extended'] = {
        label = 'Clip Extended',
        weight = 50,
        client = {
            component = {
                `did_mp8_trickortreat_mag2`,
            },
            usetime = 1
        }
    },
    ['at_scope'] = {
        label = 'Scope',
        weight = 50,
        client = {
            component = {
                `did_mp8_trickortreat_scope`,
            },
            usetime = 1
        }
    },
    ['at_suppressor'] = {
        label = 'Suppressor',
        weight = 50,
        client = {
            component = {
                `did_mp8_trickortreat_supp`,
            },
            usetime = 1
        }
    },
}
