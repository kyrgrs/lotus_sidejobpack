local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("xdKarpuztoplama")
AddEventHandler("xdKarpuztoplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("watermelon", math.random(Config.KarpuzMin,Config.KarpuzMax))
end)

RegisterNetEvent("xdKarpuzisleme")
AddEventHandler("xdKarpuzisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("watermelon", Config.KarpuzislemeMiktar) then
            xPlayer.Functions.AddItem("watermelonjuice", 1)
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Karpuzun suyunu sıktın!', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Kokainin Yok!', length = 2500})
    end
end)

