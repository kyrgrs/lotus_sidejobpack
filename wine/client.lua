local availableActions = {}
local cord = Config.Uzumtoplama
-- Uzum toplama

local sonUzum = 1

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.Uzumtoplama[sonUzum].x, Config.Uzumtoplama[sonUzum].y, Config.Uzumtoplama[sonUzum].z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.Uzumtoplama[sonUzum].x, Config.Uzumtoplama[sonUzum].y, Config.Uzumtoplama[sonUzum].z, true)
        if dst2 < 4 then
            sleep = 2
            DrawMarker(2, Config.Uzumtoplama[sonUzum].x, Config.Uzumtoplama[sonUzum].y, Config.Uzumtoplama[sonUzum].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
            DrawText3Ds(Config.Uzumtoplama[sonUzum].x, Config.Uzumtoplama[sonUzum].y, Config.Uzumtoplama[sonUzum].z + 0.3, '[E] Uzum Topla')
            if dst2 < 1 then
                if IsControlJustReleased(0, 38) then
                    sonUzum = math.random(1, #Config.Uzumtoplama)
                    Uzumtopla()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)


function Uzumtopla()
    if not topluyormu then
        topluyormu = true
        exports['progressbar']:Progress({
            name = "Uzumtopla",
            duration = 2000,
            label = 'Uzum topluyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('xdUzumtoplama')
                topluyormu = false
            else
            end
        end)
    end
end

--isleme

local cord = Config.xdUzumisleme

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, cord.x, cord.y, cord.z, true)
        if distance < 5 then
            sleep = 0
            DrawMarker(22,cord.x, cord.y, cord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.markerboyutu, Config.markerboyutu, Config.markerboyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 2 then
                DrawText3D(cord.x,cord.y,cord.z, '[E] Uzumlarını İşle')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            TriggerServerEvent("xdUzumisleme")
                        end
                    end)
                end
            else
                sleep = 1000
            end
        end
        Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end
--blips

if Config.xdblipac then
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumtoplamaBlip.x, Config.UzumtoplamaBlip.y, Config.UzumtoplamaBlip.z)
        SetBlipSprite(blip, 286)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 27)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumtoplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumislemeBlip.x, Config.UzumislemeBlip.y, Config.UzumislemeBlip.z)
        SetBlipSprite(blip, 286)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 27)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumislemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
end


-- NPC

local NPC = Config.ToplamaNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)
