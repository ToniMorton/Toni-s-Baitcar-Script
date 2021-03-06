---------------------------------------------------------------------
-- BAITCAR SCRIPT --
---------------------------------------------------------------------
local isInBaitCar = false
RegisterNetEvent("simp:baitCarDisable")
AddEventHandler("simp:baitCarDisable", function()
	local ped_l = GetPlayerPed(-1)
	local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
	if IsPedInAnyVehicle(ped_l, false) then
			SetVehicleDoorShut(veh, 0, true)
			SetVehicleDoorShut(veh, 1, true)
			SetVehicleDoorShut(veh, 2, true)
			SetVehicleDoorShut(veh, 3, true)
			SetVehicleDoorShut(veh, 4, true)
			SetVehicleDoorShut(veh, 5, true)
			TaskVehicleTempAction(ped_l, veh, 27, 5000)
			PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", 1)
			isInBaitCar = true
			SetVehicleEngineHealth(veh, 0)
			Citizen.CreateThread(function()
				while isInBaitCar do
					SetVehicleEngineOn(veh, false), false, true, false)
					Citizen.Wait(0)
				end
			)
			SetVehicleDoorsLocked(veh, false), 4)
			SetNotificationTextEntry("STRING")
			AddTextComponentString('~r~WARNING:~s~~n~You are currently inside of a Bait Car, You will be placed under arrest shortly.')
			DrawNotification(true, true)
	end
end)

RegisterNetEvent("simp:baitCarunlock")
AddEventHandler("simp:baitCarunlock", function()
	local ped_l = GetPlayerPed(-1)
	local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
	if IsPedInAnyVehicle(ped_l, false) then
			isInBaitCar = false
			SetVehicleEngineHealth(veh, 150.0)
			SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, true, false)
			SetVehicleDoorsLocked(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2)
			SetVehicleDoorsLocked(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1)
			SetNotificationTextEntry("STRING")
			AddTextComponentString('~y~Info:~s~~n~Step out of the Vehicle and follow the instructions you are given.')
			DrawNotification(true, true)
	end
end)

-----------------------------------------------------------------------------------------------------------------------
-- CREATED BY TONI MORTON FOR THE FIVEM COMMUNITY, PLEASE GIVE CREDITS TO ME IF YOU USE THIS SCRIPT IN YOUR SERVER.  --
-- https://github.com/ToniMorton/
-- 
-----------------------------------------------------------------------------------------------------------------------
