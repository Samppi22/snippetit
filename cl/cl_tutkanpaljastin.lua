ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local poliisiautot = {'POLICE', 'POLICE2', 'POLICE3', 'PINKKIS', 'SHERSCOUT', 'POLICEOLD', 'POLICEOLD2', 'POLICEB', 'FBI', 'FBI2', 'SHERIFF', 'SHERIFF2', '2015POLSTANG', '1200RT'}
local paalla = false

Citizen.CreateThread(function()
	while true do
		local etaisyys = 100
		if paalla then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				local omaauto = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				local pelaajansijainti = GetEntityCoords(GetPlayerPed(-1))
				local autot = ESX.Game.GetVehiclesInArea(pelaajansijainti, 400.0)
				if #autot > 0 then
					for k,v in ipairs(autot) do
						if IsVehicleStolen(v) then
							local lahinpoliisiauto = v
							if lahinpoliisiauto ~= omaauto then
								for x,d in pairs(poliisiautot) do
									if GetDisplayNameFromVehicleModel(GetEntityModel(lahinpoliisiauto)) == d then
										if GetPedInVehicleSeat(lahinpoliisiauto, -1) ~= 0 then
											local poliisiautonsijainti = GetEntityCoords(lahinpoliisiauto)
											local uusietaisyys = Vdist(pelaajansijainti.x, pelaajansijainti.y, pelaajansijainti.z, poliisiautonsijainti.x, poliisiautonsijainti.y, poliisiautonsijainti.z)
											PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
											FlashMinimapDisplay()
											if uusietaisyys < etaisyys then
												etaisyys = uusietaisyys
											end
											if etaisyys < 20 then
												etaisyys = 20
											end
										end
									end
								end
							end
						end
					end
				end
			else
				paalla = false
				ShowAdvancedNotification('Tutkanpaljastin', '~r~OFF', '', 'CHAR_BUGSTARS', 7)
			end
		end
		Citizen.Wait(etaisyys*10)
	end
end)

RegisterNetEvent('tutkanpaljastus:kaynnistys')
AddEventHandler('tutkanpaljastus:kaynnistys', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		if paalla then
			ShowAdvancedNotification('Tutkanpaljastin', '~r~OFF', '', 'CHAR_BUGSTARS', 7)
		else
			ShowAdvancedNotification('Tutkanpaljastin', '~g~ON', '', 'CHAR_BUGSTARS', 7)
		end
		paalla = not paalla
	else
		ShowAdvancedNotification('TUTKANPALJASTIN', '~y~TOIMII AUTOSSA?', '', 'CHAR_BUGSTARS', 7)
	end
end)

function ShowAdvancedNotification(title, subject, msg, icon, iconType)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)
end