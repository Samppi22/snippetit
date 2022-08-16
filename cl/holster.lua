local holstered = true
local perse = false

local weapons = {
	"WEAPON_PISTOL",
	"WEAPON_PISTOL50" ,
	"WEAPON_HEAVYPISTOL" ,
	"WEAPON_VINTAGEPISTOL" ,
	"WEAPON_KNIFE",
	"WEAPON_SNSPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_DOUBLEACTION",
	"WEAPON_HAMMER",
	"WEAPON_MINISMG",
	"WEAPON_WRENCH",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_PISTOL_MK2",
	"WEAPON_DAGGER",
	"WEAPON_BAT",
	"WEAPON_BATTLEAXE",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_MICROSMG",
	"WEAPON_FLASHLIGHT",
	"WEAPON_CROWBAR",
	"WEAPON_POOLCUE",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_SMG",
	"WEAPON_COMBATPDW",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_GUSENBERG",
	"WEAPON_MUSKET",
	"WEAPON_BOTTLE",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_STUNGUN",
	"WEAPON_NIGHTSTICK",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_MG",
}

local pistol = {
	"WEAPON_PISTOL50",
	"WEAPON_REVOLVER",
	"WEAPON_DOUBLEACTION",
}

local police = {
	"WEAPON_STUNGUN",
	"WEAPON_COMBATPISTOL",
}

Citizen.CreateThread(function()
local ase = nil
	while true do
		Citizen.Wait(50)
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(PlayerPedId(), true) then
			loadAnimDict( "reaction@intimidation@1h" )
			loadAnimDict( "anim@weapons@pistol@doubleaction_holster" )
			loadAnimDict( "rcmjosh4" )
			if CheckWeapon(ped) then
				if holstered then
					if GetEntityHeightAboveGround(GetPlayerPed(-1)) > 6 then
						holstered = false
					else
						perse = true
						SetPedCanSwitchWeapon(ped, false)
						if CheckPosliini(ped) then
							ase = GetSelectedPedWeapon(ped)
							SetCurrentPedWeapon(ped, 0xA2719263, 1)
							TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
							Citizen.Wait(500)
							SetCurrentPedWeapon(ped, ase, 1)
							Citizen.Wait(750)
						else
							ase = GetSelectedPedWeapon(ped)
							SetCurrentPedWeapon(ped, 0xA2719263, 1)
							TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
							Citizen.Wait(500)
							SetCurrentPedWeapon(ped, ase, 1)
							Citizen.Wait(2000)
						end
						ClearPedTasks(ped)
						holstered = false
						if IsPedArmed(ped, 6) then
							Citizen.Wait(1000)
						end
						SetPedCanSwitchWeapon(ped, true)
						perse = false
					end
				end
			elseif not CheckWeapon(ped) then
				if not holstered then
					if GetEntityHeightAboveGround(GetPlayerPed(-1)) > 6 then
						holstered = true
					else
						perse = true
						SetPedCanSwitchWeapon(ped, false)
						SetCurrentPedWeapon(ped, ase, 1)
						if CheckPistol(ped) or CheckPosliini(ped) then
							TaskPlayAnim(ped, "anim@weapons@pistol@doubleaction_holster", "holster", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
						else							
							TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
						end
						Citizen.Wait(2000)
						SetCurrentPedWeapon(ped, 0xA2719263, 1)
						ClearPedTasks(ped)
						holstered = true
						SetPedCanSwitchWeapon(ped, true)
						perse = false
					end
				end
			end
			if not holstered then
				ase = GetSelectedPedWeapon(ped)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if perse then
			DisablePlayerFiring(ped, true)
			DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 257, true) -- Attack 2
			DisableControlAction(2, 263, true) -- Melee Attack 1
			DisableControlAction(2, 45, true) -- Reload
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
		end
	end
end)

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function CheckPistol(ped)
	for i = 1, #pistol do
		if GetHashKey(pistol[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function CheckPosliini(ped)
	for i = 1, #police do
		if GetHashKey(police[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end
