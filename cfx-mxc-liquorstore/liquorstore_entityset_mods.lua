local interiors = {
    ["mxc_liquorstore_vespucci"] = {
        coords = vec3(-1221.86035, -909.5885, 12.6365032),
        sets = {
            ["mxc_liquorstore_dirt"] = false,
            ["mxc_liquorstore_barred_counter"] = false,
            ["mxc_liquorstore_nobarred_counter"] = true,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
    ["mxc_liquorstore_morningwood"] = {
        coords = vec3(-1484.85242, -377.8912, 40.4765),
        sets = {
            ["mxc_liquorstore_dirt"] = false,
            ["mxc_liquorstore_barred_counter"] = true,
            ["mxc_liquorstore_nobarred_counter"] = false,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
    ["mxc_liquorstore_elrancho"] = {
        coords = vec3(1133.119, -982.0851, 46.73512),
        sets = {
            ["mxc_liquorstore_dirt"] = true,
            ["mxc_liquorstore_barred_counter"] = true,
            ["mxc_liquorstore_nobarred_counter"] = false,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
    ["mxc_liquorstore_banhamcanyon"] = {
        coords = vec3(-2965.383, 390.147064, 15.3599787),
        sets = {
            ["mxc_liquorstore_dirt"] = true,
            ["mxc_liquorstore_barred_counter"] = false,
            ["mxc_liquorstore_nobarred_counter"] = true,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
    ["mxc_liquorstore_paletobay"] = {
        coords = vec3(-163.1769, 6321.866, 31.8851776),
        sets = {
            ["mxc_liquorstore_dirt"] = false,
            ["mxc_liquorstore_barred_counter"] = false,
            ["mxc_liquorstore_nobarred_counter"] = true,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
    ["mxc_liquorstore_sandyshores"] = {
        coords = vec3(2447.675, 4062.20679, 38.3696938),
        sets = {
            ["mxc_liquorstore_dirt"] = true,
            ["mxc_liquorstore_barred_counter"] = true,
            ["mxc_liquorstore_nobarred_counter"] = false,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
    ["mxc_liquorstore_route68"] = {
        coords = vec3(1166.55212, 2711.90161, 38.4608574),
        sets = {
            ["mxc_liquorstore_dirt"] = true,
            ["mxc_liquorstore_barred_counter"] = false,
            ["mxc_liquorstore_nobarred_counter"] = true,
            ["mxc_liquorstore_fakewindows"] = false,
        }
    },
}


for name, v in pairs(interiors) do
    RequestIpl(name)
    local interior = GetInteriorAtCoordsWithType(v.coords, "mxc_liquorstore_col")

    if IsValidInterior(interior) then
        for name, enable in pairs(v.sets) do
            if enable then
                ActivateInteriorEntitySet(interior, name)
            else
                DeactivateInteriorEntitySet(interior, name)
            end
        end

        RefreshInterior(interior)
    end
end
