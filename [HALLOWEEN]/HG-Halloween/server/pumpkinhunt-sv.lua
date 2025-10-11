

RegisterNetEvent('server:HG-Halloween:treatplayer', function()
    local src = source
    local chance = math.random(1, 100)
    if chance < 50 then
        ToggleMoney(src, 'add', 'cash', Config.Halloween.PumpkinHunt.Treat.Rewards.Money)
    else
        for item, amount in pairs(Config.Halloween.PumpkinHunt.Treat.Rewards.Items) do
            AddInvItem(src, item, amount)
        end
        Notify(src, Config.Halloween.Locals.PumpkinHunt['NotifyTreat'], '', 'success')
    end
end)
