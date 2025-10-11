
local ConfigCore = Config.Halloween.LegionPark

lib.zones.sphere({
    coords = ConfigCore.Graveyard.Coords,
    radius = 20,
    debug = Config.Halloween.Debug,
    onEnter = function()
        local Link = ConfigCore.Graveyard.Link
        exports["xsound"]:PlayUrl("LGG1", Link, ConfigCore.Graveyard.Volume, true)
    end,
    onExit = function()
        exports["xsound"]:Destroy("LGG1")
    end
})

-- Big Pumpkin
lib.zones.sphere({
    coords = ConfigCore.BigPumpKin.Coords,
    radius = 20,
    debug = Config.Halloween.Debug,
    onEnter = function()
        local Link = ConfigCore.BigPumpKin.Link
        exports["xsound"]:PlayUrl("LGG2", Link, ConfigCore.Graveyard.Volume, true)
    end,
    onExit = function()
        exports["xsound"]:Destroy("LGG2")
    end
})