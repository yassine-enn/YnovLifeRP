ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

--------

function OpenLocationWZ()
    local Main = RageUI.CreateMenu("Location", "~g~Location Véhicule") 

    RageUI.Visible(Main, not RageUI.Visible(Main))
    FreezeEntityPosition(PlayerPedId(), true)

    while Main do 
        Citizen.Wait(0)
    
        RageUI.IsVisible(Main, true, true, true, function()

        RageUI.Separator("↓ ~g~Scooter~w~ ↓")

            for k, v in pairs(Config.deuxroues) do
            RageUI.Button(v.label, "Louer un " ..v.label.. " pour ~g~" ..v.price.. "$", {RightLabel = ""..v.price.."$"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent('{-WayZe#0001-}::Location', v.price, v.label, v.model)
                        RageUI.CloseAll()
                    end
                end)
            end

        RageUI.Separator("↓ ~g~Voiture~w~ ↓")

            for k, v in pairs(Config.voiture) do
            RageUI.Button(v.label, "Louer une " ..v.label.. " pour ~g~" ..v.price.. "$", {RightLabel = ""..v.price.."$"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent('{-WayZe#0001-}::Location', v.price, v.label, v.model)
                        RageUI.CloseAll()
                    end
                end)
            end
        end)

            if not RageUI.Visible(Main) then
                Main = RMenu:DeleteType("Main", true)
                FreezeEntityPosition(PlayerPedId(), false)
                end
            end
        end
        

RegisterNetEvent('{-WayZe#0001-}::Location:spawnCar')
AddEventHandler('{-WayZe#0001-}::Location:spawnCar', function(car)

    local car = GetHashKey(car)
    local retval = PlayerPedId()

    ESX.ShowAdvancedNotification('Banque', '~g~Paiement accepté', "Merci pour votre confiance, n'oubliez pas de respecter le code de la route !", "CHAR_BANK_MAZE", 1)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    Citizen.Wait(500)
    local vehicle = CreateVehicle(car, -511.63, -262.35, 35.45, 295.85, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "Location"
    SetVehicleNumberPlateText(vehicle, plaque) 
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
end)


-- MENU

    Citizen.CreateThread(function()
        while true do
            local wait = 500
                for k in pairs(Config.positionmenu) do
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.positionmenu[k].x, Config.positionmenu[k].y, Config.positionmenu[k].z)
                        if dist <= 1.0 then
                        wait = 0
                        RageUI.Text({
                            message = "Appuyez sur [~g~E~w~] pour parler au ~g~Loueur",
                            time_display = 1
                       })
                        if IsControlJustPressed(1,51) then
                            OpenLocationWZ()
                        end
                    end
                end
            Citizen.Wait(wait)
        end
    end)

-- PED

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_lazlow")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    for k,v in pairs(Config.ped) do
    ped = CreatePed("PED_TYPE_CIVMALE", "cs_lazlow", v.x, v.y, v.z, v.a, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    end
end)


-- BLIPS

Citizen.CreateThread(function()
    for k, v in pairs(Config.blipsvoiture) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
    
        SetBlipSprite(blip, 225)
        SetBlipScale (blip, 0.9)
        SetBlipColour(blip, 43)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Location Voiture')
        EndTextCommandSetBlipName(blip)
    end
end)