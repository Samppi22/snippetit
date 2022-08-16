local ESX 			= nil
local PlayerData 	= {}
----------------------------------------------------------------------------------------
korjaa = false
vaihe1 = false
vaihe2 = false
vaihe3 = false
vaihe4 = false
vaihe5 = false
vaihe6 = false
maksuilmotus = false
mikaajoneuvo = false
korjauksessa = false
----------------------------------------------------------------------------------------
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)
----------------------------------------------------------------------------------------
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)
----------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
----------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while korjaa == true do
		SetVehicleUndriveable(vehicle,true)
		Citizen.Wait(0)
	end
end)
----------------------------------------------------------------------------------------
RoboMeksu = { {1150.04,-776.92,56.59} } -- MirrorPark
--RoboMeksu2 = { {257.00, 2597.71, 44.78} } -- Sandy
--RoboMeksu3 = { {-77.96, 6419.24, 30.81} } -- Paleto

----------------------------------------------------------------------------------------
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1000)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #RoboMeksu do
				garageCoords2 = RoboMeksu[i]
				while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true) < 50 do
					Citizen.Wait(4)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
						if not korjauksessa and IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
							ESX.ShowHelpNotification('~INPUT_CONTEXT~ korjauttaksesi ajoneuvo')
							if(IsControlJustPressed(0, 38)) then
								KorjausMenu()
								insidemarkercheck = true
							end
						end
					end
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) > 5 then
						if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'robomeksu_menu') then
							ESX.UI.Menu.CloseAll()
						end
					end

						if vaihe1 == true and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == false then
							ESX.ShowNotification("~p~[Itsepalvelu]~w~~n~Moro! Pistetääs auto solmuun ~n~Ootas hetki")
							ESX.ShowNotification("~p~[Itsepalvelu]~w~~n~Arviolta sanoisin et menis noin..~p~ 1 min")
						end
	
						if vaihe1 == false and vaihe2 == true and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == true and vaihe4 == false and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == true and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == true and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == true then end 
	 
					if mikaajoneuvo == true then
						if IsControlJustPressed(0, 38) then
							SetVehicleDoorsLocked(vehicle, 2)
							vaihe6 = false
							locked = true
							Citizen.Wait(4000)
							locked = false
						end
					end
				end
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

--[[Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1000)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #RoboMeksu2 do
				garageCoords3 = RoboMeksu2[i]
				while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords3[1], garageCoords3[2], garageCoords3[3], true) < 50 do
					Citizen.Wait(4)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords3[1], garageCoords3[2], garageCoords3[3], true ) < 5 then
						if not korjauksessa and IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
							ESX.ShowHelpNotification('~INPUT_CONTEXT~ korjauttaksesi ajoneuvo')
							if(IsControlJustPressed(0, 38)) then
								KorjausMenu()
								insidemarkercheck = true
							end
						end
					end
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords3[1], garageCoords3[2], garageCoords3[3], true ) > 5 then
						if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'robomeksu_menu') then
							ESX.UI.Menu.CloseAll()
						end
					end

						if vaihe1 == true and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == false then
							
						end
	
						if vaihe1 == false and vaihe2 == true and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == true and vaihe4 == false and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == true and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == true and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == true then end 
	 
					if mikaajoneuvo == true then
						if IsControlJustPressed(0, 38) then
							SetVehicleDoorsLocked(vehicle, 2)
							vaihe6 = false
							locked = true
							Citizen.Wait(4000)
							locked = false
						end
					end
				end
			end
		else
			Citizen.Wait(5000)
		end
	end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1000)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #RoboMeksu3 do
				garageCoords4 = RoboMeksu3[i]
				while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords4[1], garageCoords4[2], garageCoords4[3], true) < 50 do
					Citizen.Wait(4)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords4[1], garageCoords4[2], garageCoords4[3], true ) < 5 then
						if not korjauksessa and IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
							ESX.ShowHelpNotification('~INPUT_CONTEXT~ korjauttaksesi ajoneuvo')
							if(IsControlJustPressed(0, 38)) then
								KorjausMenu()
								insidemarkercheck = true
							end
						end
					end
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords4[1], garageCoords4[2], garageCoords4[3], true ) > 5 then
						if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'robomeksu_menu') then
							ESX.UI.Menu.CloseAll()
						end
					end

						if vaihe1 == true and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == false then
						
						end
	
						if vaihe1 == false and vaihe2 == true and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == true and vaihe4 == false and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == true and vaihe5 == false and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == true and vaihe6 == false then end 
						if vaihe1 == false and vaihe2 == false and vaihe3 == false and vaihe4 == false and vaihe5 == false and vaihe6 == true then end 
	 
					if mikaajoneuvo == true then
						if IsControlJustPressed(0, 38) then
							SetVehicleDoorsLocked(vehicle, 2)
							vaihe6 = false
							locked = true
							Citizen.Wait(4000)
							locked = false
						end
					end
				end
			end
		else
			Citizen.Wait(5000)
		end
	end
end)]]--
----------------------------------------------------------------------------------------
local menuEnabled = false 
function ToggleActionMenu()

		menuEnabled = not menuEnabled
	if ( menuEnabled ) then 
		SetNuiFocus( true, true )

		SendNUIMessage({
			showmenu = true 
		})
	else 
		SetNuiFocus( false )

		SendNUIMessage({
			hidemenu = true 
		})
	end 
end 
----------------------------------------------------------------------------------------
RegisterNetEvent('esx_robomeksu:onnistunut')
AddEventHandler('esx_robomeksu:onnistunut', function(price)
	local ped = GetPlayerPed(-1)
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
	local veh = GetClosestVehicle(x, y, z, 4.001, 0, 70)
	local veh2 = GetVehiclePedIsIn (GetPlayerPed (-1), true)
	local lastcar = GetPlayersLastVehicle(GetPlayerPed (-1))
	local theshop = 1150.04,-776.92,56.59
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
----------------------------------------------------------------------------------------
	vehicle = GetVehiclePedIsIn(ped, false)
	SetVehicleDoorsLocked(vehicle, 2)
	TaskLeaveVehicle(ped, vehicle, 1) 
	SetVehicleUndriveable(veh2, true) 
	korjauksessa = true
	ESX.ShowNotification("Maksoit tästä paskasta palvelusta: ~r~1250€")
	Citizen.Wait(3000)
	payalert = true 
	Citizen.Wait(3000)
	payalert = false 
	vaihe1 = true 
	SetVehicleDoorOpen(veh2, 4, false, false)   
    Citizen.Wait(30000)
	vaihe1 = false
    vaihe2 = true
    Citizen.Wait(5000)
    vaihe2 = false
    vaihe3 = true 
    Citizen.Wait(10000)
    vaihe3 = false 
    vaihe4 = true
    Citizen.Wait(3000)
    vaihe4 = false
    vaihe5 = true
    Citizen.Wait(2500)
	SetVehicleFixed(veh2) 
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),  false),  0.0000000001) 
    SetVehicleEngineHealth( veh2, 1000 )
    SetVehicleEngineOn( veh2, true, true ) 
    SetVehicleFixed( veh2 ) 
	SetVehicleDoorsLocked(veh2, 1) 
	SetVehicleUndriveable(veh, false)
	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	vaihe5 = false 
	vaihe6 = true 
	mikaajoneuvo = true 
	Citizen.Wait(5000)
	Citizen.Wait(5000)
	vaihe6 = false 
	ESX.ShowNotification("~p~[Itsepalvelu]~w~~n~No nyt on ~g~valmista!")
	mikaajoneuvo = false 
	Wait(5000)
	korjauksessa = false
end)
----------------------------------------------------------------------------------------
RegisterNetEvent('esx_robomeksu:eirahaa')
AddEventHandler('esx_robomeksu:eirahaa', function(moneyleft)
	ESX.ShowNotification("Vitun apina sulta puuttuu: ~r~" .. moneyleft .. " €")
end)
--------------------------------------------------------------------------------------
function Draw3DText2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local scale = 1.0
   
    if onScreen then
        SetTextScale(0.0*scale, 0.25*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(0, 255, 0, 0)
        SetTextDropshadow(0, 0, 255, 0, 0)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    	DrawRect(_x,_y+0.0125, 0.013+ factor, 0.03, 0, 0, 0, 68)
    end
end
----------------------------------------------------------------------------------------
function KorjausMenu()

    local elements = {
        { label = 'Korjaus <font color="red">1250€</font>', value = "korjaus" },
    }

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'robomeksu_menu',
        {
            title    = "Itsepalvelu meksu",
            align    = 'center',
            elements = elements
        },
    function(data, menu)

        local action = data.current.value

        if action == "korjaus" then
			TriggerServerEvent('esx_robomeksu:rahatarkistus')
            --TriggerEvent('esx_robomeksu:onnistunut')
    	end

        menu.close()

    end, function(data, menu)
        menu.close()
    end)
end
----------------------------------------------------------------------------------------
function GetClosestVehicleToPlayer()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	local radius = 3.0
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 10, plyPed, 7)
	local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
	return vehicle
end
----------------------------------------MAP BLIP----------------------------------------
local blips = {
	{title="Itsepalvelu korjaus", colour=76, id=446, x=1149.82, y=-777.67, z=45.565},
	--{title="Korjaamo", colour=76, id=446, x=257.30, y=2598.17, z=45.565},
	--{title="Korjaamo", colour=76, id=446, x=-77.96, y=6419.24, z=45.565},
}

   Citizen.CreateThread(function()
	   for _, info in pairs(blips) do
		 info.blip = AddBlipForCoord(info.x, info.y, info.z)
		 SetBlipSprite(info.blip, info.id)
		 SetBlipDisplay(info.blip, 4)
		 SetBlipScale(info.blip, 0.8)
		 SetBlipColour(info.blip, info.colour)
		 SetBlipAsShortRange(info.blip, true)
		 BeginTextCommandSetBlipName("STRING")
		 AddTextComponentString(info.title)
		 EndTextCommandSetBlipName(info.blip)
	   end
   end)
----------------------------------------------------------------------------------------