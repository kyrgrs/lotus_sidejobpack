local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("xdPortakaltoplama")
AddEventHandler("xdPortakaltoplama", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("orange", math.random(Config.PortakalMin,Config.PortakalMax))
end)

RegisterNetEvent("xdPortakalisleme")
AddEventHandler("xdPortakalisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100)
    if xPlayer.Functions.RemoveItem("orange", Config.PortakalislemeMiktar) then
            xPlayer.Functions.AddItem("orangejucie", 1)
        TriggerClientEvent('QBCore:Notify', source, { type = 'success', text = 'Portakalın suyunu sıktın!', length = 2500})
    else
        TriggerClientEvent('QBCore:Notify', source, { type = 'error', text = 'Yeterince Portakalın Yok!', length = 2500})
    end
end)
