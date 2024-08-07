local availableActions = {}
local cord = Config.Muztoplama
-- Muz toplama

local sonMuz = 1

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.Muztoplama[sonMuz].x, Config.Muztoplama[sonMuz].y, Config.Muztoplama[sonMuz].z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.Muztoplama[sonMuz].x, Config.Muztoplama[sonMuz].y, Config.Muztoplama[sonMuz].z, true)
        if dst2 < 4 then
            sleep = 2
            DrawMarker(2, Config.Muztoplama[sonMuz].x, Config.Muztoplama[sonMuz].y, Config.Muztoplama[sonMuz].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 100, 0, 254, 150, 0, 0, 0, 0, 0, 0, 0)
            DrawText3Ds(Config.Muztoplama[sonMuz].x, Config.Muztoplama[sonMuz].y, Config.Muztoplama[sonMuz].z + 0.3, '[E] Muz Topla')
            if dst2 < 1 then
                if IsControlJustReleased(0, 38) then
                    sonMuz = math.random(1, #Config.Muztoplama)
                    Muztopla()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)


function Muztopla()
    if not topluyormu then
        topluyormu = true
        exports['progressbar']:Progress({
            name = "Muztopla",
            duration = 2000,
            label = 'Muz topluyorsun...',
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
                TriggerServerEvent('xdMuztoplama')
                topluyormu = false
            else
            end
        end)
    end
end

--isleme

local cord = Config.xdMuzisleme

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
                DrawText3D(cord.x,cord.y,cord.z, '[E] Muzlarını İşle')
                if IsControlJustReleased(0, 38) then
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            TriggerServerEvent("xdMuzisleme")
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
        local blip = AddBlipForCoord(Config.MuztoplamaBlip.x, Config.MuztoplamaBlip.y, Config.MuztoplamaBlip.z)
        SetBlipSprite(blip, 286)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MuztoplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.MuzislemeBlip.x, Config.MuzislemeBlip.y, Config.MuzislemeBlip.z)
        SetBlipSprite(blip, 286)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MuzislemeBlipAd)
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
