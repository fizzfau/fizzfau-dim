local input_key = 215 -- enter

Citizen.CreateThread(function()
    while true do
        sleep = 1000
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            sleep = 0
            if IsControlJustPressed(0, input_key) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                Dim(vehicle)
            end
        end
        Citizen.Wait(sleep)
    end
end)

function Dim(vehicle)
    local lightsOn, highbeamsOn = GetVehicleLightsState(vehicle)
    if highbeamsOn == 0 then
        for i = 1, 2 do
            SetVehicleLights(vehicle, 2)
            Citizen.Wait(75)
            SetVehicleLights(vehicle, 0)
            Citizen.Wait(75)
        end
    else
        for i = 1, 2 do
            SetVehicleFullbeam(vehicle, false)
            Citizen.Wait(75)
            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(75)
            SetVehicleFullbeam(vehicle, false)
        end
    end
end