local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("xdMuztoplama")
AddEventHandler("xdMuztoplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("banana", math.random(Config.MuzMin,Config.MuzMax))
end)

RegisterNetEvent("xdMuzisleme")
AddEventHandler("xdMuzisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("banana", Config.MuzislemeMiktar) then
            xPlayer.Functions.AddItem("packagedbanana", 1)
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Muzun İşledin!', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Muzun Yok!', length = 2500})
    end
end)
