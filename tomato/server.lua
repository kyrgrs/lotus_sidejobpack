local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("xdDomatestoplama")
AddEventHandler("xdDomatestoplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("tomato", math.random(Config.DomatesMin,Config.DomatesMax))
end)

RegisterNetEvent("xdDomatesisleme")
AddEventHandler("xdDomatesisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("tomato", Config.DomatesislemeMiktar) then
            xPlayer.Functions.AddItem("packagedtomatoes", 1)
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Domatesin suyunu sıktın!', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Domatesin Yok!', length = 2500})
    end
end)
