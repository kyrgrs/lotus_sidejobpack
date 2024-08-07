local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("xdUzumtoplama")
AddEventHandler("xdUzumtoplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("grape", math.random(Config.UzumMin,Config.UzumMax))
end)

RegisterNetEvent("xdUzumisleme")
AddEventHandler("xdUzumisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("grape", Config.UzumislemeMiktar) then
            xPlayer.Functions.AddItem("wine", 1)
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Üzümün suyunu sıktın!', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Kokainin Yok!', length = 2500})
    end
end)

